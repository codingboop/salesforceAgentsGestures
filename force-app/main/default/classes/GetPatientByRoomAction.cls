/**
 * Custom action to get patient information by room number
 */
public with sharing class GetPatientByRoomAction implements AgentforceActionInterface {

    /**
     * Execute the action to get patient information by room number
     * @param request The action request containing the room number
     * @return The action result containing the patient information
     */
    public AgentforceActionResult execute(AgentforceActionRequest request) {
        try {
            Map<String, Object> parameters = request.getParameters();
            String roomNumber = (String) parameters.get('roomNumber');

            if (String.isBlank(roomNumber)) {
                return new AgentforceActionResult('ERROR', 'Room number is required');
            }

            // Query for the OR session with the given room number
            List<OR_Session__c> orSessions = [
                SELECT Id, Name, Patient__c, Patient__r.Name, OR_Room__c, Status__c
                FROM OR_Session__c
                WHERE OR_Room__c = :roomNumber
                LIMIT 1
            ];

            if (orSessions.isEmpty()) {
                return new AgentforceActionResult('ERROR', 'No patient found in room ' + roomNumber);
            }

            OR_Session__c orSession = orSessions[0];

            // Get vital signs for the patient
            List<Vital_Sign_Reading__c> vitalSigns = [
                SELECT Id, Name, Vital_Type__c, Value__c, Unit__c, Timestamp__c
                FROM Vital_Sign_Reading__c
                WHERE Patient__c = :orSession.Patient__c
                ORDER BY Timestamp__c DESC
                LIMIT 10
            ];

            // Build the response
            String patientInfo = 'Patient: ' + orSession.Patient__r.Name +
                                '\nRoom: ' + orSession.OR_Room__c +
                                '\nStatus: ' + orSession.Status__c;

            String vitalSignsInfo = '\n\nVital Signs:';
            for (Vital_Sign_Reading__c vs : vitalSigns) {
                vitalSignsInfo += '\n' + vs.Vital_Type__c + ': ' + vs.Value__c + ' ' + vs.Unit__c;
            }

            String responseMessage = patientInfo + vitalSignsInfo;

            return new AgentforceActionResult('SUCCESS', responseMessage);

        } catch (Exception e) {
            return new AgentforceActionResult('ERROR', 'Error retrieving patient information: ' + e.getMessage());
        }
    }
}
