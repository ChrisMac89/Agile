/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Andrew Aitken
 * 
 */

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)


public class Upload extends HttpServlet {
	
	private String dbURL = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam2db";
    private String dbUser = "18agileteam2";
    private String dbPass = "8474.at2.4748";	
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	
    
    	InputStream inputStream = null;
    	
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
    	
    	Connection conn = null;
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
	            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
	 
	            // constructs SQL statement
	            String sql = "INSERT INTO exam (file) values (?)";
	            PreparedStatement statement = conn.prepareStatement(sql);
	       
	             
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
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
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
            //../../WebContent/profile/view
        }
    
}
}