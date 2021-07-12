<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mission</title>
</head>
<body>
	<form method="get" action="MissionServlet">
		이름 : <input type="text" name="name" >
		<br>
		주민등록번호 : <input type="text" name="socialNum"> - <input type="text" name="socialNum">
		<br>
		아이디 : <input type="text" name="id"> 
		<br>
		비밀번호 : <input type="password" name="password">
		<br>
		비밀번호 확인 : <input type="password" name="passwordCheck">
		<br>
		이메일 : <input type="text" name="email"> @ <input type="text" name="email2"> 
		<select id="email" name="email2">
			<option value="nate.com">nate.com</option>
			<option value="naver.com">naver.com</option>
			<option value="gmail.com">gamil.com</option>
		</select>
		<br>
		우편번호 : <input type="text" name="zipCode"> 
		<br>
		주소 : <input type="text" name="address"> <input type="text" name="address"> 
		<br>
		핸드폰번호 : <input type="text" name="phoneNum"> 
		<br>
		<label for="job">직업 : </label>
			<select id="job" name="job" size="3">
				<option value="컴퓨터/인터넷">컴퓨터/인터넷</option>
				<option value="언론">언론</option>
				<option value="공무원">공무원</option>
			</select>
		<br>
		<label for="receiveMail">메일/SMS 정보 수신 : </label>
			<input type="radio" id="receiveMail" name="receiveMail" value="yes" checked>수신
		    <input type="radio" id="receiveMail" name="receiveMail" value="no" >거부
		<br>
		<label for="interest">관심 분야 : </label> 
			<input type="checkbox" id="interest" name="interest" value="생두">생두 
			<input type="checkbox" id="interest" name="interest" value="원두">원두
			<input type="checkbox" id="interest" name="interest" value="로스팅">로스팅
			<input type="checkbox" id="interest" name="interest" value="핸드드립">핸드드립
			<input type="checkbox" id="interest" name="interest" value="에스프레소">에스프레소
			<input type="checkbox" id="interest" name="interest" value="창업">창업
		<br>
		<input type="submit" name="agree" value="회원가입">
		<input type="submit" name="cancel" value="취소">  
	
	
	</form>
</body>
</html>