<!-- Author: Juri -->
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="common_things.DB_Connection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="bean.Login_Bean"%>

<!DOCTYPE html>

<!-- Code reviewed by Zohaib -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<link rel="icon" type="image/png/ico" href="resources/favicon.ico"/>
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

	<%  
            String id=(request.getParameter("examId"));
            
            Blob file = null;
            byte[ ] fileData = null ;

            try
            {    
                DB_Connection dbconn=new DB_Connection();
                Connection conn= dbconn.getConnection();
            
                String sqlString = "SELECT file FROM exam WHERE examId = '"+id+"' ";
                Statement myStatement = conn.createStatement();
                
                ResultSet rs=myStatement.executeQuery(sqlString);
                
                if (rs.next()) 
                {
                	 
                    file = rs.getBlob("solutionfile");
                    fileData = file.getBytes(1,(int)file.length());
                } else 
                {
                    out.println("file not found!!!!!!");
                    
                    out.println(id);
                    
                    return;
                }
                
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "inline");
                response.setContentLength(fileData.length);
                
                OutputStream output = response.getOutputStream();
                output.write(fileData);
                
                output.flush();
                
            } catch (SQLException ex) {Logger.getLogger(Logger.class.getName()).log(Level.SEVERE, null, ex);} 
        %>


</body>
</html>