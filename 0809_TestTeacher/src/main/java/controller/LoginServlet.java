package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.LoginService;
import vo.MemberVO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
//		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String password = request.getParameter("pwd");
		String url = null;
		
		LoginService svc = new LoginService();
		MemberVO mVo = new MemberVO();
				
		mVo = svc.getLoginMember(id, password);
		
		if (mVo != null) { 
			// 로그인성공
			// mVo = svc.getLoginMember(id); // VO객체에 회원정보 읽어옴
			
			HttpSession session = request.getSession();
			session.setAttribute("id", id); 
			url = "index.jsp"; 
		}else { 
			// 로그인 실패
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인실패')");
			out.println("history.back()");
			out.println("</script>");
			
			
//			out.print("<script>");
//			out.print("alert('로그인실패')");
//			out.print("</script>");
		}//if end
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
