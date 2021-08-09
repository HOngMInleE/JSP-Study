package svc;

import dao.LoginDAO;
import vo.MemberVO;

public class LoginService {
	
	public MemberVO getLoginMember(String id, String password) {
		
		LoginDAO loginDao = LoginDAO.getinstance();
		MemberVO mVo = loginDao.selectLoginMember(id, password);
	// 중복되는 코드들 생략할 수 있음.
		
		
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "select * from users where id=?";
//
//		try {
//			conn = LoginDAO.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1,id);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				mVo.setId(rs.getString("id"));
//				mVo.setPassword(rs.getString("password"));
//			}
//			}catch (Exception e) {
//				e.printStackTrace();
//			}finally {
//				LoginDAO.close(conn, pstmt, rs);
//			} //finally end
		return mVo;
	}// getLoginMember()
		
}// LoginService Class
