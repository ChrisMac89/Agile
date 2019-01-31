<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<!-- Author: Mathew -->
<%@page import="modal.Login_Modal"%>
<%@page import="bean.Login_Bean"%>
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
<link rel="icon" type="image/png/ico" href="resources/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>University of Dundee Exam Review Dashboard</title>

<!-- CSS for styling -->
<link href="profile/view/css/archives.css" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<%@ include file="navbar.jsp" %>
</head>
<body>
	<%
	Login_Modal obj_Login_Modal = new Login_Modal(); 
	
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
						<td>Module Code</td>
						<td>Exam Title</td> 
						<td>Status</td>
						<td>Deadline</td>
						
					</tr>
					
				
<%
   try
   {
	   
	   String position = obj_Login_Bean.getPosition();
	   System.out.println("Position: " + position);
	   
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam2db";
       String username="18agileteam2";
       String password="8474.at2.4748";
       
       
       
       
       String query="SELECT exam, examTitle, examId, solution, stage, resitExam FROM exam";
       
       String deadlineQuery = "";
       
       switch (position) {
       	case "TeachingStaff": 
       		deadlineQuery = "SELECT examId, examSetterDeadline, internalModeratorDeadline, examCommiteeDeadline, externalModeratorDeadline FROM staffroles";
    	   break;
       	case "Admin":
       		deadlineQuery = "SELECT examId, examSetterDeadline, internalModeratorDeadline, examCommiteeDeadline, externalModeratorDeadline FROM staffroles";
       		break;
       	case "ExternalModerator":
       		deadlineQuery = "SELECT examId, examSetterDeadline, internalModeratorDeadline, examCommiteeDeadline, externalModeratorDeadline FROM staffroles";
       		break;
       	case "ExamCommitee":
       		deadlineQuery = "SELECT examId, examSetterDeadline, internalModeratorDeadline, examCommiteeDeadline, externalModeratorDeadline FROM staffroles";
       		break;
       	default:
       		System.out.println("Default reached");
       
       }

    		   
    		   
    		   
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
						<td><a
							href="http://localhost:8080/Login_Project/examPage.jsp?examId=<%out.print(rs.getString("examId"));%>"><%=rs.getString("exam") %></a>
							</center></td>


						<!-- <a href="http://silva.computing.dundee.ac.uk/2018-agileteam2/"> -->

						</a>
						</td>

				 <td><a
							href="http://localhost:8080/Login_Project/examPage.jsp?examId=<%out.print(rs.getString("examId"));%>"><%=rs.getString("examTitle") %></a>
							</center></td></td> 
					
						<td style="background-color:<%=myColor %>;">
							<%out.println(rs.getString("stage")); %>
						</td>
					</tr>

					<%
       }
   %>
					<%=rs.getString("resitExam") %>
					<td><%=rs.getString("exam") %></td>
					<%=rs.getString("examTitle") %>
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
			</div>
			<br>
			<br> <a class="btn btn-primary"
				href="http://localhost:8080/Login_Project/profile/view/createExam.jsp">Upload
				New Exam</a> <a class="btn btn-danger float-right"
				href="http://localhost:8080/Login_Project/Signoutcontroller">Log
				Out</a>
		</div>


	</div>
</div>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>