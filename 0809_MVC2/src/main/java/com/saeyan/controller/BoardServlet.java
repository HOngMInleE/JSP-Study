package com.saeyan.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.controller.action.Action;

@WebServlet("/BoardServlet")
public class BoardServlet extends HttpServlet {
// 요청받은 Command 값을 이용해서 Factory사용, 
		// Factory는 요청에 맞게 ActionController를 판단, 불러와서 사용
	private static final long serialVersionUID = 1L;
       
    public BoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	String command = request.getParameter("command");
    	System.out.println("BoardServlet에서 요청을 받음을 확인 : " + command);
    	
    	ActionFactory af = ActionFactory.getInstance(); 
    	// Factory 생성
    	Action action = af.getAction(command); 
    	// Action 생성 후 Factory의 getAction에 요청 된 command 값 넘겨줌
    		// 생성된 객체 받아와서 사용
    	
    	if (action != null) {
    		action.execute(request, response);
    		// 각각 오버라이딩된 execute실행(해당 Action파일을 실행)
    	}
    	
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
