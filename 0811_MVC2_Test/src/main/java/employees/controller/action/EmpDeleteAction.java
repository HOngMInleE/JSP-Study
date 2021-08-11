package employees.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employees.dao.EmpDAO;

public class EmpDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		
		EmpDAO eDao = EmpDAO.getInstance();
		eDao.deleteEmployee(id);
		
		//BoardListAction의 execute실행 (데이터 조회 및 list로 이동)
		response.sendRedirect("index.jsp");
	}

}
