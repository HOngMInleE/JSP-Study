package unit05;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ParamServlet")
public class ParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// request = 클라이언트가 요청한 데이터를 처리하는 역할
		String id = request.getParameter("id");
		String age = request.getParameter("age");
		
		out.print("<html><head><title></title></head>");
		out.print("<body>");
		out.print("당신이 입력한 정보입니다.");
		out.print("아이디 : ");
		out.print(id);
		out.print("나이 : ");
		out.print(age);
		out.print("<br><a href = 'javascript:history.go(-1)'>돌아가기</a>");
		out.print("</body>");
		out.print("</html>");
	}

}
