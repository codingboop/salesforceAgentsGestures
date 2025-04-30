/**
 * Interface for Agentforce v2 custom actions
 * All custom action classes must implement this interface
 */
public interface AgentforceActionInterface {
    /**
     * Execute method that handles action requests from Agentforce
     * @param request The action request from Agentforce
     * @return AgentforceActionResult with the action response
     */
    AgentforceActionResult execute(AgentforceActionRequest request);
}
