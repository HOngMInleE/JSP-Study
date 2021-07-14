<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 
	1.int형 변수 하나를 정의하고 12345로 초기화한다.
	2. reverse()메소드를 정의한다.
	3. 반환 타입은 int형으로 한다.
	4. 54321로 바꾸어서 리턴한다.
	5. <body>영역에서 출력한다.
--%>    
<%! 
	int x = 12345;
	
	public int reverse() {
		int result = 0;
		
		while (x != 0) {
			result = result * 10 + x % 10;
			x /= 10;
		}
		
		return result;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= x %> 의 reverse 결과는 <%= reverse() %> 
<%-- x값, reverse()값 잘나옴.
	스크립트릿태그와 위치 바꾸면 0이 나옴. --%> 
<%
out.print(x); // 현위치 : 0	// 표현식이랑 순서 바꾸면 x값이 나옴.  
out.print(reverse()); // "" 위와 동일.
%>
</body>
</html>