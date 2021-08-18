package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		BoardDAO bDao = new BoardDAO();
		BoardBean bVo = new BoardBean();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		bDao.setReadCountUpdate(num);
		bVo = bDao.getDetail(num);
		
		if (bVo == null) {
			System.out.println("상세보기 실패");
			return null;
		}
		System.out.println("상세보기 성공");
		
		request.setAttribute("boardData", bVo);
		
		ActionForward af = new ActionForward();
		
		af.setRedirect(false); // 이동 방식 결정
		af.setPath("./board/qna_board_view.jsp"); // 주소 저장(url)
		System.out.println("DetailAction요청받은 명령어는 : " + af.getPath());
		
		return af;
	}

}
