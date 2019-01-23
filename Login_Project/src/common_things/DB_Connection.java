package common_things;


import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;


public class DB_Connection {
	
	public static void main(String[] args) {
		DB_Connection ob_DB_Connection = new DB_Connection();
		System.out.println(ob_DB_Connection.getConnection());
	}

	public Connection getConnection() {
		Connection connection = null;
		System.out.println("Connection called");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam2db",
            "18agileteam2", "8474.at2.4748");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
}
