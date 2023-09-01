<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, javax.servlet.http.*" %>

<%
if (request.getMethod().equals("POST")) {
    int login_roll = Integer.valueOf(request.getParameter("roll"));
    String login_email = request.getParameter("email");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "password");
        
        PreparedStatement ps = con.prepareStatement("SELECT roll,email FROM student WHERE roll = ?;");
        ps.setInt(1, login_roll);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            int storedRoll = rs.getInt("roll");
            String storedEmail = rs.getString("email");

            if (storedEmail != null && storedRoll == login_roll && storedEmail.equals(login_email)) {
              
                
                session.setAttribute("loggedIn", true);
                session.setAttribute("username", login_email);
                response.sendRedirect("student.jsp");

            } else {
                out.println("<script>alert('Student login failed !!')</script>");
               
            }
        } else {
            
            response.sendRedirect("error_page.jsp");
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.print(e.getCause());
    }
} else {
    response.sendRedirect("error_page.jsp");
}
%>

