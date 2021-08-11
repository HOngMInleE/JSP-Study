package employees.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employees.dao.EmpDAO;
import employees.dto.EmpVO;

public class EmpUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 입력된 값들 VO객체에 저장 
		EmpVO eVo = new EmpVO();
		
		eVo.setId(request.getParameter("id"));
		eVo.setPass(request.getParameter("pass"));
		eVo.setName(request.getParameter("name"));
		eVo.setLev(request.getParameter("lev"));
		eVo.setGender(request.getParameter("gender"));
		eVo.setPhone(request.getParameter("phone"));
		
		// VO객체 정보 DB에 저장하는 메소드
		EmpDAO eDao = EmpDAO.getInstance();
		eDao.updateEmployee(eVo);
		
		response.sendRedirect("index.jsp"); // 완료후 list화면으로.
		
	
		
	}
	

}
