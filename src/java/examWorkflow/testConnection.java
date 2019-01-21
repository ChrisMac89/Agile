/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.*;
/**
 *
 * @author Danyal
 */
public class testConnection {
    
    public static void main(String[] args) {
        
      try {
         Class.forName("com.mysql.cj.jdbc.Driver");
      } catch(ClassNotFoundException e) {
         System.out.println("Class not found "+ e);
      }
      try {
         Connection con = DriverManager.getConnection(
            "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam2db","18agileteam2", "8474.at2.4748");
         
         Statement stmt = con.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT * FROM comments");
         System.out.println("id  name    job");
         
         while (rs.next()) {
            int id = rs.getInt("recipientId");
            String name = rs.getString("senderId");
            String job = rs.getString("message");
            System.out.println(id+"   "+name+"    "+job);
         }
      } catch(SQLException e) {
         System.out.println("SQL exception occured" + e);
      }
   }
}
