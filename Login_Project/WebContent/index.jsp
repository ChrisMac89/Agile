<%-- 
    Document   : index
    Created on : 21-Jan-2019, 10:38:15
    Author     : Zohaib Tarar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Welcome to Exam System</title>
        <!-- Custom styles for this page -->
    <link href="css/full.css" rel="stylesheet">
	<!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
    
    
    <div class="container">
  
  

    <p><img src="./resources/logo.png" alt="" width="400" height="137" /></p>
        <h2 style="color: #5e9ca0; text-align: center;"><span style="color: #ffffff;">Exam Work Flow Management System</span></h2>
        <br>
        <%-- form for login system --%>
        <form action="profile/controller/Sign_in_controller.jsp" method="POST"> 
             
         
               
               
                
                        <span style="color: #ffffff;">Staff ID:</span> &nbsp; &nbsp;&nbsp;&nbsp;
                  
                
                 <input type="text" name="email" value="" size="50" />
                    
                    
                <br>
                <br>
               
                      <span style="color: #ffffff;">Password:</span>&nbsp; &nbsp;
                   
                
                      <input type="password" name="password" value="" size="50" />
                  
                <br>
                <br>
                
           <%
        String message = (String)session.getAttribute("login_message"); 
        if(message!=null)
        {
        	 out.println(message);
        	 session.removeAttribute("login_message");
        }
        %>
        <br><br>
	 <input type="submit" value="Log In" name="submit" />
        </form>
        
        </div>
        
		<!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
