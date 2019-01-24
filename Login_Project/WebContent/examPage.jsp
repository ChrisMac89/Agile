<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link href="css/examPage.css" rel="stylesheet">
<title>Exam Page</title>
</head>
<body>

  <div class="container">
  
   <%@ page import="common_things.metadata" %>
   
  
  <%
  metadata meta = new metadata();
  meta.connect();
  meta.query("8");
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
             
<p>Comments:</p>
  <form action="nextPage.jsp" method="POST">
		<textarea style="width: 467px; height: 177px; "></textarea>
		<br><br>
		<input type="checkbox"> Mark this as complete
		<br><br>
		<input type="submit" value = "Submit">
	</form>
	</div>
	  <div>
</body>
</html>