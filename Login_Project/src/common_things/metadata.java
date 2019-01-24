package common_things;
import java.sql.*;

public class metadata {
	
	/*public static void main(String[] args) 
	{
		metadata meta = new metadata();
		meta.connect();
		meta.query("8");
		String x = "";
		System.out.println(x = meta.getVar());
	}*/
	
	String title, examCode, modCode, coord, type, level, year, format, query;
	Connection con;
	ResultSet rs;
	
	public metadata() {
		 title = examCode = modCode = coord = type = level = year = format = query = "";
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
		public void query(String id) {
						
			try {
				Statement smt = con.createStatement();
				rs = smt.executeQuery("SELECT * FROM metaData WHERE examID = " + id);
				
				
				if(rs.next()) {
					title = rs.getString("examTitle");
					examCode = rs.getString("examId");
					modCode = rs.getString("moduleId");
					coord = rs.getString("moduleCoordinator");
					type = rs.getString("examType");
					level = rs.getString("examLevel");
					year = rs.getString("examYear");
					format = rs.getString("examFormat");
			       }
				
				
				System.out.println("query success"); 
			}
			catch(SQLException e) { System.out.println("SQL exception occured " + e); }
		}
	
		public String getTitle() {
			return title;
		}
		
		public String getExamCode() {
			return examCode;
		}
		
		public String getModCode() {
			return modCode;
		}		
		
		public String getCoord() {
			return coord;
		}
		
		public String getType() {
			return type;
		}
		
		public String getLevel() {
			return level;
		}
		
		public String getYear() {
			return year;
		}
		
		public String getFormat() {
			return format;
		}
		
}
