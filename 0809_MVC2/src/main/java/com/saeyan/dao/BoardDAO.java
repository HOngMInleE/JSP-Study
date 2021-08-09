package com.saeyan.dao;

public class BoardDAO {

// singleTone pattern
	private static BoardDAO instance = new BoardDAO();
	
	private BoardDAO(){
	}
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	
}
