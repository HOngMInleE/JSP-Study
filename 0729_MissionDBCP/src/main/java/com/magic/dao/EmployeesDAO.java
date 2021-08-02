package com.magic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.magic.dto.EmployeesVO;

// 싱글톤 패턴
	// 특징
		// 직접 생성이 불가능한 클래스
		// 내부에서 한 번만 생성된다.
	// 조건
		// 생성자는 private 해야한다.
		// private 하면서 Static 한  멤버변수가 존재한다.
		// public 하면서 static 한 메소드가 존재한다.
		// static 하지 않으면 사용할 수가 없음.

public class EmployeesDAO {
	
	private static EmployeesDAO instance = new EmployeesDAO();

	private EmployeesDAO() {
	}
	
	public static EmployeesDAO getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Connection conn = null;
		Context initContext = null;
		try {
			initContext = new InitialContext();
			DataSource ds = (DataSource)initContext.lookup("java:/comp/env/jdbc/oracleDB");
			conn = ds.getConnection();
		}catch (NamingException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	} //getConnection end
	
	public int userCheck(String userid, String pwd, String lev) {
		int result = 1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from employees where id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			rs = pstmt.executeQuery();
			if (rs.next()) { //비밀번호가 일치하고
				if (pwd.equals(rs.getString("pass"))) { //회원등급이 일치하면
					if (lev.equals(rs.getString("lev"))) { // 관리자로 로그인성공
						result = 2;
						if (lev.equals("B")) { // 일반회원으로 로그인성공
							result = 3;
						}
					}else { // lev 불일치로 로그인 실패
						result = 1;
					}
				} else { // pass 불일치로 로그인 실패
					result = 0;
				}
			}else { // id 불일치로 로그인 실패
				result = -1;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null ) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		} //finally end
		return result;
	} //method userCheck end
	
	public EmployeesVO getMember(String id) {
		EmployeesVO member = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from employees where id=?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new EmployeesVO();
				member.setId(rs.getString("ID"));
				member.setPass(rs.getString("PASS"));
				member.setName(rs.getString("NAME"));
				member.setLev(rs.getString("LEV"));				
				member.setEnter(rs.getDate("ENTER"));
				member.setGender(rs.getInt("GENDER"));
				member.setPhone(rs.getString("PHONE"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null ) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		} //finally end
		return member;
	} //method getMember end
	
	public int updateMember (EmployeesVO eVo) {
		int result = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update employees set pass=?, name=?, lev=?, gender=?, phone=? where id=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql); // sql을 통해 정보 얻어오기
			
			pstmt.setString(1, eVo.getPass());
			pstmt.setString(2, eVo.getName());
			pstmt.setString(3, eVo.getLev());
			pstmt.setInt(4, eVo.getGender());
			pstmt.setString(5, eVo.getPhone());
			pstmt.setString(6, eVo.getId());
			
			result = pstmt.executeUpdate();
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null ) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		} //finally end
		return result;
	} //method updateMember end
	
	public void insertMember(EmployeesVO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into employees values (?, ?, ?, ?, sysdate, ?, ?)";
												// 컬럼이 7개라 갯수 맞춰줌. sysdate로 현재시간설정.
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql); // sql을 통해 정보 얻어오기
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getLev());
			pstmt.setInt(5, member.getGender());
			pstmt.setString(6, member.getPhone());
			
			pstmt.executeUpdate();
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null ) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		} //finally end

	}// method insertMember end
	
}
