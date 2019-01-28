<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<!-- Author: Matthew & Andrew-->

<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>

<%@page import="bean.Login_Bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="common_things.DB_Connection"%>
<%@page import="java.sql.PreparedStatement" %>

<!-- Code Below reviewed by Andrew -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>Admin Exam Management</title>
<!-- CSS for styling -->
<link href="./css/Dashboard.css" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">



</head>
<body>
	<%
	Login_Bean obj_Login_Bean = (Login_Bean)session.getAttribute("user_session");
	if(obj_Login_Bean == null){
		session.setAttribute("login_message", "Please Login First");
		

		
		%>
	<script type="text/javascript">
		<%-- window.location.href="http://silva.computing.dundee.ac.uk/2018-agileteam2/index.jsp "; --%>
		window.location.href="http://localhost:8080/Login_Project/index.jsp";
		</script>
		
	
	
	<% 
	}
%>
	<div class="container">


		<p>
			<img style="display: block; margin-left: auto; margin-right: auto;"
				src="./resources/logo.png" alt="" width="400" height="137" />
		</p>
		<h2 style="color: #5e9ca0; text-align: center;">
			<span style="color: black;">Manage Staff</span>
		</h2>
		<br>
		<h3>Register Staff</h3>
		<br>
		<form action="addStaffServlet" method="post"
				enctype="multipart/form-data">
				
				<br> First Name: <br><input type="text" name="firstName" style="width: 312px;"/> <br> 
				<br> Surname: <br> <input type="text" name="surname" style="width: 312px;"/> <br>
				<br> Staff ID:<br> <input type="text" name="staffID" style="width: 312px;"/> <br>
				<br>
				<p>Position:</p>
				<select name="position">
					<option value="">Select an option</option>
  					<option value="Exam Setter">Exam Setter</option>
  					<option value="Internal Moderator">Internal Moderator</option>
  					<option value="Vetting Committee">Vetting Committee</option>
  					<option value="External Examiner">External Examiner</option>
				</select>
				<br>
				<br>
					<input type="submit" value="Add Staff" />
			</form>
		
		<br>
		<h3>Staff List</h3>
		<br>


	</div>





	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
</body>

</html>