<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String code = request.getParameter("code");
Connection con = DbConnect.oracleCon();

String sql = " SELECT title FROM pollmain "
		   + " WHERE code = '"+code+"'";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql); 
rs.next();
String title = rs.getString("title");

String sql2 = " SELECT code,item FROM pollsub "
			+ "  WHERE code like '"+code+"%' " ;
Statement stmt2 = con.createStatement();
ResultSet rs2   = stmt2.executeQuery(sql2);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 메인</title>
</head>

<script>
function fn_submit() {
	
	if(document.frm.item.value == "") {
		alert("항목을 선택해주세요.");
		return false;
	}
	document.frm.submit();
}
</script>

<style>
body {
	font-size:12px;
	font-family:맑은고딕;
	line-height:2.0;
}
.table1 {
	width:400px;
	border:1px solid #ccc;
	border-collapse:collapse;  /*cell간격제거*/
}
.table1 th,td {
	padding:5px;
	border:1px solid #ccc;	
} 
</style>

<body>
<form name="frm" method="post" action="/project_servlet1/voteSave">
<table  class="table1">
	<tr>
		<th colspan="3">
		<%=title %>
		</th>
	</tr>
	<% 
	int cnt = 0;
	while( rs2.next() ) {
		
		String subCode = rs2.getString("code");
		String item = rs2.getString("item");
	%>
	<tr>
		<td <%if(cnt%2==0) {%> bgcolor="#e8f4fb" <%} %>>
			<input type="radio" name="subCode" value="<%=subCode %>">
			<%=item %>
		</td>
	</tr>
	<%
	}
	%>

</table>
<div>
	<button type="submit" onclick="fn_submit();return false;">투표하기</button>
</div>
</form>
</body>
</html>