package net.board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		BoardDAO bDao = new BoardDAO();
		List<BoardBean> boardList = new ArrayList<BoardBean>();
		
		boardList = bDao.getBoardList(); // 전체 글 정보 받아오기
		int boardCount = bDao.getListCount(); // 전체 글의 개수 받아오기

		request.setAttribute("boardList", boardList);
		request.setAttribute("boardCount", boardCount);
		// request에 불러온 값 저장

		ActionForward af = new ActionForward();
		
		af.setPath("/board/qna_board_list.jsp"); // 주소 저장(url)
		af.setRedirect(false); // 이동 방식 결정
		
		System.out.println("ListAction요청받은 명령어는 : " + af.getPath());
		
		return af;
	}
	
	

}
