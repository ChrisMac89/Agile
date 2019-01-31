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
<%@ page import="java.sql.PreparedStatement" %>

<!-- Code Below reviewed by Andrew --> 

<html>
<head>
<link rel="icon" type="image/png/ico" href="resources/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no"> 


<title>University of Dundee Exam Review Dashboard</title>

<!-- CSS for styling -->
<link href="profile/view/css/archives.css" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- CSS for styling -->
<link href="css/archives.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%
	Login_Bean obj_Login_Bean = (Login_Bean)session.getAttribute("school_office_session");
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


<%@ page import="common_things.metadata"%>
 
		<%
  metadata meta = new metadata();
  meta.connect();
  String id = request.getParameter("examId");
  
  
  meta.query(id); //change this parameter to show results for a different exam (currently displaying metadata for exam with ID 8)
  %>


<div class="row-fluid">
	<div class="bodycontainer">

<span>
  <a class="increase">+</a> |
  <a class="decrease">-</a> |
  <a class="reset">reset</a>
</span>
		
	
<div class="resizable">
		
		<h2 style="color: #5e9ca0; text-align: center;">
			<span style="color: black;">School Office Dashboard</span>
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
						<td>Download Exam</td>
						
						
					</tr>
					
				
<%
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam2db";
       String username="18agileteam2";
       String password="8474.at2.4748";
       String query="SELECT exam, examId,moduleId, examTitle, solution, stage, resitExam FROM exam";
       Connection conn=DriverManager.getConnection(url, username, password);
       Statement stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery(query);
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
						<td>
						<!-- <a
							href="http://localhost:8080/Login_Project/examPage.jsp?examId=<%out.print(rs.getString("examId"));%>">--><%=rs.getString("examTitle") %></a>
							</center></td>


						<!-- <a href="http://silva.computing.dundee.ac.uk/2018-agileteam2/"> -->

						</a>
						</td>

						<td>
						<!-- <a
							href="http://localhost:8080/<%=rs.getString("examTitle") %>"> -->

								<!--  <a href="http://silva.computing.dundee.ac.uk/2018-agileteam2/<%=rs.getString("solution") %>"> -->

								<%out.println(rs.getString("moduleId")); %>
						</a></td>
					
						<td style="background-color:<%=myColor %>;">
							<%out.println(rs.getString("stage")); %>
						</td>
						
						<td>
						
						<%
			String level2 = rs.getString("stage");
			if (level2.equals("Completed"))
			{%>

				<a class="btn btn-primary"
				href="view_file.jsp?examId=<%out.print(meta.getExamCode());%><%out.print(rs.getString("examId"));%>"
				target="_blank" role="button">Download Exam</a>
			<%} 
			
			%>
						
						 <br></td>
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
        stmt.close();
        conn.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }
   %>
   

				</table>
			</form>
			<br>
			
			</div>
			<a class="btn btn-danger float-right"
				href="http://localhost:8080/Login_Project/Signoutcontroller">Log
				Out</a>
			<br>
			<br> 
			
			
				 
		</div>
</div>

	</div>
</div>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>