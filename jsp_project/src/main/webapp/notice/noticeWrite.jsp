<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice Write</title>
</head>

<style>
<style>
body{
   font-size:12px;
   color:#111111;
   font-family:맑은고딕;
}
table{
   width:600px;
   border:1px solid #ccc;
   border-collapse:collapse;
}
th, td{
   border:1px solid #ccc;
   padding: 5;
   text-align:center;
}
</style>
</style>

<body>
<form name="frm" method="post" action="noticeWriteSave.jsp">
<table>
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th>글번호</th>
		<td><input type="text" name="unq" readonly></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><input type="text" name="content"></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><input type="number" name="views" readonly></td>
	</tr>	
	<tr>
		<th>등록일</th>
		<td><input type="date" name="registration"></td>
	</tr>	
	<tr>
		<th colspan = "2">
			<button type="submit">저장</button>
			<button type="reset">취소</button>
			<button type="button" onclick="location='noticeList.jsp'">목록</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>