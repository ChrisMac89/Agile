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

<span>
  <a class="increase">+</a> |
  <a class="decrease">-</a> |
  <a class="reset">reset</a>
</span>
		
	
<div class="resizable">
        <h3><%=request.getAttribute("Message")%></h3>
        </div>
        <br><br>
        </div>
        	<a class="btn btn-danger float-right"href="javascript:history.back()">Go Back</a>
        	<br><br>
        </div>
        </div>
    </div>
</body>
</html>