package com.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class Dbconnection {

  static String driver;
  static String url;
  static String username;
  static String password;
  static Connection connection;
	
	static{
		Properties p=new Properties();
		try {
			p.load(Dbconnection.class.getClassLoader().getResourceAsStream("system.properties"));
		
		
		 driver=p.getProperty("driver");
		 url=p.getProperty("url");
		 username=p.getProperty("username");
		 password=p.getProperty("password");
		
		
		
		Class.forName(driver);	
		
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		public static Connection getConnection() throws SQLException{
			
			connection=DriverManager.getConnection(url, username, password);
			
			return connection;
			
		}
		public static void CloseConnection() throws SQLException{
			if(connection!=null){
				connection.close();
				
			}
	}
	
	
	
	
	
	
}
