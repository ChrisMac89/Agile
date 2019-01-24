<%@page import="bean.Login_Bean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="common_things.DB_Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<center>
<h1>Upload Page</h1>

<table border="1">
<tr>
<%-- <td><a href="http://silva.computing.dundee.ac.uk/2018-agileteam2/user-home-page">Upload</a></td> --%>
<td><a href="http://localhost:8080/Login_Project/user-home-page">Upload</a></td>

<%-- <td><a href="http://silva.computing.dundee.ac.uk/2018-agileteam2/user-profile">My Page</a></td> --%>
<td><a href="http://localhost:8080/Login_Project/user-profile">My Page</a></td>

<%-- <td><a href="http://silva.computing.dundee.ac.uk/2018-agileteam2/Signoutcontroller">Log Out</a></td> --%>
<td><a href="http://localhost:8080/Login_Project/Signoutcontroller">My Page</a></td>
</tr>
</table>
</center>

<h3>File Upload:</h3>
      Select a file to upload: <br />
      <form action = "uploadServlet" method = "post"
         enctype = "multipart/form-data">
         <input type = "file" name = "file" size = "50" />
         <br />
         <br>
         <input type = "submit" value = "Upload File" />
      </form>
      
      
      
      <table border="1" width="25%" cellpadding="5">
            <thead> 
               <th colspan="3">Uploaded Files</th>        
            </thead>
                <tbody>
                    <tr>
                        <td><center><b>Id</b></center><td><center><b>Title</b></center></td><td><center><b>File</b></center></td>
                    </tr>
                    
                    <%
                        try
                        {
                                DB_Connection dbconn=new DB_Connection();
                                Connection myconnection= dbconn.getConnection();

                                String sqlString = "SELECT * FROM exam";
                                Statement myStatement = myconnection.createStatement();
                                ResultSet rs=myStatement.executeQuery(sqlString);
                                
                                if(!rs.isBeforeFirst())
                                {
                                    %>
                                        <tr>
                                        <td colspan="3"><center><%out.print("No Files!"); %></center></td>
                                        </tr>
                                    <%
                                }    
                                
                                while(rs.next())
                                {   
                            %>
                                    <tr>
                                        <td><center><%out.print(rs.getString("exam")); %></center></td>
                                        <td><center><%out.print(rs.getString("stage")); %></center></td>
                                        <td><center><a href="profile/view/view_file.jsp?examId=<%out.print(rs.getString("examId"));%>">View</a></center></td>
                                    </tr>
                            <%
                                }
                            %>
                            
                </tbody> 
        </table>
                            
                            <%
                                rs.close();
                                myStatement.close();
                                myconnection.close();
                        }catch(Exception e){e.printStackTrace();}    
                        
                    %>

</body>
</html>