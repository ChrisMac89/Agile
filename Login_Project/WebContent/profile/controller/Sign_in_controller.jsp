<%@page import="modal.Login_Modal"%>
<%@page import="bean.Login_Bean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Custom styles for this template -->
    <link href="/css/full.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
 
<jsp:useBean id="obj_Login_Bean" class="bean.Login_Bean"></jsp:useBean>
<jsp:setProperty property="*" name="obj_Login_Bean"/> 

<%
System.out.println(obj_Login_Bean.getEmail());
System.out.println(obj_Login_Bean.getPassword());
System.out.println(obj_Login_Bean.getPosition());  


Login_Modal obj_Login_Modal = new Login_Modal(); 

boolean flag = obj_Login_Modal.check_user_name(obj_Login_Bean);

if(flag && (obj_Login_Bean.getPosition().equals("Admin"))){
	
	session.setAttribute("admin_session", obj_Login_Bean); 
	%>
	<script type="text/javascript">
	<%--window.location.href="http://silva.computing.dundee.ac.uk/2018-agileteam2/user-home-page/<%=obj_Login_Bean.getEmail()%>"; --%>
	window.location.href="http://localhost:8080/Login_Project/profile/view/AdminDashBoard.jsp";
	</script>
	<% 
} 
if(flag && (obj_Login_Bean.getPosition().equals("ExternalModerator"))){
	
	session.setAttribute("user_session", obj_Login_Bean); 
	%>
	<script type="text/javascript">
	<%--window.location.href="http://silva.computing.dundee.ac.uk/2018-agileteam2/user-home-page/<%=obj_Login_Bean.getEmail()%>"; --%>
	window.location.href="http://localhost:8080/Login_Project/user-home-page";
	</script>
	<% 
} if(flag && (obj_Login_Bean.getPosition().equals("ExamCommitee"))){
	
	session.setAttribute("user_session", obj_Login_Bean); 
	%>
	<script type="text/javascript">
	<%--window.location.href="http://silva.computing.dundee.ac.uk/2018-agileteam2/user-home-page/<%=obj_Login_Bean.getEmail()%>"; --%>
	window.location.href="http://localhost:8080/Login_Project/user-home-page";
	</script>
	<% 
}if(flag && (obj_Login_Bean.getPosition().equals("InternalModerator"))){
	
	session.setAttribute("user_session", obj_Login_Bean); 
	%>
	<script type="text/javascript">
	<%--window.location.href="http://silva.computing.dundee.ac.uk/2018-agileteam2/user-home-page/<%=obj_Login_Bean.getEmail()%>"; --%>
	window.location.href="http://localhost:8080/Login_Project/user-home-page";
	</script>
	<% 
}if(flag && (obj_Login_Bean.getPosition().equals("TeachingStaff"))){
	
	session.setAttribute("user_session", obj_Login_Bean); 
	%>
	<script type="text/javascript">
	<%--window.location.href="http://silva.computing.dundee.ac.uk/2018-agileteam2/user-home-page/<%=obj_Login_Bean.getEmail()%>"; --%>
	window.location.href="http://localhost:8080/Login_Project/user-home-page";
	</script>
	<% 
}if(flag && (obj_Login_Bean.getPosition().equals("SchoolOffice"))){
	
	session.setAttribute("school_office_session", obj_Login_Bean); 
	%>
	<script type="text/javascript">
	<%--window.location.href="http://silva.computing.dundee.ac.uk/2018-agileteam2/user-home-page/<%=obj_Login_Bean.getEmail()%>"; --%>
	window.location.href="http://localhost:8080/Login_Project/profile/view/SchoolOffice.jsp";
	</script>
	<% 
}else {


	 
	session.setAttribute("login_message", "Login failed, Username and password is wrong"); 
    
	%>
	<script type="text/javascript">
	<%-- window.location.href="http://silva.computing.dundee.ac.uk/2018-agileteam2/index.jsp"; --%>
	window.location.href="http://localhost:8080/Login_Project/index.jsp";
	</script>
	<% 
	
}
%>


</body>
</html>