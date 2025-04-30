/**
 * Class representing a result from a custom action for Agentforce
 */
public class AgentforceActionResult {
    private String status;
    private String message;
    
    /**
     * Constructor
     * @param status The status of the action (Success, Error)
     * @param message The result message or data
     */
    public AgentforceActionResult(String status, String message) {
        this.status = status;
        this.message = message;
    }
    
    /**
     * Get the status of the action
     * @return String status
     */
    public String getStatus() {
        return this.status;
    }
    
    /**
     * Get the result message or data
     * @return String message
     */
    public String getMessage() {
        return this.message;
    }
}
