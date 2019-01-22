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
        <!-- Custom styles for this template -->
    <link href="css/full.css" rel="stylesheet">
	<!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
    
    
    <div class="container">
  
  

    <p><img src="./resources/logo.png" alt="" width="500" height="172" /></p>
        <h1 style="color: #5e9ca0; text-align: center;"><span style="color: #ffffff;">Log In</span></h1>
        
        <%-- form for login system --%>
        <form action="landing.jsp" method="POST">
            
         
               
               
                
                        <span style="color: #ffffff;">Staff ID:</span></h1> &nbsp; &nbsp;&nbsp;&nbsp;
                  
                
                 <input type="text" name="email" value="" size="50" />
                    
                    
                <br>
                <br>
               
                      <span style="color: #ffffff;">Password:</span></h1>
                   
                
                      <input type="password" name="password" value="" size="50" style="width: 391px; "/>
                  
                <br>
                <br>
                
           
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" value="Log In" name="submit" />
        </form>
        
        </div>
		<!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
