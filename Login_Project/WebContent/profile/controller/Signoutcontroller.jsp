
 	<%
 		session.removeAttribute("user_session");
 		session.removeAttribute("admin_session");
 		session.removeAttribute("school_office_session");

 		session.setAttribute("login_message", "Sign Out Sucessfull");
 	%>
 	<script type="text/javascript">
 		<%-- window.location.href= "http://silva.computing.dundee.ac.uk/2018-agileteam2/index.jsp"; --%>
 		window.location.href="http://localhost:8080/Login_Project/index.jsp";
 	</script>
