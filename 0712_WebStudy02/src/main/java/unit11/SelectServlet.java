package unit11;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SelectServlet")
public class SelectServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String job = request.getParameter("job");
		String[] interest = request.getParameterValues("interest");

	// 당신이 선택한 직업
		out.print("<html><head><title></title></head>");
		out.print("<body>"); 
		out.print("당신이 선택한 직업 : ");
		out.print(job + "<br>");
		
	// 당신의 관심분야 
		// 관심분야 없음 포함
		out.print("당신의 관심분야 : ");
		if (interest == null) {
			out.print("관심분야가 없습니다.");
		} else {
			for (String interests : interest) {
				out.print(interests + " ");
			}
		}
		out.print("<br><a href = 'javascript:history.go(-1)'>돌아가기</a>");
		out.print("</body>");
		out.print("</html>");
		out.close();	
	}


}
