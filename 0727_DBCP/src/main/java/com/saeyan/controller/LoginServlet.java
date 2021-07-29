package com.saeyan.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saeyan.dao.MemberDAO;
import com.saeyan.dto.MemberVO;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	// 정보 없이 이동만 하기때문에 redirect 방식 사용. // member/login.jsp (주소가 노출됨)
		//response.sendRedirect("member/login.jsp");
		
	// url에서 주소 노출 방지, 보안를 위해 forward 방식 사용. // login.do (주소가 노출되지 않음)
		RequestDispatcher dispatcher = request.
				getRequestDispatcher("member/login.jsp");
		dispatcher.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String url ="member/login.jsp";
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
	
		PrintWriter out = response.getWriter();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		int result = memberDAO.userCheck(userid, pwd);
		
		if (result == 1) {
			MemberVO memberVO = memberDAO.getMember(userid);
			HttpSession session = request.getSession(); // id 기억을 위해 session에 저장
			session.setAttribute("loginUser",memberVO);
			session.setAttribute("message","로그인에 성공했습니다.");
			url = "main.jsp";
			
			out.println("로그인에 성공했습니다.");
			
		}else if (result == 0) {
			request.setAttribute("message","비밀번호가 맞지 않습니다.");
			out.println("비밀번호가 맞지 않습니다.");
		}else if (result == -1) {
			request.setAttribute("message", "존재하지 않는 회원입니다.");
			out.println("존재하지 않는 회원입니다.");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	
}
