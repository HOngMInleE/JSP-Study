package employees.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employees.dao.EmpDAO;
import employees.dto.EmpVO;

public class EmpRegisterAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 입력된 데이터 VO에 저장 
		EmpVO eVo = new EmpVO();
		
		eVo.setId(request.getParameter("id"));
		eVo.setPass(request.getParameter("pass"));
		eVo.setName(request.getParameter("name"));
		eVo.setLev(request.getParameter("lev"));
		eVo.setGender(request.getParameter("gender"));
		eVo.setPhone(request.getParameter("phone"));
		
		EmpDAO eDao = EmpDAO.getInstance();
		
		eDao.insertEmployee(eVo); // DB에 VO정보 추가하는 메소드 실행
		
		response.sendRedirect("index.jsp"); // 홈페이지로 이동
	}
	
	

}
