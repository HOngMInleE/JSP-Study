<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		label {
			width:160px;
			display:inline-block;
			float:left
		}
		
		#button{
			text-align : center;
		}
	</style>
	
	<script type="text/javascript" src="joinChk.js"></script>
</head>
<body>
	<form name="frm" id="reg_frm" action="JoinServlet">
		<label for="name">이름</label><span style="color:red;">*</span>
		<input type="text" id="name" name="name" value="성윤정"><br>
		
		<label>주민번호</label><span style="color:red;">*</span>
		<input type="text" name="jumin_1" value="890719"> -
		<input type="text" name="jumin_2" value="2012123"><br>
		
		<label for="id">아이디</label><span style="color:red;">*</span>
		<input type="text" id="id" name="id" value="pinksung"><br>
		
		<label for="pwd">비밀번호</label><span style="color:red;">*</span>
		<input type="password" id="pwd" name="pwd" value="1234"><br>
		
		<label for="pwd_re">비밀번호확인</label><span style="color:red;">*</span>
		<input type="password" id="pwd_re" name="pwd_re" value="1234"><br>
		
		<label for="email">이메일</label>&nbsp;
		<input type="text" name="email" value="pinksung"> @
		<input type="text" name="email_dns" value="">
		<select name="emailaddr">
			<option value="">직접입력</option>
			<option value="daum.net">daum.net</option>
			<option value="gmail.com">gmail.com</option>
			<option value="naver.com" selected>naver.com</option>		
		</select><br>
		
		<label for="zip">우편번호</label>&nbsp;
		<input type="text" id="zip" name="zip" value="321-231"><br>
		
		<label for="addr1">주소</label>&nbsp;
		<input type="text" id="addr1" name="addr1" value="서울시 영등포구 여의도동">
		<input type="text" id="addr2" name="addr2" value="자이아파트 101동101호"><br>
		
		<label for="phone">핸드폰번호</label>&nbsp;
		<input type="tel" id="phone" name="phone" value="010-123-1234"><br>
		
		<label for="job">직업</label>&nbsp;
		<select id="job" name="job" size="3" multiple>
			<option value="학생">학생</option>
			<option value="언론">언론</option>
			<option value="공무원" selected>공무원</option>
			<option value="서비스업">서비스업</option>
		</select><br>
		
		<label for="chk_mail">메일/SMS 정보수신</label>&nbsp;
		<input type="radio" id="chk_mail" name="chk_mail" value="yes" checked>수신
		<input type="radio" id="chk_mail" name="chk_mail" value="no">수신거부<br>
		
		
		<label for="interest">관심분야</label>&nbsp;
		<input type="checkbox" id="interest" name="interest" value="생두">생두
		<input type="checkbox" id="interest" name="interest" value="원두" checked>원두
		<input type="checkbox" id="interest" name="interest" value="로스팅">로스팅
		<input type="checkbox" id="interest" name="interest" value="핸드드립" checked>핸드드립
		<input type="checkbox" id="interest" name="interest" value="에스프레스" checked>에스프레스
		<input type="checkbox" id="interest" name="interest" value="창업">창업
		
		<br><br>
		
		<div id="button">
			<input type="submit" value="회원가입" onclick="return check()">
			<input type="reset" value="취소">
		</div>
		
		
	</form>
</body>
</html>