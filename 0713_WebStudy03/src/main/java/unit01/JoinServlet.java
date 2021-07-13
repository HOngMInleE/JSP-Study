package unit01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/JoinServlet")
public class JoinServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String name=request.getParameter("name");
		String jumin=request.getParameter("jumin_1")+ "-" + request.getParameter("jumin_2");
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		
		if(request.getParameter("email_dns").trim() == ""){
			email += "@" + request.getParameter("emailaddr");
		}else {
			email += "@" + request.getParameter("email_dns");
		}
		
		String zip = request.getParameter("zip");
		String addr = request.getParameter("addr1") + request.getParameter("addr2");
		String phone = request.getParameter("phone");
		//String job = request.getParameter("job");
		String[] jobs = request.getParameterValues("job");
		String sms = request.getParameter("chk_mail");
		String[] intersts = request.getParameterValues("interest");
		
		out.print("<html><head><title></title></head>");
		out.print("<body>");
		
		out.println("이름 : <b>");
		out.print(name);
		
		out.println("<br>주민번호 : <b>");
		out.print(jumin);
		
		out.println("<br>아이디 : <b>");
		out.print(id);
		
		out.println("<br>비밀번호 : <b>");
		out.print(pwd);
		
		out.println("</b><br>이 메 일 : <b>");
		out.print(email);
		
		out.println("<br>우편번호 : <b>");
		out.print(zip);
		
		out.println("<br>주소 : <b>");
		out.print(addr);
		
		out.println("<br>핸드폰 번호 : <b>");
		out.print(phone);
		
		out.println("<br>직업 : <b>");
		//out.print(job);
		if(jobs == null) {
			out.print("선택항목없음");
		}else {
			for(String job : jobs) {
				out.print(job + " ");
			}
		}
		
		out.println("<br>메일수신 / SMS: <b>");
		out.print(sms);
		
		out.println("<br>관심분야 : <b>");
		if(intersts == null) {
			out.print("선택항목없음");
		}else {
			for(String interest : intersts) {
				out.print(interest + " ");
			}
		}
		
		out.print("<br><a href = 'javascript:history.go(-1)'>돌아가기</a>");
		out.print("</body>");
		out.print("</html>");
		out.close();
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
