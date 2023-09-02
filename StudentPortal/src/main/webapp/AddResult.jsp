<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@page import="java.sql.*" %>    
    
    
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
<title>Add Student Result | Admin</title>
</head>


<style>

body{
	height:100vh;
	background-image : url("./Images/wave1.svg");
	background-size:cover;
	background-repeat :no-repeat;
}

form{
	border:3px solid white !important;
	height:auto;
	max-width:430px;
	box-shadow: rgba(0, 0, 0, 0.56) 0px 22px 40px 7.4px;
}



label{
	color:black;
	padding:7px;
	text-align:left;
	font-weight:500;
}

input{
	border-radius:20px !important;
}
p{
	font-size:24px;
	font-weight:bolder;
}
small{
	font-size:10px;
	font-weight:600;
	
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
	
	<div id="result">
		<div class="container m-auto text-center"><center>
			<form action="" method="post" class="form-control mt-4 p-4">				
				<i class="fa fa-link fa-3x mt-2 p-1 text-primary " aria-hidden="true"></i>
				<p class="text text-center mt-1 p-2 text-dark">Student <em class="text-primary"> Result </em></p>
				
				<div class="row  mt-2">
					<label>Student Roll Number</label>
					<input type="number" class="form-control" name="roll" placeholder="student roll number" required>
				</div>

				<div class="row  mt-1">
					<label>Subject-1</label>
					<input type="number" class="form-control" name="subject1" placeholder="enter subject1 marks" required>
				</div>
					
					
				<div class="row  mt-1">
					<label>Subject-2</label>
					<input type="number" class="form-control" name="subject2" placeholder="enter subject2 marks" required>
				</div>
					
				<div class="row  mt-1">
					<label>Subject-3</label>
					<input type="number" class="form-control" name="subject3" placeholder="enter subject3 marks" required>
				</div>
					
				<button type="submit" class="btn btn-primary mt-4 mb-1 form-control"><strong><i class="fa fa-cloud-upload" aria-hidden="true"></i> Upload Result</strong></button>
				
				<small>Design & Developed by Eswar</small>
			</form></center>
		</div>
	</div>
</body>
</html>



<% 
try {
    int roll = Integer.valueOf(request.getParameter("roll"));
    int subject1 = Integer.valueOf(request.getParameter("subject1"));
    int subject2 = Integer.valueOf(request.getParameter("subject2"));
    int subject3 = Integer.valueOf(request.getParameter("subject3"));
        
    
    String status;
    int total;

    total = subject1 + subject2 + subject3;

    if (total > 35)
    	status = "Passed";
    else
    	status = "Failed";
	
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "password");

        // Check if the student's result already exists
        PreparedStatement aps = con.prepareStatement("SELECT roll FROM results WHERE roll=?;");
        aps.setInt(1, roll);
        ResultSet ars = aps.executeQuery();

        // If result exists
        if (ars.next()) {
            out.print("<script>alert('Student Result already exists! Please check once')</script>");
        } else {
            // If result does not exist, insert the data
            PreparedStatement ps = con.prepareStatement("INSERT INTO results (roll, subject1, subject2, subject3, total, status) VALUES (?, ?, ?, ?, ?, ?);");
            ps.setInt(1, roll);
            ps.setInt(2, subject1);
            ps.setInt(3, subject2);
            ps.setInt(4, subject3);
            ps.setInt(5, total);
            ps.setString(6, status);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                out.print("<script>alert('Results Successfully Uploaded!')</script>");
            } else {
                out.print("<script>alert('Upload Failed!')</script>");
            }
        }
        
        con.close(); // Close the database connection
    } catch (Exception e) {
         out.print("<script>alert('No student Available with this Roll number check once !!')</script>");
    }
} catch (Exception e) {
	
}
%>





