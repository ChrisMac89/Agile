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


<title>Admin Dashboard</title>
<!-- CSS for styling -->
<link href="profile/view/css/archives.css" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<%@ include file="adminNavbar.jsp" %>



</head>
<body>
	<%
	Login_Bean obj_Login_Bean = (Login_Bean)session.getAttribute("admin_session");
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



	<div class="row-fluid">
	<div class="bodycontainer">


		
		<h2 style="color: #5e9ca0; text-align: center;">
			<span style="color: black;">Dashboard</span>
		</h2>
		<br>
				
			<div class="Tablecontainer">
<div class="cc">



			<form method="post">

				<table style="color: #000000;" border="2">
					<tr>
						<td>Resit</td>
						<td>Exam Title</td>
						<td>Module Code</td>
						<td>Status</td>
					</tr>
					<%
   try
   {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		
       String query="SELECT exam, examTitle,moduleId, examId, solution, stage, resitExam FROM exam";
       PreparedStatement statement = connection.prepareStatement(query);
       ResultSet rs=statement.executeQuery(query);
       while(rs.next())
       {
   %>
   <%//out.println(rs.getString("stage")); 
		
		String myColor = rs.getString("stage");
		//out.println(myColor);
		%>
  <%
 
 
String newColor = "Red";
String progressColor ="Yellow";
String completedColor ="Green";
//String myColor = request.getParameter("stage"); 
//String myColor ="";
String level = rs.getString("stage");
 
if (level.equals("New"))
{

	myColor = newColor;
	System.out.println(rs.getString("stage"));
} else if (level.equals("In-Progress"))
{
	myColor = progressColor;
	System.out.println(rs.getString("stage"));

}
else {
	
	myColor = completedColor;
	System.out.println(rs.getString("stage"));
}
	



%>
   
					<tr>
						<td>
							<%out.println(rs.getString("resitExam")); %>
						</td>
						<td><a
							href="http://localhost:8080/Login_Project/examPage.jsp?examId=<%out.print(rs.getString("examId"));%>"><%=rs.getString("examTitle") %></a>
							</td>


						<!-- <a href="http://silva.computing.dundee.ac.uk/2018-agileteam2/"> -->

						<!-- </a> -->
						<!-- </td> -->

						<td>

								<%out.println(rs.getString("moduleId")); %>
						</td>
						<td style="background-color:<%=myColor %>;">
							<%out.println(rs.getString("stage")); %>
						</td>
					</tr>

					<%
       }
   %>
					<%=rs.getString("resitExam") %>
					<td><%=rs.getString("examTitle") %></td>
					<td><%=rs.getString("moduleId") %></td>
					<td><%=rs.getString("stage") %></td>
					<%
        rs.close();
        statement.close();
        connection.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }
   %>
				</table>
			</form>
			<br>
			<br> 
		</div>
		</div>
		
		

				<br>
				<a class="btn btn-danger float-right"
				href="http://localhost:8080/Login_Project/Signoutcontroller">Log
				Out</a>
				
				<br>
				<br>

	</div>
</div>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
</body>

</html>