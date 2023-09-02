<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
if (loggedIn == null || !loggedIn) {
    response.sendRedirect("error_page.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="shortcut icon" href="https://img.favpng.com/17/20/24/computer-icons-favicon-scalable-vector-graphics-web-design-png-favpng-FxX7qA70tWMUi0GGnu9h35mX8.jpg">
    <meta charset="ISO-8859-1">
    <title>Update Student | Admin</title>
</head>

<style>
    form {
        border-radius: 5px !important;
        max-width: 360px;
        box-shadow: rgba(0, 0, 0, 0.4) 0px 30px 90px;
    }

    label {
        text-align: left;
        font-weight: 500;
        padding: 5px;
    }
</style>

<body>
    <header id="head1">
        <nav class="navbar navbar-expand-lg navbar-light sticky-top bg-warning">
            <div class="container p-1">
                <a class="navbar-brand text text-dark">
                    <strong>
                        Admin Portal
                    </strong>
                </a>
                <div>
                    <a href="logout.jsp" class="btn btn-outline-dark" role="button" style="border-radius:20px; width:120px;">
                        <strong><i class="fa fa-user-circle-o"></i> logout</strong>
                    </a>
                </div>
            </div>
        </nav>
    </header>

    <div id="student-signup">
        <div class="container m-auto mt-2 mb-2 p-3">
            <div class="details">
                <form class="form-control m-auto p-4 mt-3 mb-1" method="post" action="updateStudent.jsp">

                    <center><i class="fa fa-cloud-upload fa-3x m-auto text text-center p-2" id="icons"></i></center>

                    <p class="text text-dark text-center mb-3"><strong>Update Student Details</strong></p>
                    <br>
                    <div class="row mt-2">
                        <label class="text-danger">Student Roll Number = <%= request.getParameter("rollNumber") %></label>
                        <input type="hidden" name="rollNumber" value="<%= request.getParameter("rollNumber") %>">
                    </div>

                    <div class="row mt-2">
                        <label>Student Full Name </label>
                        <input type="text" class="form-control" name="fullname" id="fullname" placeholder="student full name" required>
                    </div>

                    <div class="row mt-1">
                        <label>Branch </label>
                        <select class="form-select form-select-md" name="branch" required>
                            <option></option>
                            <option value="CSE">CSE</option>
                            <option value="IT">IT</option>
                            <option value="EEE">EEE</option>
                            <option value="ECE">ECE</option>
                            <option value="CIVIL">CIVIL</option>
                            <option value="MECH">MECH</option>
                        </select>
                    </div>
                    <div class="row mt-1">
                        <label>Email</label>
                        <input type="email" class="form-control" name="email" id="email" placeholder="email address" required>
                    </div>
                    <button type="submit" name="update-student" class="btn btn-dark mt-4 mb-3"><strong>Update Details</strong></button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>

<%
try {
    int rollNumber = Integer.parseInt(request.getParameter("rollNumber"));
    String name = request.getParameter("fullname");
    String branch = request.getParameter("branch");
    String email = request.getParameter("email");

    // Before inserting data, check if the mail already exists or not.
    // Inserting data
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "password");
    PreparedStatement ps = con.prepareStatement("UPDATE student SET fullname=?, branch=?, email=? WHERE roll = ?");
    ps.setString(1, name);
    ps.setString(2, branch);
    ps.setString(3, email);
    ps.setInt(4, rollNumber);

    int rowsAffected = ps.executeUpdate();

    if (rowsAffected > 0) {
        %>
        <script>
            setTimeout(function() {
                alert('Student details Successfully Updated !!!');
                window.location.href = './all-students.jsp';
            }, 1000);
        </script>
        <%
    } else {
        out.print("<script>alert('Failed to update student details !!!')</script>");
    }
} catch (Exception e) {
    //out.print(e.getMessage());
}
%>
