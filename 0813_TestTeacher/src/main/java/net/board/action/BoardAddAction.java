package net.board.action;

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
		
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		ActionForward forward = new ActionForward();
		
		String realFolder = "";
		String saveFolder = "boardupload";
		realFolder = request.getRealPath(saveFolder);
		
		int filesize = 10 * 1024 * 1024;
		
		boolean result = false;
		
		try {
			
			MultipartRequest multi = null;
			
			multi = new MultipartRequest(request,realFolder,filesize,"UTF-8",new DefaultFileRenamePolicy());
			boarddata.setName(multi.getParameter("board_name"));
			boarddata.setPass(multi.getParameter("board_pass"));
			boarddata.setSubject(multi.getParameter("board_subject"));
			boarddata.setContent(multi.getParameter("board_cotent"));
			
			boarddata.setFile(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
			
			result = boarddao.boardInsert(boarddata);
			
			if(result == false) {
				System.out.println("게시판 등록 실패");
				return null;
			}
			
			System.out.println("게시판 등록 완료");
			
			forward.setRedirect(true);
			forward.setPath("./BoardList.bo");
			
			return forward;
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return null;
	}

}
