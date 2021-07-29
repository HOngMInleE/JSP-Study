package com.saeyan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import com.saeyan.dto.MemberVO;

import javax.naming.InitialContext;
import javax.naming.Context;

public class MemberDAO {
// 싱글톤 패턴
	// 특징
		// 직접 생성이 불가능한 클래스
		// 내부에서 한 번만 생서된다.
	// 조건
		// 생성자는 private 해야한다.
		// private 하면서 Static 한  멤버변수가 존재한다.
		// public 하면서 static 한 메소드가 존재한다.
			// static 하지 않으면 사용할 수가 없음.
	
	private MemberDAO() {
	
	}

	private static MemberDAO memberInstance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return memberInstance;
	}
	
	public Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/oracleDB");
		// 위와 같음
		// DataSource ds = (Datasource) initContext.lookup("java:/comp/env/jdbc/OracleDB");
		Connection conn = ds.getConnection();
		return conn; 
	}
	
	//사용자 인증시 사용하는 메소드
	public int userCheck(String userid, String pwd) {
		int result = -1;
		String sql = "select pwd from member where userid = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("pwd") != null && rs.getString("pwd").equals(pwd)) {
					result = 1;
				}else {
					result = 0;
				}
			}else { // id, pwd 둘다 일치하지 않을때 rs.next() = false
				result = -1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			} //catch end
		}//finally end
		return result;
	}//userCheck end
	
	public MemberVO getMember(String userid) {
		MemberVO memberVO = null;
		String sql = "select * from member where userid = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				memberVO = new MemberVO();
				memberVO.setName(rs.getString("name"));
				memberVO.setUserid(rs.getString("userid"));
				memberVO.setPwd(rs.getString("pwd"));
				memberVO.setEmail(rs.getString("email"));
				memberVO.setPhone(rs.getString("phone"));
				memberVO.setAdmin(rs.getShort("admin"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			} //catch end
		} //finally end
		
		
		return memberVO;
	}//getMember end
	
	public int confirmID(String userid) {
		int result = -1; // 해당 아이디 없으면 기본값인 -1 리턴.
		
		String sql = "select userid from member where userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return 1; // result = 1;
			}else {
				return -1; // result = -1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			} //catch end
		} //finally end
		return result;
	}//confirmID end
	
	public int insertMember(MemberVO mVo) {
		int result = -1;
		String sql = "insert into member values(?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt .setString(1,mVo.getName());
			pstmt .setString(2,mVo.getUserid());
			pstmt .setString(3,mVo.getPwd());
			pstmt .setString(4,mVo.getEmail());
			pstmt .setString(5,mVo.getPhone());
			pstmt .setInt(6,mVo.getAdmin());
			
			result = pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			} //catch end
		} //finally end
		
		return result;
	}//insertMember end
	
	public int updateMember(MemberVO mVo) {
		int result = -1;
		String sql = "update member set pwd=?, email=?, phone=?, admin=? where userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt .setString(1,mVo.getPwd());
			pstmt .setString(2,mVo.getEmail());
			pstmt .setString(3,mVo.getPhone());
			pstmt .setInt(4,mVo.getAdmin());
			pstmt.setString(5, mVo.getUserid());
			
			result = pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			} //catch end
		} //finally end
		
		return result;
	}
}
