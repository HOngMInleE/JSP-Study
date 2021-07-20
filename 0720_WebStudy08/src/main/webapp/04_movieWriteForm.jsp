<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 영화 정보를 처리하는 JSP페이지 </title>
</head>
<body>
	<h2> 입력 완료된 정보 </h2>
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
</body>
</html>