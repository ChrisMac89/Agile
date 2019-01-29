/*
 * The following tutorial was used to assist with the creation of this page.
 * https://www.codejava.net/coding/upload-files-to-database-servlet-jsp-mysql
 */

package modal;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import common_things.DB_Connection;


/**
 *
 * @author Andrew Aitken
 * @author Matthew Foulis
 * 
 */

@WebServlet("/profile/view/addStaffServlet")


public class AddStaff extends HttpServlet {
	
	DB_Connection obj_DB_Connection = new DB_Connection();
	Connection connection = obj_DB_Connection.getConnection();

	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	
    	System.out.println("firstName: " + request.getParameter("firstName"));
    	System.out.println("Surname: " + request.getParameter("surname"));
    	System.out.println("staffID: " + request.getParameter("staffID"));
    	System.out.println("position: " + request.getParameter("position"));
    	
    	String message = null;
    	
    	try 
    	{
            Class.forName("com.mysql.jdbc.Driver");
         }
    	catch(ClassNotFoundException e) 
    	{
            System.out.println("Class not found "+ e);
        }
        try 
        {
	            // connects to the database
	            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	            
	 
	            // constructs SQL statement
	            String sql = "INSERT INTO staff (firstName, lastName, staffId, position) values (?, ?, ?, ?)";

	            PreparedStatement statement = connection.prepareStatement(sql);
	            statement.setString(1, request.getParameter("firstName"));
	            statement.setString(2, request.getParameter("surname"));
	            statement.setString(3, request.getParameter("staffID"));
	            statement.setString(4, request.getParameter("position"));


	 
	            // sends the statement to the database server
	            int row = statement.executeUpdate();
	            
	            if (row > 0) 
	            {
	                message = "File uploaded and saved into database";
	            }
	            
        }
        catch (SQLException ex) 
        {
        	message = "ERROR: " + ex.getMessage();
        	
        	ex.printStackTrace();
        }
        finally 
        {
            if (connection != null) {
                // closes the database connection
                try {
                    connection.close();
                } 
                catch (SQLException ex) 
                {
                    ex.printStackTrace();
                }
            }
            
            
            
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/profile/view/Message.jsp").forward(request, response);
            
        }
    
}
}