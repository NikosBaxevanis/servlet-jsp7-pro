package gr.aueb.cf.helloapp;



import jakarta.ws.rs.ApplicationPath;
import jakarta.ws.rs.core.Application;

/**
 * Defines base path for all url endpoints
 * Tells Tomcat that is a REST app
 * Root of all Jax-RS configurations
 * Auto-scans for @Path @Provider
 */
@ApplicationPath("/api")
public class HelloApplication extends Application {

}