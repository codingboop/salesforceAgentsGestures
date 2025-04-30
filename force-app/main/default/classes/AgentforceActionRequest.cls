/**
 * Class representing a request from Agentforce to execute a custom action
 */
public class AgentforceActionRequest {
    private String actionName;
    private Map<String, Object> parameters;
    
    /**
     * Constructor
     * @param actionName The name of the action to execute
     * @param parameters Map of parameters for the action
     */
    public AgentforceActionRequest(String actionName, Map<String, Object> parameters) {
        this.actionName = actionName;
        this.parameters = parameters;
    }
    
    /**
     * Get the name of the action
     * @return String action name
     */
    public String getActionName() {
        return this.actionName;
    }
    
    /**
     * Get the parameters for the action
     * @return Map<String, Object> parameters
     */
    public Map<String, Object> getParameters() {
        return this.parameters;
    }
}
