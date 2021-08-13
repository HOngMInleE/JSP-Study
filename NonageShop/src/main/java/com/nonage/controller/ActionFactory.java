package com.nonage.controller;

import com.nonage.controller.action.Action;
import com.nonage.controller.action.IndexAction;

public class ActionFactory {

//singleTone Pattern
	private static ActionFactory instance = new ActionFactory();
	private ActionFactory() {
		
	}
	public static ActionFactory getInstance() {
		return instance;
	} 
	
// command 를 매개값으로 Action을 생성하는 메소드
	public Action getAction(String command) {
		Action action = null;
		System.out.println("ActionFactory에서 요청 받음을 확인 : " + command);
		
		if (command.equals("index")) {
			action = new IndexAction();
		}
		
		
		return action;
	}
	
	
	
	
	
	
	
	
	
	
}//ActionFactory end
