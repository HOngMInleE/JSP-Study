package unit02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login") // 설정해준 값. 대소문자 가림
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	// 한글깨짐 방지 post방식에서 해주어야함.
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");
		
		if (id.equals("java") && pwd.equals("java")) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			
		// 해당 페이지의 객체 설정
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher("loginSuccess.jsp");
			
		// 해당 페이지로의 이동
			dispatcher.forward(request, response);
		} else {
			out.println("<script>");
			out.println("alert('아이디나 비밀번호가 일치하지 않습니다.')");
			out.println("history.back()"); // go -1과 같음.
			out.println("</script>");
			
			out.close();
		}
		
		
	}

	
	
}

