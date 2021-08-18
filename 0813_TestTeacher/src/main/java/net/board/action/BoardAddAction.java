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
		
		BoardDAO boardDao = new BoardDAO();
		BoardBean boardData = new BoardBean();
		ActionForward af = new ActionForward();
		
		String realFolder = "";
		String saveFolder = "boardupload";
		realFolder = request.getRealPath(saveFolder);
		
		int filesize = 10 * 1024 * 1024;
		
		boolean result = false;
		
		try {
			
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, 
					realFolder,
					filesize,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);
			boardData.setName(multi.getParameter("board_name"));
			boardData.setPass(multi.getParameter("board_pass"));
			boardData.setSubject(multi.getParameter("board_subject"));
			boardData.setContent(multi.getParameter("board_content"));
			
			boardData.setFile(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("File upload 오류");
		}
		
		
		
		af.setPath("/board/qna_board_list.jsp"); // 주소 저장(url)
		af.setRedirect(false); // 이동 방식 결정 
		System.out.println("AddAction요청받은 명령어는 : " + af.getPath());

		return af;
	}

}
