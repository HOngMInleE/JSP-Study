package employees.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import employees.dto.EmpVO;
import util.DBManager;

public class EmpDAO {

	private static EmpDAO instance = new EmpDAO();
	
	private EmpDAO() {
		
	}
	
	public static EmpDAO getInstance() {
		return instance;
	}
	
	//해당 테이블 모든 레코드 조회
			// 몇개인지 모르기 때문에 배열, List타입으로 반환.
		public List<EmpVO> selectAllEmployees() {
			String sql = "select * from employees order by name desc";
			List<EmpVO> list = new ArrayList<EmpVO>();
			
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try {
				conn = DBManager.getConnection();
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					EmpVO eVo = new EmpVO();
					
					eVo.setId(rs.getString("id"));
					eVo.setName(rs.getString("name"));
					eVo.setLev(rs.getString("lev"));
					eVo.setEnter(rs.getDate("enter"));
					eVo.setGender(rs.getString("gender"));
					eVo.setPhone(rs.getString("phone"));
					
					list.add(eVo);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, stmt, rs);
			}
			return list;
		}//selectAllEmployees()
		
		//얻어온 데이터를 저장한 VO객체의 데이터를 DB에 넣어주는 메소드
		public void insertEmployee(EmpVO eVo) {
			String sql = "insert into employees(id, pass, name, lev, gender, phone)"
					+ "values (?, ?, ?, ?, ?, ?)";
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, eVo.getId());
				pstmt.setString(2, eVo.getPass());
				pstmt.setString(3, eVo.getName());
				pstmt.setString(4, eVo.getLev());
				pstmt.setString(5, eVo.getGender());
				pstmt.setString(6, eVo.getPhone());

				pstmt.executeUpdate(); // 데이터베이스 갱신 / 값을 업데이트함.(저장시킴)
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt);
			}
		}// insertEmployee()
		
		// 상세 내용 보기 : id로 찾아온다
			//하나의 레코드 정보 조회 메소드 / id를 매개값으로 조회.
			public EmpVO selectOneEmpById(String id) {
				EmpVO eVo = null;
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from employees where id = ?";
				
				try {
					conn = DBManager.getConnection();
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, id); // id 조건 대입
					
					rs = pstmt.executeQuery();
					
					if (rs.next()) { //DB에서 불러와 VO에 저장
						eVo = new EmpVO();
						eVo.setId(rs.getString("id"));
						eVo.setPass(rs.getString("pass"));
						eVo.setName(rs.getString("name"));
						eVo.setLev(rs.getString("lev"));
						eVo.setGender(rs.getString("gender"));
						eVo.setPhone(rs.getString("phone"));
						eVo.setEnter(rs.getDate("enter"));
					}
				}catch (Exception e) {
					e.printStackTrace();
				}finally {
					DBManager.close(conn, pstmt, rs);
				}
				return eVo;
			}// selectOneEmpById() 
		
			// VO에 저장된 정보 DB로 저장
			public void updateEmployee(EmpVO eVo) {
				String sql = "update employees set id=?, pass=?, name=?, lev=?, gender=?, phone=? where id=?";
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				try {
					conn = DBManager.getConnection();
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, eVo.getId());
					pstmt.setString(2, eVo.getPass());
					pstmt.setString(3, eVo.getName());
					pstmt.setString(4, eVo.getLev());
					pstmt.setString(5, eVo.getGender());
					pstmt.setString(6, eVo.getPhone());
					pstmt.setString(7, eVo.getId());
					
					pstmt.executeUpdate();
				}catch (Exception e) {
					e.printStackTrace();
				}finally {
					DBManager.close(conn, pstmt);
				}
			}// updateEmployee()
			
			// DB에 저장된 해당 사원 데이터 삭제 메소드 // id를 매개값으로 사용
			public void deleteEmployee(String id) {
				String sql = "delete employees where id = ?";
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				try {
					conn = DBManager.getConnection();
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, id);
						// 매개값으로 넘어온 id를 조건문에 사용, 해당 컬럼 삭제
					
					pstmt.executeUpdate();
				}catch (Exception e) {
					e.printStackTrace();
				}finally {
					DBManager.close(conn, pstmt);
				}
			}// deleteEmployee()
		
}//EmpDAO end
