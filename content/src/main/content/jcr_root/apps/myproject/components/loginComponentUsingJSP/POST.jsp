<%@include file="/libs/foundation/global.jsp"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%
    // First, get all form fields value
    String username = slingRequest.getParameter("username");
	String password = slingRequest.getParameter("password");
	String redirectUrl = slingRequest.getParameter("redirectUrl");

	// Stupid authentication, just for demo
	boolean isSuccess = false;
    if (username != null && !username.equals("") && username.equals(password)) {
		isSuccess = true;
    }

	// Store user data into HttpSession
	HttpSession userSession = slingRequest.getSession();
    if (isSuccess) {        
		userSession.setAttribute("username", username);
        userSession.setAttribute("message", "Login Successfully.");
    } else {
        userSession.setAttribute("message", "Login Fail. Try Again!");
    }

	// Finally, redirect to homepage
	slingResponse.sendRedirect(redirectUrl);
%>
