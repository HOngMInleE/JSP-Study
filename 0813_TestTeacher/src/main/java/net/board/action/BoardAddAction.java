package net.board.action;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String savePath = "boardupload";
		int uploadFileSizeLimit = 20 * 1024 * 1024;
		String encType = "UTF-8";
		
		ServletContext context = request.getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		
		MultipartRequest multi = null;

		multi = new MultipartRequest(
				request, 
				uploadFilePath,
				uploadFileSizeLimit, 
				encType,
				new DefaultFileRenamePolicy());			

		
		ActionForward af = new ActionForward();
		
		BoardBean bVo = new BoardBean();
		
		bVo.setName(multi.getParameter("name"));
		bVo.setPass(multi.getParameter("pass"));
		bVo.setContent(multi.getParameter("content"));
		bVo.setSubject(multi.getParameter("subject"));
		bVo.setFile(multi.getFilesystemName("file"));
		
		BoardDAO bDao = new BoardDAO();
		
		bDao.boardInsert(bVo);
		
		af.setPath("/board/qna_board_list.jsp"); // 주소 저장(url)
		af.setRedirect(false); // 이동 방식 결정 
		System.out.println("AddAction요청받은 명령어는 : " + af.getPath());

		return af;
	}

}
