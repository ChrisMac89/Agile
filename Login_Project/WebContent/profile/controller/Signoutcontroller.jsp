
 	<%
 		session.removeAttribute("user_session");
 		session.setAttribute("login_message", "Sign Out Sucessfull");
 	%>
 	<script type="text/javascript">
 		window.location.href= "http://silva.computing.dundee.ac.uk/2018-agileteam2/index.jsp";
 	</script>
