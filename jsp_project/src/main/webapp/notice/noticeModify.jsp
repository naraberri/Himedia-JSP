<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>

<%
String n_unq = request.getParameter("unq");

Statement stmt1 = con.createStatement();
String sql1="update notice set views=views+1 where unq='"+n_unq+"'";
int result = stmt1.executeUpdate(sql1);

String sql2 = " select unq,title,content from notice "
			+ " where unq='"+n_unq+"'";
Statement stmt2 = con.createStatement();
ResultSet rs2 = stmt2.executeQuery(sql2);
rs2.next();

String unq = rs2.getString("unq");
String title = rs2.getString("title");
String content = rs2.getString("content");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice Modify</title>
</head>
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

<body>
<form name="frm" method="post" action="noticeModifySave.jsp">
<table>
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th>글번호</th>
		<td><input type="hidden" name="unq" value="<%=unq%>" readonly></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" value="<%=title%>"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><input type="text" name="content" value="<%=content%>" ></td>
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