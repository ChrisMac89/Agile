package examWorkflow;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

	/**
	 * 
	 * @author Danyal
	 *
	 */


public class Dashboard {
		
	private String dbURL = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam2db";
	private String dbUser = "18agileteam2";
	private String dbPass = "8474.at2.4748";	
	    
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	    {
	        
	    	Connection conn = null;
	    	Statement stmt = null;
	    	ResultSet rs = null;
	    	
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
		            stmt = conn.createStatement();		        
		            String sql = "SELECT exam, solution, stage, resitExam FROM exam";

		            rs = stmt.executeQuery(sql);
		        
		         
		        
		         
		      } catch(SQLException e) {
		         e.printStackTrace();
		      }

	    	  }
	}

		


