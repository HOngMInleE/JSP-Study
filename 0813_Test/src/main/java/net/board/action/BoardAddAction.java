package net.board.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward af = new ActionForward();
		
		BoardBean bVo = new BoardBean();
		
		bVo.setName(request.getParameter("name"));
		bVo.setPass(request.getParameter("pass"));
		bVo.setContent(request.getParameter("content"));
		bVo.setSubject(request.getParameter("subject"));
		bVo.setFile(request.getParameter("file"));
		
		BoardDAO bDao = new BoardDAO();
		
		bDao.boardInsert(bVo);
		
		af.setPath("/board/qna_board_list.jsp"); // 주소 저장(url)
		af.setRedirect(false); // 이동 방식 결정 
		System.out.println("WriteAction요청받은 명령어는 : " + af.getPath());

		return af;
	}

}
