package dao;

import java.util.List;

import dto.MovieVO;

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
	
	// DB에서 movie테이블의 모든 정보 얻어오는 메소드
	public List<MovieVO> selectAllMovies() {
		
		
		return null;
	}
}
