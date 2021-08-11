package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVO;

public class BoardUpdateFormAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/board/boardUpdate.jsp";
		
		String num = request.getParameter("num");
		// num을 키값,중심으로 해당 레코드 수정
		BoardDAO bDao = BoardDAO.getInstance();
		BoardVO bVo = bDao.selectOneBoardByNum(num);
		// 해당 레코드 정보 불러오기
		request.setAttribute("board", bVo);
		// request객체에 불러온 정보 저장
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
