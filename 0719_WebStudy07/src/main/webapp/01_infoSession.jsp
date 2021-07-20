<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>infoSession</title>
</head>
<body>
	<h3> 세션 정보를 얻어오는 메소드를 사용하기</h3>
	<%
	String id_str = session.getId();
	long lastTime = session.getLastAccessedTime(); // 세션에 마지막으로 액세스한 시간을 되돌려줌.
	long createdTime = session.getCreationTime(); // 세션이 생성된 시간을 되돌려줌.
	long time_used = (lastTime - createdTime) / 60000 ;
	int inactive = session.getMaxInactiveInterval() / 60 ;
	boolean b_new = session.isNew();
	%>
	[1] 세션 ID는 [ <%= session.getId() %>] 입니다. <br><br>
	[2] 당신이 웹 사이트에 머문 시간은 <%= time_used %> 분입니다. <br><br>
	[3] 세션의 유효 기간은 <%= inactive %> 분입니다. <br><hr>
	[4] 세션이 새로 만들어졌나요? <br>
	<%
	if (b_new ) {
		out.print(" 예! 새로운 세션을 만들었습니다.");
	} else {
		out.print(" 아니오! 새로운 세션을 만들지 않았습니다.");
	}
	%>
</body>
</html>