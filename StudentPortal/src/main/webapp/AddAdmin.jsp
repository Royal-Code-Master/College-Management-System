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
<title>Insert title here</title>
</head>

<style>
	
	body{
		background-image : url("./Images/add-admin.svg");
		background-size:cover;
		background-repeat :no-repeat;
		
	}
	form{
		max-width:360px;
		box-shadow: rgba(0, 176, 255) 0px 2px 4px, rgba(0, 176, 255) 0px 7px 13px -5px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
	}
	label{
		text-align:left;
		font-weight:bolder;
		padding:5px;
	}
	input{
	border-radius:30px !important;
	}
	
	form:hover{
		border :2px solid deeppink !important;
	}
	
	form:hover label,
	form:hover i,
	form:hover p {
    color: deeppink !important; 
    
}

</style>

<body class="">
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
	
	<div id="admin-signup">
		<div class="container m-auto mt-3 mb-2 p-5">
			<div class="details">
				<form class="form-control m-auto p-2 mt-3 mb-1 " method="post" action="AddAdmin.jsp">
					
					<center><i class="fa fa-user-plus fa-3x m-auto text text-dark text-center p-3" id="icons"></i></center>
					
					<p class="text tex-dark text-center"><strong>Add Your Admin</strong></p>
					
					<div class="row  p-3">
						<label>Full Name</label>
						<input type="text" class="form-control" name="admin_name" id="admin_name" placeholder="admin full name" required>
					</div>
					<div class="row  p-3">
					<label>Email Address </label>
						<input type="email" class="form-control" name="admin_email" id="admin_email" placeholder="email address" required>
					</div>
					<div class="row p-3">
					<label>Password</label>
					<input type="password" class="form-control" name="admin_pwd" id="admin_pwd" placeholder="***********" required>
					</div>
					<button type="submit" name="add_admins" class="btn mt-4 mb-3"  style="background-color:deeppink !important; color:white;"><i class="fa fa-plus"></i> <strong>Add Admin</strong></button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>



<% 

try{
	
	String admin_name = request.getParameter("admin_name");
	String admin_email = request.getParameter("admin_email");
	String admin_pwd = request.getParameter("admin_pwd");
	
	// before inserting data i need check the mail alreday exist or not
	// inserting data
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","password");
		Statement stmt = con.createStatement();
		
		PreparedStatement aps = con.prepareStatement("SELECT email FROM admins WHERE email=?;");

		aps.setString(1,admin_email);
		ResultSet ars = aps.executeQuery();
		
		// if exist
		if(ars.next()){
			out.print("<script>alert('Admin already exist with same email address!!!!! Please check once')</script>");	
		}
		
		// if not exist
		else{
		
			PreparedStatement ps = con.prepareStatement("INSERT INTO admins (fullname, email, passwords) VALUES (?, ?, ?);");
			ps.setString(1, admin_name);
			ps.setString(2, admin_email);
			ps.setString(3, admin_pwd);

			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
			    out.print("<script>alert('Admin Successfully Added !!! ')</script>");
			} else {
			    out.print("<script>alert('Failed !!!!')</script>");
			}
		}
	}
	catch(Exception e){
		
	}
}
catch(Exception e){
	out.print(e.getMessage());
}

%>