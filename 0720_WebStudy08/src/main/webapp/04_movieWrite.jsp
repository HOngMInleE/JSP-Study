<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 영화 정보를 입력 받는 JSP페이지 </title>
</head>
<body>
	<h2> 정보 등록 </h2>
	<table>
		<tr>
			<td> 제목 </td>
			<td> <input type="text" name="title"> </td>
		</tr>
		<tr>
			<td> 가격 </td>
			<td> <input type="number" name="price">원 </td>
		</tr>
		<tr>
			<td> 감독 </td>
			<td> <input type="text" name="director"> </td>
		</tr>
		<tr>
			<td> 출연배우 </td>
			<td> <input type="text" name="actor"> </td>
		</tr>
		<tr>
			<td> 시놉시스 </td>
			<td> <input type="text" name="synopsis"> </td>
		</tr>
		<tr>
			<td> 장르 </td>
			<td> 
				<select size="1">
					<option>로맨스</option>
					<option>스릴러</option>
					<option>미스터리</option>
					<option>액션</option>
					<option>코미디</option>
					<option>애니메이션</option>
				</select>
			</td>
		</tr>
	</table>
	<input type="submit" value="확인">
	<input type="reset" value="취소">
</body>
</html>