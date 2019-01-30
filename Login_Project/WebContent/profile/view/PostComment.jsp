<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%@ page import="java.sql.ResultSet"%>
	<%@ page import="java.sql.Statement"%>
	<%@ page import="java.sql.Connection"%>
	<%@ page import="java.sql.DriverManager"%>
	<%@ page import="java.sql.DriverManager"%>
	<%@ page import="common_things.Comment"%>
	<%@ page import="bean.Login_Bean"%>
	<%@ page import="modal.Login_Modal"%>
	
	
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
	
	
	
	
	
		
		String id = request.getParameter("examId");
	    int id2 = Integer.parseInt(id);
		out.println(id2);
		String user = obj_Login_Bean.getEmail();
		String position = obj_Login_Bean.getPosition();
		System.out.println(user);
		String comment = request.getParameter("comment");
		System.out.println(comment);
		
		
		String signature = request.getParameter("signed");
		Comment com = new Comment();
		com.connect();
		//com.query("INSERT INTO comments (message, commenter, position, examId) VALUES ('" + comment + "', '" + user + "', '" + position + "', '" + id2 + "')");
		//com.query("INSERT INTO comments (message, commenter, position, examId) VALUES ('aaa','bbb','ccc','99')");

		
		
		
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam2db", "18agileteam2", "8474.at2.4748");
	Statement st=conn.createStatement();
	Statement st1=conn.createStatement();

	int i=st.executeUpdate("INSERT INTO comments (message, commenter, position, examId) VALUES ('" + comment + "', '" + user + "', '" + position + "', '" + id2 + "')");
	
			if (position.equals("ExternalModerator") && signature.equals("true"))
			{
				int j = st1.executeUpdate("UPDATE staffroles SET externalModeratorSignature = true WHERE examId =" + id);
			}	
			else if (position.equals("InternalModerator") && signature.equals("true"))
			{
				int j = st1.executeUpdate("UPDATE staffroles SET internalModeratorSignature = true WHERE examId =" + id);
			}
			else if (position.equals("TeachingStaff") && signature.equals("true"))
			{
				int j = st1.executeUpdate("UPDATE staffroles SET examSetterSignature = true WHERE examId =" + id);
			}
			else if (position.equals("ExamCommitee") && signature.equals("true"))
			{
				int j = st1.executeUpdate("UPDATE staffroles SET examCommiteeSignature = true WHERE examId =" + id);
			}
	
		st.close();
		st1.close();
		conn.close();
	}
	catch(Exception e)
	{
	System.out.print(e);
	e.printStackTrace();
	} 
		
		
		
		
		
		
		
		
		System.out.println(comment);
		
	%>
	<script> window.location.href="http://localhost:8080/Login_Project/examPage.jsp?examId=<%=request.getParameter("examId")%>"</script>
</body>
</html>