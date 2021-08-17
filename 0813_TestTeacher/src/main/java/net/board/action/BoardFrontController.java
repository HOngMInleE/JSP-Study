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
		
	// 요청 처리
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		ActionForward forward = new ActionForward();
		Action action = null;
		System.out.println("ActionController 요청받은 명령어는 : " + command);
		
		if (command.equals("/BoardList.bo")) {
			action = new BoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(command + "요청 오류");
			}
		}//if
	
		// 공통 기능
		if (forward != null) {
			if (forward.isRedirect() == true) {
					response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
			}
		}//if		
		
		
		
		
	}//doProcess

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}