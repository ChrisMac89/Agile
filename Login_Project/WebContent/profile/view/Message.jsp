<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/png/ico" href="resources/favicon.ico"/>
<title>Message</title>
<link href="profile/view/css/archives.css" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<%@ include file="navbar.jsp" %>
</head>
<body>
    <div class="row-fluid">
	<div class="bodycontainer">
	<div class="Tablecontainer">
<div class="cc">
        <h3><%=request.getAttribute("Message")%></h3>
        </div>
        <br><br>
        </div>
        	<a class="btn btn-danger float-right"href="http://localhost:8080/Login_Project/user-home-page">Go Back</a>
        	<br><br>
        </div>
        </div>
    
</body>
</html>