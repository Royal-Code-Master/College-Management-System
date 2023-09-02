<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<%! String username; %>

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
    
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  	
<meta charset="ISO-8859-1">
<title>Available Students | Admin</title>
</head>

<style>

nav{
	background-color:#6C63FF;
}

label{
		font-family:times;
		color:black;
		text-align:left;
		font-weight:800;
		padding:5px;
	}
tbody{
	font-weight:600;
	border:1px solid black;
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
            
           
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "password");
                
                // Use PreparedStatement to prevent SQL injection
                PreparedStatement ps = con.prepareStatement("SELECT * FROM student ;");
                
                
                ResultSet rs = ps.executeQuery();
                
    %>
        
	<main>
		
		<div class="container mt-5 table-responsive">
				<h4 class="text pt-4 pb-4 text-center">Available Students</h4>
                <table class="table table-hover table-bordered">
                    <thead class="bg-dark text-light text-center mb-1 mt-1">
                    <tr>
                    	
                        <th>Student Roll Number</th>
                        <th>Full Name</th>
                        <th>Branch</th>
                        <th>Email Address</th>
                        <th colspan="2">Action</th>
                        
                    </tr>
                    </thead>
                    <tbody class="text text-dark text-center">
                    <%
                        while (rs.next()) {
                        	
                        	
                    %>
                    <tr>
                    	
                        
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        <td><%= rs.getString(4) %></td>
                        <td><%= rs.getString(5) %></td>
                        <td>
                        	<a href="./updateStudent.jsp?rollNumber=<%= rs.getString(2) %>" role="button" class="btn btn-primary" >Update</a>
                        </td>
                        <td>
                        	<a href="./deleteStudent.jsp?rollNumber=<%= rs.getString(2) %>" role="button" class="btn btn-danger" >Delete</a>
                        </td>
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




