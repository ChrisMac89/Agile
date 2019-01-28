<!-- Author: Zohaib -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@page import="bean.Login_Bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="common_things.DB_Connection"%>

<!--code Reviewed by Juri -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Create Exam</title>


<link href="css/archives.css" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="./././vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<%@ include file="navbar.jsp" %>
</head>
<body>

	<%
		Login_Bean obj_Login_Bean = (Login_Bean) session.getAttribute("user_session");
		if (obj_Login_Bean == null) {
			session.setAttribute("login_message", "Please Login First");
	%>
	<script type="text/javascript">
		
	<%-- window.location.href="http://silva.computing.dundee.ac.uk/2018-agileteam2/index.jsp "; --%>
		window.location.href = "http://localhost:8080/Login_Project/index.jsp";
	</script>
	<%
		}
	%>

	<div class="bodycontainer">


		
		<h2 style="color: #5e9ca0; text-align: center;">
			<span style="color: black;">Create Exam</span>
		</h2>

		<div class="Tablecontainer">
			<br> Exam Title:<br> <input style="width: 312px;">
			<br> Exam ID:<br> <input style="width: 312px;"> <br>
			Exam Type:<br> <input style="width: 312px;"> <br>
			Exam Type:<br> <input style="width: 312px;"> <br>
			Module Code:<br> <input style="width: 312px;"> <br>
			Module Coordinator:<br> <input style="width: 312px;"> <br>
			Level:<br> <input style="width: 312px;"> <br> Year:<br>
			<input style="width: 312px;"> <br> Format:<br> <input
				style="width: 312px;"> <br>
			<h3>File Upload:</h3>
			Select a file to upload: <br />
			<form action="uploadServlet" method="post"
				enctype="multipart/form-data">
				<input type="file" name="file" size="50" /> <br /> <br> <input
					type="submit" value="Upload File" />
			</form>
			<a class="btn btn-danger float-right"
				href="http://localhost:8080/Login_Project/user-home-page">Go
				Back</a>
		</div>

		<br> <br>
		
		<!-- Bootstrap core JavaScript -->
		<script src="./././vendor/jquery/jquery.min.js"></script>
		<script src="./././vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>