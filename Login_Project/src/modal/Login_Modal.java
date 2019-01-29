package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Login_Bean;
import common_things.DB_Connection;

public class Login_Modal {

	public boolean check_user_name (Login_Bean obj_Login_Bean) {
		
		boolean flag = false;
		
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection(); 
		
		PreparedStatement ps = null; 
		ResultSet rs = null;
		

		
		try {
			
			String q = "select * from login where staffID=? and password=? and position=?";
			ps = connection.prepareStatement(q);
			ps.setString(1, obj_Login_Bean.getEmail());
			ps.setString(2, obj_Login_Bean.getPassword());
			ps.setString(3, obj_Login_Bean.getPosition());
			rs = ps.executeQuery();
			
			if(rs.next())
			{
				flag=true; 
			}
			
		} catch (Exception  e) {
			// TODO: handle exception
		
		} finally {
			try {
				if(connection!=null) {
					connection.close();
				}
			} catch (Exception e2) {
				
			}
			
		}
				
		return flag;
	}
}
