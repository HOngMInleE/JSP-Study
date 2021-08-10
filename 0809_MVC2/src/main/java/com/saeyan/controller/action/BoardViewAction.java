package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVO;

public class BoardViewAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/board/boardView.jsp";
		
		String num = request.getParameter("num");
		// num값 받아오기
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		bDao.updateReadCount(num);
		// 해당 num 조회수증가 
		
		BoardVO bVo = bDao.selectOneBoardByNum(num);
		// 해당 컬럼 조회
		
		request.setAttribute("board", bVo);
		// request영역에 'board'라는 이름으로 불러온 컬럼저장
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		// 데이터 가진채로 페이지 이동
	}

}
