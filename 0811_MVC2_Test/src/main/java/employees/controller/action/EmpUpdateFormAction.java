package employees.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employees.dao.EmpDAO;
import employees.dto.EmpVO;

public class EmpUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/employees/empUpdateForm.jsp";
		
		String id = request.getParameter("id");
		// id값 받아오기
		
		EmpDAO eDao = EmpDAO.getInstance();
		
		EmpVO eVo = eDao.selectOneEmpById(id);
		// id값을 매개로 해당 컬럼 조회
		
		request.setAttribute("empEach", eVo);
		// request영역에 'empEach'라는 이름으로 불러온 컬럼저장
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		// 데이터 가진채로 페이지 이동
	}

}
