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
<title>Add Student | Admin</title>
</head>

<style>

body{
		background-image : url("./Images/add-student.svg");
		background-size:cover;
		background-repeat :no-repeat;
		
	}
	
form{
		border-radius:5px !important;
		max-width:360px;
		border:2px solid #00BFA6 !important;
		box-shadow: rgba(0, 0, 0, 0.4) 0px 30px 90px;
			}
p{
	color:#00BFA6 !important;
	font-size:20px;
}	
label{
		font-family:times;
		color:#00BFA6;
		text-align:left;
		font-weight:800;
		padding:5px;
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
				<form class="form-control m-auto p-4 mt-3 mb-1 " method="post" action="AddStudent.jsp">
					
					<center><i class="fa fa-user-plus fa-3x m-auto text text-center p-2" id="icons" style="color:#00BFA6;"></i></center>
					
					<p class="text tex-dark text-center mb-3"><strong>Add Your Student</strong></p>
					<br>
					<div class="row mt-2">
						<label>Student Roll Number</label>
						<input type="number" class="form-control" name="student_roll" id="roll" placeholder="student roll number " required>
					</div>
					
					<div class="row  mt-2">
					<label>Student Full Name </label>
						<input type="text" class="form-control" name="fullname" id="fullname" placeholder="student full name" required>
					</div>
					
					<div class="row mt-1">
					<label>Branch </label>
						<select class="form-select form-select-md" name="branch" required>
							<option> </option>
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
					<button type="submit" name="add_admins" class="btn mt-4 mb-3"  style="background-color:#00BFA6 !important; color:white; box-shadow: rgba(9, 30, 66, 0.25) 0px 4px 8px -2px, rgba(9, 30, 66, 0.08) 0px 0px 0px 1px;"><i class="fa fa-plus text-light"></i> <strong>Add Student</strong></button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>





<% 

try{
	
	int roll = Integer.valueOf(request.getParameter("student_roll"));
	String name = request.getParameter("fullname");
	String branch = request.getParameter("branch");
	String email = request.getParameter("email");
	
	// before inserting data i need check the mail alreday exist or not
	// inserting data
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","password");
		Statement stmt = con.createStatement();
		
		PreparedStatement aps = con.prepareStatement("SELECT roll,branch FROM student WHERE roll=?;");

		aps.setInt(1,roll);
		ResultSet ars = aps.executeQuery();
		
		// if exist
		if(ars.next()){
			out.print("<script>alert('Student roll number already exist ! Please check once')</script>");	
		}
		
		// if not exist
		else{
		
			PreparedStatement ps = con.prepareStatement("INSERT INTO student (roll,fullname, branch, email) VALUES (?, ?, ?, ?);");
			ps.setInt(1, roll);
			ps.setString(2, name);
			ps.setString(3, branch);
			ps.setString(4, email);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
			    out.print("<script>alert('Student Successfully Added !!! ')</script>");
			} else {
			    out.print("<script>alert('Failed !!!!')</script>");
			}
		}
	}
	catch(Exception e){
		
	}
}
catch(Exception e){
	//out.print(e.getMessage());
}

%>