package unit06;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/InfoServlet")
public class InfoServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		
		out.print("<html><head><title></title></head>");
		out.print("<body>");
		out.print("당신이 입력한 정보입니다.<br>");
		out.print("아이디 : ");
		out.print(name+"<br>");
		out.print("나이 : ");
		out.print(addr);
		out.print("<br><a href = 'javascript:history.go(-1)'>돌아가기</a>");
		out.print("</body>");
		out.print("</html>");
		
		out.close();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doGet(request,response);
//	// doGet과 내용이 같아서 doGet을 불러오는 형식으로 작성도 가능(흔치않음)
//		response.setContentType("text/html;charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		
//		String name = request.getParameter("name");
//		String addr = request.getParameter("addr");
//		
//		out.print("<html><head><title></title></head>");
//		out.print("<body>");
//		out.print("당신이 입력한 정보입니다.<br>");
//		out.print("아이디 : ");
//		out.print(name+"<br>");
//		out.print("나이 : ");
//		out.print(addr);
//		out.print("<br><a href = 'javascript:history.go(-1)'>돌아가기</a>");
//		out.print("</body>");
//		out.print("</html>");
//		
//		out.close();
	}

}
