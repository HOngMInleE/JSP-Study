package net.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward af = new ActionForward();
		
		BoardDAO bDao = new BoardDAO();
		List<BoardBean> boardList = bDao.getBoardList();
		
		request.setAttribute("boardList", boardList);
		// request에 불러온 값 저장

		af.setPath("/board/qna_board_view.jsp"); // 주소 저장(url)
		af.setRedirect(false); // 이동 방식 결정
		System.out.println("DetailAction요청받은 명령어는 : " + af.getPath());
		
		return af;
	}

}
