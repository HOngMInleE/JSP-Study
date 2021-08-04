package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBManager {
	
	public static Connection getConnection() {
		Connection conn = null;
		Context initContext;
		
		try {
			initContext = new InitialContext();
			DataSource ds = (DataSource) initContext.lookup("java:/comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch (NamingException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	} // getConnection
	
	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if (conn != null) conn.close();
			if (stmt != null) stmt.close();
			if (rs!= null) rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// 오버로딩이용 , rs가 없을 때.
	public static void close(Connection conn, Statement stmt) {
		try {
			if (conn != null) conn.close();
			if (stmt != null) stmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
