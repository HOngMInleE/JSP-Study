package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MovieVO;
import util.DBManager;

public class MovieDAO {

//SingleTone Pattern
	// private static 본인(DAO)타입의 객체 생성
	private static MovieDAO instance = new MovieDAO();
	// private (기본)생성자 생성
	private MovieDAO() {

	}
	// public static 본인(DAO)타입 getinstance() 이름의 메소드 생성 //getter역할.
	public static MovieDAO getinstance() {
		return instance;
	}
	
// DB에서 movie테이블의 '모든' 데이터를 얻어와 저장하는 메소드
	public ArrayList<MovieVO> selectAllMovies() {
		ArrayList<MovieVO> movieList = new ArrayList<MovieVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from movie order by code desc";
				
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MovieVO mVo = new MovieVO(); // 데이터가 저장될 VO객체 생성
				mVo.setCode(rs.getInt("code")); // rs를 통해 DB정보 불러와서 set을 통해 데이터 저장
				mVo.setTitle(rs.getString("title"));
				mVo.setDirector(rs.getString("director"));
				mVo.setActor(rs.getString("actor"));
				mVo.setPoster(rs.getString("poster"));
				mVo.setSynopsis(rs.getString("synopsis"));
				movieList.add(mVo); // List타입 VO객체에 데이터 저장
			}
		}catch (Exception e) {
			
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return movieList; // DB에서 불러온 데이터가 저장된 List타입의 VO객체 return.
	}// selectAllMovies()
	
	
}
