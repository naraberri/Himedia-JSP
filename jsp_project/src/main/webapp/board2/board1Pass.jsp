<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String unq = request.getParameter("unq");
%>

<%
if( unq == null || unq.equals("") ) {
%>
	<script>
	alert("잘못된 경로로의 접근!!");
	location="board1List.jsp";
	</script>
<%
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록 화면</title>
</head>
<style>
body{
	font-size:12x;
	font-family:맑은 고딕;
}
table{
	width:600px;
	border:1px solid #555555;
	border-collapse:collapse;
}
th,td{
	border:1px solid #555555;
}
</style>
<script>
function fn_submit() {
	if( f.pass.value == "") {
		alert("암호를 입력해주세요.");
		f.pass.focus();
		return false;
	}
	f.submit();
}

</script>

<body>
<form name="frm" method="post" action="board1Delete.jsp">
<input type="hidden" name="unq" value="<%=unq %>">
<table>
	<caption style="font-size:20px;
					font-weight:bold;">암호화면</caption>
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th>암호</th>
		<td><input type="password" name="pass" style="width:98%;"></td>
	</tr>
</table>
<div style="width:600px;
			margin-top:10px;
			text-align:center;">
	<button type="submit" onclick="fn_submit();return false;" >삭제</button>
	<button type="reset">취소</button>
</div>
</form>
</body>
</html>