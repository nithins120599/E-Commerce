package dbutil;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	Connection conn = null;
	
	public Connection getConnection() {
		try {
			
			//step1
			Class.forName("com.mysql.jdbc.Driver");
			
			//step2;
			 conn=DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/ecommercedb?autoReconnect=true&useSSL=false","root","");
			
			
			
		}catch(Exception e) {
			conn = null;
		}
		
		return conn;
	}
}
