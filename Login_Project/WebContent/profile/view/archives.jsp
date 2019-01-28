<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<!-- Author: Mathew -->

<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@page import="bean.Login_Bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="common_things.DB_Connection"%>

<!-- Code Below reviewed by Andrew -->

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>University of Dundee Exam Review Dashboard</title>
<!-- CSS for styling -->
<link href="css/archives.css" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- JS for making tables sortable -->
<script src="vendor/js/sorttable.js"></script>

<!-- Navigation -->
    <%@ include file="navbar.jsp" %>
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
	<div class="bodycontainer">


		
		<h2 style="color: #5e9ca0; text-align: center;">
			<span style="color: black;">Archives</span>
		</h2>
		<br>

		<div class="Tablecontainer">



			<form method="post">

				<table  class="sortable" style="color: #000000;" border="2">
					<tr>
						<th>Module Code</th>
						<th>Resit</th>
						<th>Exam</th>
						<th>Solution</th>
						<th>Exam Year</th>
					</tr>
					<%
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam2db";
       String username="18agileteam2";
       String password="8474.at2.4748";
       String query="SELECT exam, examId, solution, moduleId, resitExam, examYear FROM exam";
       Connection conn=DriverManager.getConnection(url, username, password);
       Statement stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
       {
   %>
					<tr>
					<td>
							<%out.println(rs.getString("moduleId")); %>
						</td>
						
						<td>
							<%out.println(rs.getString("resitExam")); %>
						</td>
						<td><a
							href="http://localhost:8080/Login_Project/examPage.jsp?examId=<%out.print(rs.getString("examId"));%>"><%=rs.getString("exam") %></a>
							</center></td>


						<!-- <a href="http://silva.computing.dundee.ac.uk/2018-agileteam2/"> -->

						</a>
						</td>

						<td><a
							href="http://localhost:8080/<%=rs.getString("solution") %>">

								<!--  <a href="http://silva.computing.dundee.ac.uk/2018-agileteam2/<%=rs.getString("solution") %>"> -->

								<%out.println(rs.getString("solution")); %>
						</a></td>
						
					<td>
							<%out.println(rs.getString("examYear")); %>
						</td>
					</tr>
					<%
       }
   %>				
   					<%=rs.getString("moduleId") %>
					<%=rs.getString("resitExam") %>
					<td><%=rs.getString("exam") %></td>
					<td><%=rs.getString("solution") %></td>
				
					<td><%=rs.getString("examYear") %></td>
					<%
        rs.close();
        stmt.close();
        conn.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }
   %>
				</table>
				<a class="btn btn-danger float-right"href="http://localhost:8080/Login_Project/profile/view/upload.jsp">Go Back</a>
			</form>
			<br>
			
		</div>


	</div>


	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>