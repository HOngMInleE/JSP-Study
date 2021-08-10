package com.saeyan.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVO;

public class BoardListAction implements Action{
// Action을 항상 implements 해야함
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "board/boardList.jsp";
		
		BoardDAO bDao = BoardDAO.getInstance();
		List<BoardVO> boardList = bDao.selectAllBoards();
		// 모든 정보 조회하는 메소드 불러오기
		request.setAttribute("boardList", boardList);
		// request에 boardList란 이름으로 불러온 값 저장
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response); // 데이터 가진채로 페이지 이동
	}//execute()

}
