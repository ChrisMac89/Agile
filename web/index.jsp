<%-- 
    Document   : index
    Created on : 21-Jan-2019, 10:38:15
    Author     : Zohaib Nawaz Tarar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Exam System</title>
    </head>
    <body>
        <h1>Login</h1>
        
        <%-- form for login system --%>
        <form action="landing.jsp" method="POST">
            
         
               
               
                
                        Email: &nbsp; &nbsp;&nbsp;&nbsp;
                  
                
                 <input type="text" name="email" value="" size="50" />
                    
                    
                <br>
                <br>
               
                      Password:
                   
                
                      <input type="password" name="password" value="" size="50" style="width: 391px; "/>
                  
                <br>
                <br>
                
           
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" value="Log In" name="submit" />
        </form>
        
        
    </body>
</html>
