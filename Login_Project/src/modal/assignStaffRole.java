package modal;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common_things.DB_Connection;

/**
 * Servlet implementation class assignStaffRole
 */
@WebServlet("/assignStaffRole")
public class assignStaffRole extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	DB_Connection obj_DB_Connection = new DB_Connection();
	Connection connection = obj_DB_Connection.getConnection();
	


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		System.out.println("examId: " + request.getParameter("examId"));
		
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
	            String sql = "INSERT INTO staffroles (examId, examSetter, internalModerator, examCommitee, externalModerator) values (?, ?, ?, ?, ?)";
	            
	            PreparedStatement statement = connection.prepareStatement(sql);
	            statement.setString(1, request.getParameter("examId"));
	            statement.setString(2, request.getParameter("examSetter"));
	            statement.setString(3, request.getParameter("internalModerator"));
	            statement.setString(4, request.getParameter("examCommitee"));
	            statement.setString(5, request.getParameter("externalModerator"));


	            // sends the statement to the database server
	            int row = statement.executeUpdate();
	            
	            if (row > 0) 
	            {
	                message = "Roles assigned and pushed to DB";
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
