<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <title>Student Results</title>
</head>

<style>
    .container {
        max-width: 1100px;
    }

    input {
        text-align: center;
        font-weight: bold;
    }
    h4{
    	font-weight:bold;
    	font-style:italic;
    	font-family:times;
    }
</style>

<body class="bg-light">
<div id="results">
    <div class="container p-3">
        <center>
            <form action="Results.jsp" method="post" class="mt-5">
            	<h4 class="mt-3 mb-5 p-2 text text-danger"> &#128075; Hello, Check Your Result by entering the Roll Number</h4>
                <div class="row mt-2 mb-2 p-1">
                    <div class="col-md-12">
                        <input type="search" class="form-control" name="result_search" placeholder="Enter roll number" required style="border-radius:20px;">
                    </div>
                    
                </div>
            </form>
        </center>

        <%
            // Use try-with-resources to automatically close resources (Connection, PreparedStatement, ResultSet)
            String roll = request.getParameter("result_search");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "password");
                
                // Use PreparedStatement to prevent SQL injection
                PreparedStatement ps = con.prepareStatement("SELECT s.fullname, s.roll, s.branch, r.subject1, r.subject2, r.subject3, r.total, r.status FROM student s INNER JOIN results r ON s.roll = r.roll WHERE s.roll = ?;");
                ps.setString(1, roll);
                ResultSet rs = ps.executeQuery();
        %>

        <main class="mt-5">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead class="bg-success text-light text-center mb-1 mt-1">
                    <tr>
                        <th>Student Name</th>
                        <th>Roll Number</th>
                        <th>Branch</th>
                        <th>Subject-1</th>
                        <th>Subject-2</th>
                        <th>Subject-3</th>
                        <th>Total Marks</th>
                        <th>Status</th>
                    </tr>
                    </thead>
                    <tbody class="text text-dark text-center">
                    <%
                        if (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString(1) %></td>
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        <td><%= rs.getString(4) %></td>
                        <td><%= rs.getString(5) %></td>
                        <td><%= rs.getString(6) %></td>
                        <td><%= rs.getString(7) %></td>
                        <td><%= rs.getString(8) %></td>
                        
                    </tr>
                    <%
                        } else {
                    %>
                    <tr>
                        <td colspan="8" class="text text-center text-dark"><strong>Data not found</strong></td>
                    </tr>
                    <%
                        }
                        rs.close();
                        ps.close();
                        con.close();
                    } catch (Exception e) {
                        out.print("An error occurred: " + e.getMessage());
                    }
                    %>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>
</body>
</html>
