# Salesforce Agentforce - OR Master Orchestrator

This repository contains the code for the OR Master Orchestrator agent, which is part of the AuraORAssistant project for the Salesforce Agentforce Hackathon.

## Overview

The OR Master Orchestrator is an AI Agent designed to help operating theater staff with patient briefings, vital sign monitoring, and post-operative care management. It orchestrates data from various sources to provide comprehensive information to medical staff.

## Agent Details

- **Agent Name**: OR Master Orchestrator
- **Agent ID**: 0XxdL000000cM7ZSAU
- **Version ID**: 0X9dL000001UFNdSAO

## Components

### Interfaces and Helper Classes

- **AgentforceActionInterface**: Interface that all custom action classes must implement
- **AgentforceActionRequest**: Class representing a request from Agentforce to execute a custom action
- **AgentforceActionResult**: Class representing a result from a custom action for Agentforce

### Agent Services

- **MasterOrchestratorService**: Service class for the Master Orchestrator Agent
- **BriefingAgentService**: Service class for the Briefing Agent
- **GetPatientByRoomAction**: Custom action to get patient information by room number

## Usage

The Master Orchestrator agent is configured to use custom actions to access dummy data directly, rather than trying to use the standard Salesforce actions that require CRM access.

### Agent Instructions

1. If the query is about patient information, use Get Patient By Room to access patient data directly.
2. Once the patient is identified, use Get Patient Briefing to provide a summary of the patient's information.
3. If specific surgical details are requested, use Knowledge Agent to provide procedural guidance.

## Deployment

This code can be deployed to a Salesforce org using the Salesforce CLI:

```bash
sf project deploy start --source-dir force-app --target-org YourOrgAlias
```

## Configuration

After deployment, the agent needs to be configured in the Agentforce Builder UI to use the custom actions defined in this repository.
