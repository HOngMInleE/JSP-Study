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

@WebServlet("/mypage.do")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		EmployeesVO emp = (EmployeesVO) session.getAttribute("loginUser"); //Attribute : object 반환타입, 캐스팅필요
		
		if (emp != null) { //session 정보가 있으면 페이지 이동
			RequestDispatcher dispatcher = request.getRequestDispatcher("mypage.jsp");
			dispatcher.forward(request, response);
		}
	}
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html;charset=UTF-8");
		
		EmployeesVO member = new EmployeesVO(); 
		
		member.setId(request.getParameter("id")); // parameter값을 VO에 넣어줌.
		member.setPass(request.getParameter("pwd"));
		member.setName(request.getParameter("name"));
		member.setLev(request.getParameter("lev"));
		member.setGender(Integer.parseInt(request.getParameter("gender")));
		member.setPhone(request.getParameter("phone"));
		
		EmployeesDAO eDao = EmployeesDAO.getInstance();
		eDao.updateMember(member);
		
		HttpSession session = request.getSession();
		request.setAttribute("member", member); // 페이지가 바뀌어도 같은 정보를 사용하기위해
		request.setAttribute("message", "회원 정보가 수정되었습니다.");
		
		EmployeesVO emp = eDao.getMember(member.getId());
		session.setAttribute("loginUser", emp); // 해당 id의 유저를 loginUser에 저장
		
		int result = eDao.userCheck(member.getId(), member.getPass(), member.getLev());
		
		session.setAttribute("result", result); //넘어온 result 값을 result란 session에 저장
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("joinSuccess.jsp");
		dispatcher.forward(request, response);
		
		
	} //doPost end

	
	
}
