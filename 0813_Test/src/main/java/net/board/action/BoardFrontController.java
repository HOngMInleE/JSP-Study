package net.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.bo")
public class BoardFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//183P
		String uri = request.getRequestURI(); // uri 
		String path = request.getContextPath(); // ContextPath
		String bo = uri.substring(path.length()); // uri - ContextPath = bo;
		
		ActionForward af = null;
		Action action = null;
		System.out.println("ActionController 요청받은 명령어는 : " + bo);
		
		if (bo.equals("/BoardList.bo")) {
			action = new BoardListAction();
			try {
				af = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (bo.equals("/BoardWrite.bo")) {
			af = new ActionForward();
			af.setRedirect(true); // Redirect
			af.setPath("/board/qna_board_write.jsp");
		}else if (bo.equals("/BoardAddAction.bo")){
			action = new BoardAddAction();
			try {
				af = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (bo.equals("/BoardDetail.bo")) {
			action = new BoardDetailAction();
			try {
				af = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//catch
		}//if bo
		
		// true: redirect    false: forward방식
		if (af.isRedirect() == true) {
			response.sendRedirect(af.getPath());
		} else if (af.isRedirect() == false) {
			RequestDispatcher rd = request.getRequestDispatcher(af.getPath());
			rd.forward(request, response);
		}
		
	}//doProcess

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}