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

@WebServlet("/custom.do")
public class CustomJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		EmployeesVO emp = (EmployeesVO) session.getAttribute("loginUser"); // object타입에서 형변환.
		int result = (int) session.getAttribute("result");
		
		if (emp != null && result == 2) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("customJoin.jsp");
			dispatcher.forward(request, response);
		}else {
			response.sendRedirect("login.do");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		EmployeesVO member = new EmployeesVO();
		
		member.setId(request.getParameter("id"));
		member.setPass(request.getParameter("pwd"));
		member.setName(request.getParameter("name"));
		member.setLev(request.getParameter("lev"));
		member.setGender(Integer.parseInt(request.getParameter("gender")));
		member.setPhone(request.getParameter("phone"));
		
		EmployeesDAO memberDAO = EmployeesDAO.getInstance();
		memberDAO.insertMember(member);
		
		request.setAttribute("member", member); // 페이지가 바뀌어도 같은 정보를 사용하기위해
		request.setAttribute("message", "회원 등록에 성공했습니다.");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("joinSuccess.jsp");
		dispatcher.forward(request, response);
		
	}

}
