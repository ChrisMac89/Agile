<%@page import="bean.Login_Bean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<center>
<h1>Upload Page</h1>

<table border="1">
<tr>
<%-- <td><a href="http://silva.computing.dundee.ac.uk/2018-agileteam2/user-home-page">Upload</a></td> --%>
<td><a href="http://localhost:8080/Login_Project/user-home-page">Upload</a></td>

<%-- <td><a href="http://silva.computing.dundee.ac.uk/2018-agileteam2/user-profile">My Page</a></td> --%>
<td><a href="http://localhost:8080/Login_Project/user-profile">My Page</a></td>

<%-- <td><a href="http://silva.computing.dundee.ac.uk/2018-agileteam2/Signoutcontroller">Log Out</a></td> --%>
<td><a href="http://localhost:8080/Login_Project/Signoutcontroller">My Page</a></td>
</tr>
</table>
</center>

<h3>File Upload:</h3>
      Select a file to upload: <br />
      <form action = "uploadServlet" method = "post"
         enctype = "multipart/form-data">
         <input type = "file" name = "file" size = "50" />
         <br />
         <br>
         <input type = "submit" value = "Upload File" />
      </form>

</body>
</html>