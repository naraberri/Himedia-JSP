<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서등록</title>
</head>
<body>
<form name="frm" method="post" action="deptWriteSave.jsp">
<table border="1" width="400">
	<tr>
		<th>부서번호</th>
		<td><input type="text" name="deptno"></td>
	</tr>
	<tr>
		<th>부서이름</th>
		<td><input type="text" name="dname"></td>
	</tr>
	<tr>
		<th>부서위치</th>
		<td><input type="text" name="loc"></td>
	</tr>
	<tr>
		<th colspan = "2">
			<button type="submit">저장</button>
			<button type="reset">취소</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>