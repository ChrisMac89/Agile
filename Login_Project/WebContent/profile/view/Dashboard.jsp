<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>


<html>
<head>
<meta charset="ISO-8859-1">
<title>University of Dundee Exam Review Dashboard</title>
</head>
<body>
	
<form method="post">

<table border="2">
   <tr>
        <td>Resit</td>
        <td>Exam</td>
        <td>Solution</td>
        <td>Stage</td>
   </tr>
   <%
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam2db";
       String username="18agileteam2";
       String password="8474.at2.4748";
       String query="SELECT exam, solution, stage, resitExam FROM exam";
       Connection conn=DriverManager.getConnection(url, username, password);
       Statement stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
       {
   %>
       <tr><td><%out.println(rs.getString("resitExam")); %></td></tr>
       <tr><td>       
       		<a href="http://silva.computing.dundee.ac.uk/2018-agileteam2/<%=rs.getString("exam") %>">
       			<%out.println(rs.getString("exam")); %>
       		</a>
       	</td></tr>
       			
       <tr><td>
       		<a href="http://silva.computing.dundee.ac.uk/2018-agileteam2/<%=rs.getString("solution") %>">
       			<%out.println(rs.getString("solution")); %>
       		</a>
        </td></tr>
       <tr><td><%out.println(rs.getString("stage")); %></td></tr>
 
   <%
       }
   %>
   		   <tr><td><%=rs.getString("resitExam") %></td></tr>
           <tr><td><%=rs.getString("exam") %></td></tr>
           <tr><td><%=rs.getString("solution") %></td></tr>
           <tr><td><%=rs.getString("stage") %></td></tr>
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
</form>`

</body>
</html>