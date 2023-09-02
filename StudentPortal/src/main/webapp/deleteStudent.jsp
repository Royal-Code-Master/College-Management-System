<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
</head>
<body>
    <%
    Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
    if (loggedIn == null || !loggedIn) {
        response.sendRedirect("error_page.jsp");
    } else {
        try {
            int rollNumber = Integer.parseInt(request.getParameter("rollNumber"));

            // Establish a database connection (you can use a connection pool in a real application)
            String jdbcUrl = "jdbc:mysql://localhost:3306/student";
            String dbUser = "root";
            String dbPassword = "password";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            String deleteQuery = "DELETE FROM student WHERE roll = ?";
            PreparedStatement ps = con.prepareStatement(deleteQuery);
            ps.setInt(1, rollNumber);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                %>
                <script>
                    alert('Student Deleted !!!');
                    setTimeout(function() {
                        window.location.href = './all-students.jsp';
                    }, 1000);
                </script>
                <%
            } else {
                %>
                <script>
                    alert('Failed to Delete Student !!!');
                    
                </script>
                <%
            }

            ps.close();
            con.close();
        } catch (Exception e) {
            // Handle or log the exception
            out.print(e);
           // response.sendRedirect("error_page.jsp");
        }
    }
    %>
</body>
</html>
