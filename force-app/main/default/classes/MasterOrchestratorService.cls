/**
 * Service class for the Master Orchestrator Agent
 */
public with sharing class MasterOrchestratorService {

    /**
     * Wrapper class for patient briefing request parameters
     */
    public class PatientBriefingRequest {
        @InvocableVariable(label='Patient Identifier' description='Patient identifier (name, ID, or room number)' required=true)
        public String patientIdentifier;

        @InvocableVariable(label='Room Number' description='Room number where the patient is located' required=false)
        public String roomNumber;
    }

    /**
     * Wrapper class for patient briefing response
     */
    public class PatientBriefingResponse {
        @InvocableVariable(label='Briefing Text' description='Complete patient briefing text')
        public String briefingText;

        @InvocableVariable(label='Surgical Plan ID' description='ID of the associated surgical plan')
        public String surgicalPlanId;
    }

    /**
     * Retrieves a patient briefing based on patient identifier
     * @param requests List of PatientBriefingRequest objects
     * @return List of PatientBriefingResponse objects
     */
    @InvocableMethod(label='Get Patient Briefing' description='Retrieves a patient briefing based on patient identifier')
    public static List<PatientBriefingResponse> getPatientBriefing(List<PatientBriefingRequest> requests) {
        List<PatientBriefingResponse> responses = new List<PatientBriefingResponse>();

        for (PatientBriefingRequest request : requests) {
            PatientBriefingResponse response = new PatientBriefingResponse();

            try {
                // Query for the patient and surgical plan
                // This is a placeholder implementation
                response.briefingText = 'Patient briefing for ' + request.patientIdentifier +
                    (String.isNotBlank(request.roomNumber) ? ' in room ' + request.roomNumber : '');
                response.surgicalPlanId = 'SP-' + String.valueOf(Math.random()).substring(2, 8);
            } catch (Exception e) {
                response.briefingText = 'Error: ' + e.getMessage();
            }

            responses.add(response);
        }

        return responses;
    }
}
