package common_things;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Comment {
	
	// main for testing purposes
/*	public static void main(String[] args) 
	{
		Comment com = new Comment();
		com.connect();
		com.query("INSERT INTO Comments (message, commenter, position, examId) VALUE ('JOHN TEST MESSAGE2', 'John', 'TeachingStaff', '1')");
	}
*/
	Connection con;
	ResultSet rs;
	Statement smt;
	
	public Comment() {
	}
	
	// method to connect to the database 
	public void connect() {
		// prepare sql driver 
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    String url="jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam2db";
		    String username="18agileteam2";
		    String password="8474.at2.4748";
		    con = DriverManager.getConnection(url, username, password);
		}
		catch(Exception e) 
		{ 
			System.out.println("SQL exception occured " + e); 
		}
		
		System.out.println("connection success"); 
	}
	
		// method to query the database for metadata
		public void query(String query) {
						
			try {
				smt = con.createStatement();
				smt.executeUpdate(query);
				
				if(rs.next()) {
					
			       }
				
				System.out.println("query success"); 
			}
			catch(SQLException e) { System.out.println("SQL exception occured " + e); }
			finally 
			{
				try 
				{
				//rs.close();
		        smt.close();
		        con.close();
				}
				catch(SQLException e) { System.out.println("SQL exception occured " + e); }
			}
		}
		
}
