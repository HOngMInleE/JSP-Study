package employees.controller;

import employees.controller.action.Action;
import employees.controller.action.EmpDeleteAction;
import employees.controller.action.EmpListAction;
import employees.controller.action.EmpRegisterAction;
import employees.controller.action.EmpRegisterFormAction;
import employees.controller.action.EmpUpdateAction;
import employees.controller.action.EmpUpdateFormAction;
import employees.controller.action.EmpViewFormAction;

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
		if (command.equals("emp_list")) { //list
			//객체 생성
			action = new EmpListAction();
		} else if (command.equals("emp_register_form")) { // registerForm
			action = new EmpRegisterFormAction();
		} else if (command.equals("emp_register")) { // register
			action = new EmpRegisterAction();
		} else if (command.equals("emp_view_form")) { // view
			action = new EmpViewFormAction();
		} else if (command.equals("emp_update_form")) {
			action = new EmpUpdateFormAction();
		} else if (command.equals("emp_update")) {
			action = new EmpUpdateAction();
		} else if (command.equals("emp_delete")) {
			action = new EmpDeleteAction();
		}
		
		return action;
	}// getAction()
	
	
}//ActionFactory
