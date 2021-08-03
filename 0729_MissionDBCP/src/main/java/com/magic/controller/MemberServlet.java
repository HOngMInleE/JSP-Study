package com.magic.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.magic.dao.EmployeesDAO;
import com.magic.dto.EmployeesVO;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("/member.do")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stubresponse.getWriter().append(Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession();
		EmployeesVO emp = (EmployeesVO) session.getAttribute("loginUser");
		int result = (Integer)session.getAttribute("result");
		
		if (emp != null && result == 2) {
			EmployeesDAO memberDAO = EmployeesDAO.getInstance();
			
			ArrayList<EmployeesVO> memberlist = memberDAO.selectMember();//List : ArrayList 부모.
			request.setAttribute("memberlist", memberlist); // 가져온 정보 저장
			request.setAttribute("message", "사원 정보 조회 성공");
			
			RequestDispatcher rd = request.getRequestDispatcher("memberlist.jsp");
			rd.forward(request, response);
			
		}else {
			response.sendRedirect("login.do");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
