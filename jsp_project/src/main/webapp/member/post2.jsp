<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>
<%
String dong = request.getParameter("dong");
dong = dong.trim();
if( dong.equals("") ) {
%>
	<script>
	alert("동(면,리)을 입력해주세요.");
	history.back();
	</script>
<%
	return;
}

String sql = " select a1,a2||' '||a3||' '||a4||' '||a5||' '||a6||' '||a7 as addr "
		   + " from post1 "
		   + " where a4 like '%"+dong+"%' "
		   + " 	  or a5 like '%"+dong+"%' ";

Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function fn_action() {
	var address = document.frm.address.value;
	var postnum = address.substring(0,6);
	var addr = address.substring(7);
	
	opener.frm.zipcode.value = postnum;
	opener.frm.addr.value = addr;
	self.close();
}
</script>
<body>
<div>
<form name="frm">
	<select name="address">
		<option value=""></option>
		<%
		while( rs.next() ) {
			String postnum = rs.getString("a1");
			String addr = rs.getString("addr");
		%>
			<option value="<%=postnum %> <%=addr %>"><%=postnum %> <%=addr %></option>
		<%	
		}
		%>
	</select>
	<br>
	<button type="button" onclick="fn_action()">적용</button>
	<button type="button" onclick="history.back()">뒤로가기</button>
</form>
</div>
</body>
</html>