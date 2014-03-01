package training;

/**
 * A simple service interface
 */
public interface HelloService {
    
    /**
     * @return the name of the underlying JCR repository implementation
     */
    public String getRepositoryName();
    
    /**
     * @return the name of the underlying JCR repository implementation
     */
    public String sayHello(String name);

}