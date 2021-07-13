package unit02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/GetNameServlet")
public class GetNameServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

	// session 객체 얻어오기
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("name");
		
		out.print("<h1>name = " + name + "</h1>"); // 오정원
		// browser를 껐다가 실행하면 null값이 불러와짐.
		
	
	
	
	}

	
	
}
