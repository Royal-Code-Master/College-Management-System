<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
<%
    // Invalidate the session (log out the user)
    session.invalidate();
    
    // Redirect to the login page after logout
    response.sendRedirect("StudentLogin.html");
%>