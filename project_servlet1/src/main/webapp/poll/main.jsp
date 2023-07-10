<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Connection con = DbConnect.oracleCon();

String sql = " SELECT code "
		   + " ,title "
		   + " FROM pollmain "
		   + " WHERE to_char(sdate,'yyyy-mm-dd') <= to_char(sysdate,'yyyy-mm-dd') "
		   + " 	 AND to_char(edate,'yyyy-mm-dd') >= to_char(sysdate,'yyyy-mm-dd') "
		   + " 	 AND use = 'Y' "
		   + " ORDER BY code DESC ";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 메인</title>
</head>

<script>
function fn_popup1(code) {
	var url = "pollEnter.jsp?code="+code;
	window.open(url,"응모화면","width=800,height=500");
}
function fn_popup2(code) {
	var url = "pollResult.jsp?code="+code;
	window.open(url,"결과화면","width=800,height=500");
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

<table  class="table1">
	<tr>
		<th colspan="3">설문</th>
	</tr>
	<% 
	int cnt = 0;
	while( rs.next() ) {
		String code  = rs.getString("code");
		String title = rs.getString("title");
		cnt++;
	%>
	<tr align="center">
		<td width="10%"><%=cnt %></td> 
		<td align="left"><%=title %></td>
		<td width="27%">
			<button type="button" onclick="fn_popup1('<%=code %>')">응모</button>
			<button type="button" onclick="fn_popup2('<%=code %>')">결과</button>
		</td>
	</tr>
	<%
	}
	%>

</table>

</body>
</html>