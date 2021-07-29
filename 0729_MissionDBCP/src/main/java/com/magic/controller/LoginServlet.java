package com.magic.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.magic.dao.EmployeesDAO;
import com.magic.dto.EmployeesVO;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html;charset=UTF-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String lev = request.getParameter("lev");
		
		String url = null;
		
		EmployeesDAO empDAO = EmployeesDAO.getInstance();
		int result = empDAO.userCheck(id, pwd, lev);
		
		if (result == 2 || result == 3) { 
			// 로그인성공
			EmployeesVO emp = new EmployeesVO();
			emp = empDAO.getMember(id);
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", emp);
			session.setAttribute("result", result);
			url = "main.jsp";
		}else { 
			// 로그인 실패
			if (result == 1) {
				request.setAttribute("message", "레벨이 일치하지 않습니다.");
			}else if (result == 0) {
				request.setAttribute("message", "비밀번호가 일치하지 않습니다.");
			}else {
				request.setAttribute("message", "아이디가 일치하지 않습니다.");
			}
			url = "login.jsp";
		}//if end
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	
	}

}
