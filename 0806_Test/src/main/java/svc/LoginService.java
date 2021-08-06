package svc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.LoginDAO;
import vo.MemberVO;

public class LoginService {

		public MemberVO getLoginMember() {
			MemberVO mVo = new MemberVO();
		
		
			return mVo;
		}// getLoginMember()
		
		
		public MemberVO selectLoginMember(String id, String password) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			MemberVO mVo = new MemberVO();
			String sql = "select * from users where id=?";
			try {
				conn = LoginDAO.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					if (id.equals(rs.getString("id")) && 
							password.equals(rs.getString("password"))) { //아이디, 비번 일치
						mVo.setId(rs.getString("id"));
						mVo.setPassword(rs.getString("password"));
					}else { // 불일치로 로그인 실패
						return null;
					}
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				LoginDAO.close(conn, pstmt, rs);
			}// finally
			return mVo;
		} // selectLoginMember()
	

	
	
}// LoginService Class
