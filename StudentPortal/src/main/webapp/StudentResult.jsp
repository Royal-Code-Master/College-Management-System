<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>


<%

Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
if (loggedIn != null && loggedIn) {
    String username = (String) session.getAttribute("username");
}
else{
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
<title>Dash Board</title>
</head>

<style>

	.card{
		box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
		
	}
	#card1:hover, #card2:hover, #card3:hover {
    color: black !important;
    background-color: gold !important;
    font-weight: bold !important;
    transition: transform 0.3s;
}


	a{
		text-decoration:none;
		font-weight:bolder;
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
	
	<%
            
            String roll = request.getParameter("result_search");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "password");
                
                // Use PreparedStatement to prevent SQL injection
                PreparedStatement ps = con.prepareStatement("SELECT s.fullname, s.roll, s.branch, r.subject1, r.subject2, r.subject3, r.total, r.status FROM student s INNER JOIN results r ON s.roll = r.roll;");
                ResultSet rs = ps.executeQuery();
        %>
        
	<main>
		<div class="container mt-5 table-responsive">
                <table class="table table-hover table-bordered">
                    <thead class="bg-secondary text-light text-center mb-1 mt-1">
                    <tr>
                    	<th>Student</th>
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
                        while (rs.next()) {
                    %>
                    <tr>
                    	<td><i class="fa fa-user-circle-o p-1"></i></td>
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
</body>
</html>    