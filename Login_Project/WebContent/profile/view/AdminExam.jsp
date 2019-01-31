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


<title>Admin Exam Management</title>
<!-- CSS for styling -->
<link href="css/archives.css" rel="stylesheet">
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
	
	int staffTotal = 0;
	String[][] teachingStaff = new String[20][20]; int teachingStaffIndex = 0;
	String[][] internalMod = new String[20][20]; int internalModIndex = 0;
	String[][] examCommittee = new String[20][20]; int examCommitteeIndex = 0;
	String[][] externalMod = new String[20][20]; int externalModIndex = 0;
	
	
	
		try
	   	{
			DB_Connection obj_DB_Connection = new DB_Connection();
			Connection connection = obj_DB_Connection.getConnection();
			
	       String query="SELECT staffId, firstName, lastName, position FROM staff";
	       PreparedStatement statement = connection.prepareStatement(query);
	       ResultSet rs=statement.executeQuery(query);
	       
	       
	       
			while(rs.next())
			{
			 	   
				  //TODO: Refactor
			 	  //This switch could be done in a much more efficient way
			 	  switch(rs.getString("position")) {
			 	  case "Teaching Staff": 
			 		 teachingStaff[teachingStaffIndex][0] = rs.getString("firstName");
			 		 teachingStaff[teachingStaffIndex][0] += " ";
			 		 teachingStaff[teachingStaffIndex][0] += rs.getString("lastName");
			 		 teachingStaff[teachingStaffIndex][1] = rs.getString("staffId");
			 		 teachingStaffIndex++;
			 		  break;
			 	  case "Internal Moderator":
			 		 internalMod[internalModIndex][0] = rs.getString("firstName");
			 		internalMod[internalModIndex][0] += " ";
			 		internalMod[internalModIndex][0] += rs.getString("lastName");
			 		internalMod[internalModIndex][1] = rs.getString("staffId");
			 		internalModIndex++;
			 		  break;
			 	  case "Exam Commitee":
			 		 examCommittee[examCommitteeIndex][0] = rs.getString("firstName");
			 		examCommittee[examCommitteeIndex][0] += " ";
			 		examCommittee[examCommitteeIndex][0] += rs.getString("lastName");
			 		examCommittee[examCommitteeIndex][1] = rs.getString("staffId");
			 		examCommitteeIndex++;
			 		  break;
			 	  case "External Moderator":
			 		 externalMod[externalModIndex][0] = rs.getString("firstName");
			 		externalMod[externalModIndex][0] += " ";
			 		externalMod[externalModIndex][0] += rs.getString("lastName");
			 		externalMod[externalModIndex][1] = rs.getString("staffId");
			 		externalModIndex++;
			 		  break;
			 		
			 	default:
			 		System.out.println("SWITCH REACHED DEFAULT");
			 	  }
			 	   
			}
			
			
	
			System.out.println("First teaching staff name: " + teachingStaff[0][0]);
			System.out.println("First teaching staff id: " + teachingStaff[0][1]);
			
			rs.close();
			statement.close();
			connection.close();
			
	   	}
   	   catch(Exception e)
   	   {
   	        e.printStackTrace();
   	   }

	
	
	
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
			<span style="color: black;">Exam Management</span>
		</h2>
		<br>



		<div class="Tablecontainer">

<div class="cc">
		
			
			<form action="uploadServlet" method="post"
				enctype="multipart/form-data">
				
				<br> Exam Title:<br> <input type="text" name="examTitle" style="width: 312px;"/> <br>
				<br> Exam ID:<br> <input type="text" name="examID" style="width: 312px;"/> <br>
				<br> Exam Type:<br> <input type="text" name="examType" style="width: 312px;"/> <br>
				<br> Module Code:<br> <input type="text" name="moduleCode" style="width: 312px;"/> <br>
				<br> Module Coordinator:<br> <input type="text" name="moduleCoordinator" style="width: 312px;"/> <br>
				<br> Level:<br> <input type="text" name="level" style="width: 312px;"/> <br>
				<br> Year:<br> <input type="text" name="year" style="width: 312px;"/> <br>
				<br> Format:<br> <input type="text" name="format" style="width: 312px;"/> <br>
				<br>
				<b>File Upload:</b><br>
			Select a file to upload: <br />
				<input type="file" name="file" size="50" /> <br /> <br> 
				<h3>Allocate roles:</h3>
				<p>Teaching Staff</p>
				<select>
					<% 
					for(int i=0; i < teachingStaffIndex; i++)
					{
					%>
					    <option value = <%= teachingStaff[i][1] %>> <%= teachingStaff[i][0] %></option>
				<% }%>
				</select>
				<br>
				<br>
				<p>Internal Moderator</p>
				<select>
					<% 
					for(int i=0; i < internalModIndex; i++)
					{
					    %>
					    <option value = <%= internalMod[i][1] %>> <%= internalMod[i][0] %></option>
					    <% 
					}
					%>
				</select>
				<br>
				<br>
				<p>Exam Committee</p>
				<select>
					<% 
					for(int i=0; i < examCommitteeIndex; i++)
					{
					    %>
					    <option value = <%= examCommittee[i][1] %>> <%= examCommittee[i][0] %></option>
					    <% 
					}
					%>
				</select>
				<br>
				<br>
				<p>External Moderator</p>
				<select>
					<% 
					for(int i=0; i < externalModIndex; i++)
					{
					    %>
					    <option value = <%= externalMod[i][1] %>> <%= externalMod[i][0] %></option>
					    <% 
					}
					%>
				</select>
				<br>
				<br>
				
				<input type="submit" value="Create Exam" />
			</form>
			
		</div>
					<%
   try
   {
		
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }
   %>
				</table>
			</form>

		</div>
</div>


	</div>

</div>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
</body>

</html>