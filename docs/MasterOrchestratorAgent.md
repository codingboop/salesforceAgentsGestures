# OR Master Orchestrator Agent

## Description

The OR Master Orchestrator is an AI Agent designed to help operating theater staff with patient briefings, vital sign monitoring, and post-operative care management. It orchestrates data from various sources to provide comprehensive information to medical staff.

## Agent Configuration

### Agent Details
- **Agent Name**: OR Master Orchestrator
- **Agent ID**: 0XxdL000000cM7ZSAU
- **Version ID**: 0X9dL000001UFNdSAO

### Agent Instructions

1. If the query is about patient information, use Get Patient By Room to access patient data directly.
2. Once the patient is identified, use Get Patient Briefing to provide a summary of the patient's information.
3. If specific surgical details are requested, use Knowledge Agent to provide procedural guidance.

## Custom Actions

### GetPatientByRoomAction

This custom action retrieves patient information based on the room number. It queries the OR_Session__c object to find the patient in the specified room, and then retrieves vital sign readings for that patient.

#### Input Parameters
- **roomNumber**: The room number where the patient is located

#### Output
- A formatted string containing patient information and vital signs

### MasterOrchestratorService

This service class provides methods for retrieving patient briefings based on patient identifiers.

#### Methods
- **getPatientBriefing**: Retrieves a patient briefing based on patient identifier

#### Input Parameters
- **patientIdentifier**: Patient identifier (name, ID, or room number)
- **roomNumber**: Room number where the patient is located (optional)

#### Output
- A PatientBriefingResponse object containing the briefing text and surgical plan ID

### BriefingAgentService

This service class provides methods for retrieving patient demographic information.

#### Methods
- **getPatientDemographics**: Retrieves patient demographic information

#### Input Parameters
- **patientIdentifier**: Patient identifier (name, ID, or room number)

#### Output
- A DemographicsResponse object containing patient name, age, gender, and contact information

## Data Model

The agent interacts with the following custom objects:

- **OR_Session__c**: Represents an operating room session
  - Fields: Patient__c, OR_Room__c, Status__c

- **Vital_Sign_Reading__c**: Represents a vital sign reading for a patient
  - Fields: Patient__c, Vital_Type__c, Value__c, Unit__c, Timestamp__c

## Integration with Voice Activation

The Master Orchestrator agent is designed to be integrated with voice activation capabilities, allowing hands-free access to patient briefings and other agent actions through the demo web app.
