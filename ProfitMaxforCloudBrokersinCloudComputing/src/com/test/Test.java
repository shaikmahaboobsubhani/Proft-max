package com.test;

import java.sql.Connection;
import java.sql.SQLException;

import com.util.Dbconnection;

public class Test {

	public static void main(String[] args) throws SQLException {
		Connection con=Dbconnection.getConnection();
		System.out.println(con);
	}
	
}
