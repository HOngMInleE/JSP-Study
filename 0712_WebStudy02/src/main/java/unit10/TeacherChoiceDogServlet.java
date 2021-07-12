package unit10;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TeacherChoiceDogServlet")
public class TeacherChoiceDogServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String[] dog = request.getParameterValues("dog");
		
		out.print("<html><head><title></title></head>");
		out.print("<body bgcolor='black'>"); 
					// 쌍따옴표 사용 조심. 큰따음표안에는 작은따음표사용.
		out.print("<table align='center' bgcolor='yellow'>");
		out.print("<tr>");
// td 안에 check된 image보이기	
		for (int i=0; i<dog.length;i++) {
			out.print("<td>");
			out.print("<img src='" + dog[i] + "'>");
			out.print("</td>");
		}
		out.print("</tr>");
		out.print("</table>");
		out.print("<br><a href = 'javascript:history.go(-1)'>돌아가기</a>");
		out.print("</body>");
		out.print("</html>");
		
		out.close();	
	}

}
