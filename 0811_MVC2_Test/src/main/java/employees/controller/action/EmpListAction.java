package employees.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employees.dao.EmpDAO;
import employees.dto.EmpVO;

public class EmpListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/employees/empList.jsp";
		
		EmpDAO eDao = EmpDAO.getInstance();
		List<EmpVO> empList = eDao.selectAllEmployees();
		
		request.setAttribute("empList", empList);
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
