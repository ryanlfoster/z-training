package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingAllMethodsServlet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.day.cq.wcm.api.Page;

@SlingServlet(
        paths = {"/services/LoginServlet"}, methods = {"POST"}
)
public class LoginServlet extends SlingAllMethodsServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4699611196466893412L;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(LoginServlet.class);
	
    @Override
    protected void doPost(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServletException, IOException {
    	 // First, get all form fields value
        String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	String redirectUrl = request.getParameter("redirectUrl");

    	// Stupid authentication, just for demo
    	boolean isSuccess = false;
        if (username != null && !username.equals("") && username.equals(password)) {
    		isSuccess = true;
        }

    	// Store user data into HttpSession
    	HttpSession userSession = request.getSession();
        if (isSuccess) {        
    		userSession.setAttribute("username", username);
            userSession.setAttribute("message", "Login Successfully.");
        } else {
            userSession.setAttribute("message", "Login Fail. Try Again!");
        }

    	// Finally, redirect to homepage
        response.sendRedirect(redirectUrl);
    }
}
