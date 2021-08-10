package com.saeyan.controller;

import com.saeyan.controller.action.Action;
import com.saeyan.controller.action.BoardListAction;
import com.saeyan.controller.action.BoardWriteFormAction;

public class ActionFactory {
// 생성을 역할로 하는 클래스 (ActionController)
	private static ActionFactory instance = new ActionFactory();
	
	private ActionFactory() {
		
	}
	
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		
		Action action = null;
		System.out.println("ActionFactory요청받은 명령어는 : " + command);
		
		// 요청 값 확인 후 조건에 맞게 판단
		if (command.equals("board_list")) { 
			//객체 생성
			action = new BoardListAction();
		}else if (command.equals("board_write_form")) {
			action = new BoardWriteFormAction();
		}else if (command.equals("board_write")) {
			
		}
		
		return action;
	}// getAction()
	
	
}
