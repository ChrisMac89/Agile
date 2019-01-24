<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link href="css/examPage.css" rel="stylesheet">
<title>Exam Page</title>
<link href="./././vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

  <div class="container">
  
   <%@ page import="common_things.metadata" %>
   
  <%
  metadata meta = new metadata();
  meta.connect();
  String id = request.getParameter("examId");
  meta.query(id); //change this parameter to show results for a different exam (currently displaying metadata for exam with ID 8)
  %>
  
 <p><img style="display: block; margin-left: auto; margin-right: auto;" src="./resources/logo.png" alt="" width="400" height="137" /></p>
        <h2 style="color: #5e9ca0; text-align: center;"><span style="color: Black;">Exam Page</span></h2>
        <br>
       <div class="Tablecontainer"> 
        
        <table style="border-color: #000000;" border="0">
		<tr>
			<td style="width: 180px;"><p class=>
                    <i class=></i>
                    Exam Title:
                </p></td>
			<td style="width: 294px;"><%=meta.getTitle() %></td>
		</tr>
		
		<tr>
			<td><p class=>
                    <i class=></i>
                  	Exam ID:
                </p></td>
			<td><%=meta.getExamCode() %></td>
		</tr>
		
		<tr>
			<td><p>
                    <i class=></i>
                    Exam Type:
                </p>   </td>
			<td><%=meta.getType() %></td>
		</tr>
		
		<tr>
			<td> <p>
                    <i  class=></i>
                    Module Code:
                </p>   </td>
			<td><%=meta.getModCode() %></td>
		</tr>
		
		<tr>
			<td> <p>
                    <i class=></i>
                    Module Coordinator:
                </p>    </td>
			<td><%=meta.getCoord() %></td>
		</tr>
		
		<tr>
			<td> <p>
                    <i class=></i>
                    Level:
                </p> </td>
			<td><%=meta.getLevel() %></td>
		</tr>
		
		<tr>
			<td><p>
                    <i class=></i>
                    Year:
                </p>   </td>
			<td><%=meta.getYear() %></td>
		</tr>
		
		<tr>
			<td>   <p>
                    <i class=></i>
                    Format:
                </p>                                         
				 </td>
			<td><%=meta.getFormat() %></td>
		</tr>
	</table>
	
<a class="btn btn-primary" href="profile/view/view_file.jsp?examId=<%out.print(meta.getExamCode());%>" target="_blank" role="button">Download Exam</a>     
        
<p>Comments:</p>
  <form action="nextPage.jsp" method="POST">
		<textarea style="width: 467px; height: 177px; "></textarea>
		<br><br>
		<input type="checkbox"> Mark this as complete
		<br><br>
		<input type="submit" value = "Submit">
		
		<a class="btn btn-danger float-right" href="http://localhost:8080/Login_Project/user-home-page">Go Back</a> 
	</form>
	
	</div>
	
	  </div>
</body>
</html>