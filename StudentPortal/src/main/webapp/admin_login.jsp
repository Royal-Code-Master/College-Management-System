<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*" %>
    
<% 

if(request.getMethod().equals("POST")){

String adminlogin_email = request.getParameter("emails");
String adminlogin_password = request.getParameter("pwds");

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","password");
	Statement stmt = con.createStatement();
	
	PreparedStatement ps = con.prepareStatement("SELECT email, passwords FROM admins WHERE email = ?;");
	ps.setString(1, adminlogin_email);
	
	
	ResultSet rs = ps.executeQuery();
	
	while(rs.next()){
		String adminstoredEmail = rs.getString("email");
		String adminstoredPasswords = rs.getString("passwords");
		
		// macth checking.
		
		if(adminstoredEmail.equals(adminlogin_email) && adminstoredPasswords.equals(adminlogin_password)){
			
			session.setAttribute("loggedIn", true);
			session.setAttribute("username", adminlogin_email);		
			response.sendRedirect("portal.jsp");
		}
		else{
			out.println("<script>alert('admin login failed !!')</script>");
			//response.sendRedirect("admin_login.html");
		}
	}
	
}catch(Exception e){
	out.print(e.getCause());
}
}
else{
	response.sendRedirect("error_page.jsp");
	
}
%>



    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>