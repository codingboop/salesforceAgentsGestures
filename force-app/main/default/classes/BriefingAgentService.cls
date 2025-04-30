/**
 * Service class for the Briefing Agent
 */
public with sharing class BriefingAgentService {

    /**
     * Wrapper class for patient demographics request parameters
     */
    public class DemographicsRequest {
        @InvocableVariable(label='Patient Identifier' description='Patient identifier (name, ID, or room number)' required=true)
        public String patientIdentifier;
    }

    /**
     * Wrapper class for patient demographics response
     */
    public class DemographicsResponse {
        @InvocableVariable(label='Patient Name' description='Full name of the patient')
        public String patientName;

        @InvocableVariable(label='Patient Age' description='Age of the patient')
        public Integer patientAge;

        @InvocableVariable(label='Patient Gender' description='Gender of the patient')
        public String patientGender;

        @InvocableVariable(label='Patient Contact Info' description='Contact information for the patient')
        public String patientContactInfo;
    }

    /**
     * Retrieves patient demographic information
     * @param requests List of DemographicsRequest objects
     * @return List of DemographicsResponse objects
     */
    @InvocableMethod(label='Get Patient Demographics' description='Retrieves patient demographic information')
    public static List<DemographicsResponse> getPatientDemographics(List<DemographicsRequest> requests) {
        List<DemographicsResponse> responses = new List<DemographicsResponse>();

        for (DemographicsRequest request : requests) {
            DemographicsResponse response = new DemographicsResponse();

            try {
                // Query for the patient demographics
                // This is a placeholder implementation
                response.patientName = 'John Doe';
                response.patientAge = 45;
                response.patientGender = 'Male';
                response.patientContactInfo = 'Phone: 555-123-4567';
            } catch (Exception e) {
                response.patientName = 'Error: ' + e.getMessage();
            }

            responses.add(response);
        }

        return responses;
    }
}
