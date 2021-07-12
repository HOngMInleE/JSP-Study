package unit10;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DogCheckServlet")
public class DogCheckServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String dogs[] = request.getParameterValues("dog");
		
		out.print("<html><head><title></title></head>");
		out.print("<body>");
		
		if (dogs == null) {
			out.print("선택항목이 없습니다.");
		} else {
			for (String dog : dogs) {
				out.print(dog);
			}
		}
		
		out.print("<br><a href = 'javascript:history.go(-1)'>돌아가기</a>");
		out.print("</body>");
		out.print("</html>");
		
		out.close();	
	}


}
