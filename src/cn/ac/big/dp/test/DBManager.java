package cn.ac.big.dp.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Stack;


public class DBManager {
	private static Stack<Connection> connPools = new Stack<Connection>();
	public static Connection getConnection() {
		if(connPools.isEmpty()) {
			createNewConnection();
		}
		return connPools.pop();
	}
	private static void createNewConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/301dbend?useUnicode=true&characterEncoding=UTF-8","root","");
			connPools.push(conn);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void returnConnection(Connection conn) {
		connPools.push(conn);
	}
}
