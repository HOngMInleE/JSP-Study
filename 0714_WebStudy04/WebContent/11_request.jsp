<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
ContextPath : <%= request.getContextPath() %><br> <%-- ContextPath 정보 확인 --%>
요청한 URL : <%= request.getRequestURL() %><br> <%-- URL 정보 확인 --%>
요청한 URI : <%= request.getRequestURI() %><br> <%-- URI (port 뒤부터) 정보 확인 --%>
</body>
</html>