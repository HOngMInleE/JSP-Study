package net.board.action;

public class ActionForward {
	private boolean isRedirect=false; // true: redirect 아니면 false: forward방식
	private String path=null; //이동할 페이지(url) set을 통해 저장
	
	public boolean isRedirect(){
		return isRedirect;
	}
	
	public String getPath(){
		return path;
	}
	
	public void setRedirect(boolean b){
		isRedirect=b;
	}
	
	public void setPath(String string){
		path=string;
	}
}