package mission;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Mission")
public class MissionServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String socialNum = request.getParameter("socialnum");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String psswordCheck = request.getParameter("passwordCheck");
		String email = request.getParameter("email");
		String email2 = request.getParameter("email2");
		String zipCode = request.getParameter("zipCode");
		String address = request.getParameter("address");
		String phoneNum = request.getParameter("phoneNum");
		String job = request.getParameter("job");
		String receiveMail = request.getParameter("receiveMail");
		String interest = request.getParameter("interest");
		String agree = request.getParameter("agree");
		String cancel = request.getParameter("cancel");
	}


}
