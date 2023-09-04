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
    transition: transform 3s;
    transform: rotateY(360deg);
    box-shadow: rgba(14, 30, 37, 0.12) 0px 2px 4px 0px, rgba(14, 30, 37, 0.32) 0px 2px 16px 0px;
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
	<main>
	
<div class="container m-auto mt-5 row row-cols-1 row-cols-md-5 g-4" style="max-width:1200px;">
  
  <a href="./AddStudent.jsp" target="_blank">
  	<div class="col text-center">
    	<div class="card" id="card1">
      		<div class="card-body">
      			<i class="fa fa-graduation-cap fa-4x p-4" aria-hidden="true"></i>
        		<h5 class="card-title">Add Student</h5>
      		</div>
    	</div>
  	</div>
 </a>
 
 <a href="./AddAdmin.jsp" target="_blank">
  <div class="col text-center">
    <div class="card" id="card2">
      <div class="card-body">
      	<i class="fa fa-user-plus fa-4x p-4" aria-hidden="true"></i>
        <h5 class="card-title">Add Admin</h5>
      </div>
    </div>
  </div>
 </a>
 
 <a href="./AddResult.jsp" target="_blank">
  <div class="col text-center">
    <div class="card" id="card3">
      <div class="card-body">
      	<i class="fa fa-cube fa-4x p-4" aria-hidden="true"></i>
        <h5 class="card-title">Add Results</h5>
      </div>
    </div>
  </div>
 </a>
 
 <a href="./StudentResult.jsp" target="_blank">
  <div class="col text-center">
    <div class="card" id="card3">
      <div class="card-body">
      	<i class="fa fa-database fa-4x p-4" aria-hidden="true"></i>
        <h5 class="card-title">Student Results</h5>
      </div>
    </div>
  </div>
 </a>
 
 <a href="./all-students.jsp" target="_blank">
  <div class="col text-center">
    <div class="card" id="card3">
      <div class="card-body">
      	<i class="fa fa-users fa-4x p-4" aria-hidden="true"></i>
        <h5 class="card-title">All Students</h5>
      </div>
    </div>
  </div>
 </a>

<a href="./msg_admin.jsp" target="_blank">
  	<div class="col text-center">
    	<div class="card" id="card1">
      		<div class="card-body">
      			<i class="fa fa-comments fa-4x p-4" aria-hidden="true"></i>
        		<h5 class="card-title">Messages</h5>
      		</div>
    	</div>
  	</div>
 </a>
</div>
</main>
</body>
</html>    
