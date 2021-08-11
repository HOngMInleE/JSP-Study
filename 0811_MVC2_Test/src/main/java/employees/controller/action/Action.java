package employees.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {

//추상 메소드 request,response 정보를 받아올 수 있게 매개변수 값으로 설정
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
}
