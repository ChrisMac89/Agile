<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@page import="bean.Login_Bean"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>


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
	Login_Bean obj_Login_Bean = (Login_Bean)session.getAttribute("admin_session");
	if(!(obj_Login_Bean == null)){
		
		System.out.println("Secret admin options");
		
	}
	else 
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
							<i class=></i> Exam Title:
						</p></td>
					<td style="width: 294px;"><%=meta.getTitle() %></td>
				</tr>

				<tr>
					<td><p class=>
							<i class=></i> Exam ID:
						</p></td>
					<td><%=meta.getExamCode() %></td>
				</tr>

				<tr>
					<td><p>
							<i class=></i> Exam Type:
						</p></td>
					<td><%=meta.getType() %></td>
				</tr>

				<tr>
					<td>
						<p>
							<i class=></i> Module Code:
						</p>
					</td>
					<td><%=meta.getModCode() %></td>
				</tr>

				<tr>
					<td>
						<p>
							<i class=></i> Module Coordinator:
						</p>
					</td>
					<td><%=meta.getCoord() %></td>
				</tr>

				<tr>
					<td>
						<p>
							<i class=></i> Level:
						</p>
					</td>
					<td><%=meta.getLevel() %></td>
				</tr>

				<tr>
					<td><p>
							<i class=></i> Year:
						</p></td>
					<td><%=meta.getYear() %></td>
				</tr>

				<tr>
					<td>
						<p>
							<i class=></i> Format:
						</p>
					</td>
					<td><%=meta.getFormat() %></td>
				</tr>
			</table>

			<a class="btn btn-primary"
				href="profile/view/view_file.jsp?examId=<%out.print(meta.getExamCode());%>"
				target="_blank" role="button">Download Exam</a> <br>
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