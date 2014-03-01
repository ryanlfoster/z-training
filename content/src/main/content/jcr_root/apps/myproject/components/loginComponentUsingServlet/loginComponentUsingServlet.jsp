<%@include file="/libs/foundation/global.jsp"%>
<%@page import="javax.servlet.http.HttpSession"%>

<h3>Login Component - Handling Form Submit Using Servlet</h3>
<ul>
    <li>Servlet Path : /services/LoginServlet</li>
    <li>Implementation Class : servlet.LoginServlet within OSGi bundle</li>
    <li>Note : install bundle active before testing this login component</li>
</ul>   

<%
    // Getting user information from HttpSession
    HttpSession userSession = slingRequest.getSession();
    if (userSession != null) {
        String username = (String) userSession.getAttribute("username");
        String message = (String) userSession.getAttribute("message");
        if (username != null) {
            pageContext.setAttribute("username", username);
        }
        pageContext.setAttribute("message", message);
    }
%>

<%-- In case of success show hello message. Otherwise, show failure message and login form --%>    
<c:choose>
    <c:when test="${not empty username}">
        <h3>Hello, ${username}</h3>        
    </c:when>
    <c:otherwise>
        <form  action="/services/LoginServlet" method="POST">
             Username: <input type="text" name="username" /><br>
             Password: <input type="password" name="password" />
			 <input type="hidden" name="redirectUrl" value="${currentPage.path}.html" />	                 
             <input type="submit" value="Sign In" />
        </form>
    </c:otherwise> 
</c:choose>
<p style="color:red"><c:out value="${message}" /></p>
