package unit01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print("<html><head><title></title></head>");
		out.print("<body>");
		out.print("Hello Servlet 안녕하세요");
		out.print("</body>");
		out.print("</html>");
		
		// HTTP 상태 404 – 찾을 수 없음 // Servers 에서 Restart 해줘야 실행이 잘 됨.
		// Hello Servlet 실행 잘 됨.
	}

}
