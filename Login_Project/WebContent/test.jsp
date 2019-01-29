<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%@ page import="java.sql.ResultSet"%>
	<%@ page import="java.sql.Statement"%>
	<%@ page import="java.sql.Connection"%>
	<%@ page import="java.sql.DriverManager"%>
	<%@ page import="java.sql.DriverManager"%>
	<%@ page import="common_things.Comment"%>
	<%@ page import="bean.Login_Bean"%>
	<%@ page import="modal.Login_Modal"%>
	
	
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
	
	<%  
		String id = request.getParameter("examId");
	    int id2 = Integer.parseInt(id);
		out.println(id2);
		String user = obj_Login_Bean.getEmail();
		String position = obj_Login_Bean.getPosition();
		System.out.println(user);
		String comment = request.getParameter("comment");
		System.out.println(comment);
		Comment com = new Comment();
		com.connect();
		com.query("INSERT INTO comments (message, commenter, position, examId) VALUES ('" + comment + "', '" + user + "', '" + position + "', '" + id2 + "')");
		System.out.println(comment);
		
	%>
	<script> window.location.href="http://localhost:8080/Login_Project/examPage.jsp"</script>
</body>
</html>