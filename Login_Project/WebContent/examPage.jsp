<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@page import="bean.Login_Bean"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="common_things.DB_Connection"%>
<%@ page import="java.sql.PreparedStatement" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/png/ico" href="resources/favicon.ico"/>

<link href="profile/view/css/archives.css" rel="stylesheet">
<title>Exam Page</title>
<link href="./././vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
	
	<%@ include file="/profile/view/navbar.jsp" %>
</head>
<body>
	<%
	
	boolean isAdmin = false;
	
	Login_Bean obj_Login_Bean = (Login_Bean)session.getAttribute("admin_session");
	Login_Bean obj_Login_Bean_user = (Login_Bean)session.getAttribute("user_session");
	if(!(obj_Login_Bean == null)){
		
		System.out.println("Secret admin options");
		isAdmin = true;
		
	}
	else if(!(obj_Login_Bean_user == null))
	{
		System.out.println("Not admin");
	}

		
		%>
<div class="row-fluid">
	<div class="bodycontainer">

		<%@ page import="common_things.metadata"%>
 
		<%
  metadata meta = new metadata();
  meta.connect();
  String id = request.getParameter("examId");
  
  
  meta.query(id); //change this parameter to show results for a different exam (currently displaying metadata for exam with ID 8)
  %>

		
		<h2 style="color: #5e9ca0; text-align: center;">
			<span style="color: Black;">Exam Page</span>
		</h2>
		<br>
		<div class="cc">
		<div class="Tablecontainer">


			<table style="border-color: #000000;">
				<tr>
					<td style="width: 180px;"><p class=>
							<i class=></i> Exam Title:</p></td>
					<td style="width: 294px;"> <input type="text" name="examTitle" value="<%=meta.getTitle() %>"></td>
				</tr>

				<tr>
					<td><p class=><i class=></i> Exam ID:</p></td>
					<td><input type="text" name="examTitle" value="<%=meta.getExamCode() %>"></td>
				</tr>

				<tr>
					<td><p>	<i class=></i> Exam Type:</p></td>
					<td><input type="text" name="examType" value="<%=meta.getType() %>"></td>
				</tr>

				<tr>
					<td>
						<p>	<i class=></i> Module Code:</p>
					</td>
					<td><input type="text" name="moduleCode" value="<%=meta.getModCode() %>"></td>
				</tr>

				<tr>
					<td>
						<p>	<i class=></i> Module Coordinator:</p>
					</td>
					<td><input type="text" name="moduleCoord" value="<%=meta.getCoord() %>"></td>
				</tr>

				<tr>
					<td>
						<p>	<i class=></i> Level:</p>
					</td>
					<td><input type="text" name="examLevel" value="<%=meta.getLevel() %>"></td>
				</tr>

				<tr>
					<td><p>	<i class=></i> Year:</p></td>
					<td><input type="text" name="examYear" value="<%=meta.getYear() %>"></td>
				</tr>

				<tr>
					<td>
						<p>	<i class=></i> Format:</p>
					</td>
					<td><input type="text" name="examFormat" value="<%=meta.getFormat() %>"></td>
				</tr>
			</table>
			
			
			<!-- TOP -->
			
			<% if(isAdmin) {
			
				
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
			
			<form action="/Login_Project/assignStaffRole" method="post"
				>
				<h3>Allocate roles:</h3>
				<p>Teaching Staff</p>
				<select name="examSetter">
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
				<select name="internalModerator">
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
				<select name="examCommitee">
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
				<select name="externalModerator">
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
				<input type="hidden" name="examId" value="<%= request.getParameter("examId") %>" >
				<input type="submit" value="Assign Roles" />
			</form>
			
			<%} %>
			
			
			
			<!-- Bottom -->

					<table style="width: 437px; ">
						<tr>
							<td><a class="btn btn-primary"
				href="profile/view/view_file.jsp?examId=<%out.print(meta.getExamCode());%>"
				target="_blank" role="button">Download Exam</a> <br></td>
							<td><a class="btn btn-primary"
				href="profile/view/view_Solutionfile.jsp?examId=<%out.print(meta.getExamCode());%>"
				target="_blank" role="button">Download Solution</a> <br></td>
						</tr>
					</table>

					
			<br>
			<br>
			<p><b>Comments:</b></p>
			<%
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam2db";
       String username="18agileteam2";
       String password="8474.at2.4748";
       String query="SELECT message, commenter, position FROM comments WHERE examId = " + id;
       Connection conn=DriverManager.getConnection(url, username, password);
       Statement stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
       {
    	%>
			<br>
			<p>
				<%	out.println('"' + rs.getString("message") + '"');	%>
			</p>
<div class="commentposter">
			<p>
				<%	out.println("&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  - Comment posted by: " + rs.getString("commenter") + ", " + rs.getString("position"));	%>
			</p>
</div>
			<br>
			
			<%  
     }
  
        rs.close();
        stmt.close();
        conn.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }
   %>


			<p>Write a comment:</p>

			<form action="profile/view/PostComment.jsp?examId=<%= meta.getExamCode() %>" method="POST">
				<textarea name = "comment" style="width: 467px; height: 177px;"></textarea>
				<br>
				<br> <input type="checkbox"> Mark this as complete <br>
				<br> <input type="submit" value="Submit"> 
			</form>


			<a class="btn btn-danger float-right"href="http://localhost:8080/Login_Project/user-home-page">Go Back</a>
			<br><br>
			
			

		</div>
</div>
</div>
	</div>
</body>
</html>