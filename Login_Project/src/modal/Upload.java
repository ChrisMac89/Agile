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

//REFACTORED
//Removed SQL imports as they have been moved to a separate class dealing with database connections

/*
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;
*/

//REFACTORED
//Removed SQL imports as they have been moved to a separate class dealing with database connections


/**
 *
 * @author Andrew Aitken
 * @author Matthew Foulis
 * 
 */

@WebServlet("/profile/view/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)


public class Upload extends HttpServlet {
	
	DB_Connection obj_DB_Connection = new DB_Connection();
	Connection connection = obj_DB_Connection.getConnection();
	
	//REFRACTORED 
	//private String dbURL = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam2db";
    //private String dbUser = "18agileteam2";
    //private String dbPass = "8474.at2.4748";	
	//Replaced database connection with database connection object
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	
    
    	InputStream inputStream = null;
    	
    	//String examTitle = request.getParameter("examTitle");
    	//System.out.println("examTitle;"+ examTitle);
    	Part filePart = request.getPart("file");
    	if (filePart != null)  
    	{
	        // prints out some information for debugging
	        //System.out.println(filePart.getName());
	        //System.out.println(filePart.getSize());
	        //System.out.println(filePart.getContentType());
	         
	        // obtains input stream of the upload file
	        inputStream = filePart.getInputStream();
    	}
    	
    	
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
	            String sql = "INSERT INTO exam (file, examTitle, examId, examType, moduleId, moduleCoordinator, examLevel, examYear, examFormat) values (?,?,?,?,?,?,?,?,?)";
	            //,?,?,?,?,?,?,?
	            //, examId, examType, moduleId, moduleCoordinator, examLevel, examYear, examFormat
	            PreparedStatement statement = connection.prepareStatement(sql);
	            statement.setString(2, request.getParameter("examTitle"));
	            statement.setString(3, request.getParameter("examId"));
	            statement.setString(4, request.getParameter("examType"));
	            statement.setString(5, request.getParameter("moduleId"));
	            statement.setString(6, request.getParameter("moduleCoordinator"));
	            statement.setString(7, request.getParameter("examLevel"));
	            statement.setString(8, request.getParameter("examYear"));
	            statement.setString(9, request.getParameter("examFormat"));
	            
	            if (inputStream != null) 
	            {
	                // fetches input stream of the upload file for the blob column
	                statement.setBlob(1, inputStream);
	            }
	 
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