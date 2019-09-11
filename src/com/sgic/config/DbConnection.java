package com.sgic.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	public static Connection getDbConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8800/defect_tracker", "root", "Nilo*5995#s");
			System.out.println("connected");
			return conn;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
}
