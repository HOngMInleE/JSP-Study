package com.saeyan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.saeyan.dto.BoardVO;

import util.DBManager;

public class BoardDAO {

// singleTone pattern
	private static BoardDAO instance = new BoardDAO();
	
	private BoardDAO(){
	}
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	//해당 테이블 모든 레코드 조회
		// 몇개인지 모르기 때문에 배열, List타입으로 반환.
	public List<BoardVO> selectAllBoards() {
		String sql = "select * from board order by num desc";
		List<BoardVO> list = new ArrayList<BoardVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				BoardVO bVo = new BoardVO();
				
				bVo.setNum(rs.getInt("num"));
				bVo.setName(rs.getString("name"));
				bVo.setEmail(rs.getString("email"));
				bVo.setPass(rs.getString("pass"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setReadcount(rs.getInt("readcount"));
				bVo.setWritedate(rs.getTimestamp("writedate"));
				
				list.add(bVo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}//selectAllBoards()
	
	//얻어온 데이터를 저장한 VO객체의 데이터를 DB에 넣어주는 메소드
	public void insertBoard(BoardVO bVo) {
		String sql = "insert into board(num, name, email, pass, title, content)"
				+ "values (board_seq.nextval, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bVo.getName());
			pstmt.setString(2, bVo.getEmail());
			pstmt.setString(3, bVo.getPass());
			pstmt.setString(4, bVo.getTitle());
			pstmt.setString(5, bVo.getContent());

			pstmt.executeUpdate(); // 데이터베이스 갱신 / 값을 업데이트함.(저장시킴)
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}// insertBoard()
	
	//조회수 증가 메소드 / 해당 num만 카운트 증가.
	public void updateReadCount(String num) {
		String sql = "update board set readcount = readcount + 1 where num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			pstmt.executeUpdate(); // 데이터베이스 갱신 / 값을 업데이트함.(저장시킴)
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}// updateReadCount()

	// 게시판 글 상세 내용 보기 : 글번호로 찾아온다, : 실패 null.
		//하나의 레코드 정보 조회 메소드 / num을 매개값으로 조회.
	public BoardVO selectOneBoardByNum(String num) {
		BoardVO bVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where num = ?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bVo = new BoardVO();
				bVo.setNum(rs.getInt("num"));
				bVo.setName(rs.getString("name"));
				bVo.setEmail(rs.getString("email"));
				bVo.setPass(rs.getString("pass"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setReadcount(rs.getInt("readcount"));
				bVo.setWritedate(rs.getTimestamp("writedate"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bVo;
	}// selectOneBoardByNum() 
	
	// DB 업데이트 메소드
	public void updateBoard(BoardVO bVo) {
		String sql = "update board set name =?, email=?, pass=?,"
					+ " title=?, content=? where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bVo.getName());
			pstmt.setString(2, bVo.getEmail());
			pstmt.setString(3, bVo.getPass());
			pstmt.setString(4, bVo.getTitle());
			pstmt.setString(5, bVo.getContent());
			pstmt.setInt(6, bVo.getNum());
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}// updateBoard()
	
	//데이터 삭제 메소드
	public void deleteBoard(String num) {
		String sql = "delete board where num = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}// deleteBoard()
	
	
	
	
	
	
	
	
	
	
}//BoardDAO
