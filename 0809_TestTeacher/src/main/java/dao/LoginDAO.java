package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import vo.MemberVO;

public class LoginDAO {

	private static LoginDAO instance = new LoginDAO();
	
	private LoginDAO() {
		
	}
	
	public static LoginDAO getinstance() {
		return instance;
	}
	
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
	
	public MemberVO selectLoginMember(String id, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO mVo = null; // VO객체 초기화.
		
		String sql = "select * from users where id = ? and password = ?";
								// where조건 : id, password 매개변수값으로 검색.
		try {
			conn = LoginDAO.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); // id, password값 대입.
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				mVo = new MemberVO();// VO객체 생성
				// VO에 값대입
				mVo.setId(rs.getString("id"));
				mVo.setPassword(rs.getString("password"));
				mVo.setAddr(rs.getString("Addr"));
				mVo.setAge(rs.getInt("Age"));
				mVo.setGender(rs.getString("Gender"));
				mVo.setName(rs.getString("Name"));
				mVo.setNation(rs.getString("Nation"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			LoginDAO.close(conn, pstmt, rs);
		}// finally
		return mVo;
	} // selectLoginMember()
	
	
	
	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if (conn != null) conn.close();
			if (stmt != null) stmt.close();
			if (rs!= null) rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}// close()
	
	// 오버로딩이용 , rs가 없을 때.
	public static void close(Connection conn, Statement stmt) {
		try {
			if (conn != null) conn.close();
			if (stmt != null) stmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}// close()
}
