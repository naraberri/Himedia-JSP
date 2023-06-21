<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<% 
String unq = request.getParameter("unq");
String pass = request.getParameter("pass");

if( unq == null || pass == null){
%>
	<script>
	alert("잘못된 경로로의 접근");
	location="board1List.jsp"
	</script>
<%
	return;	//jsp 종료
}
pass = pass.trim();		//	앞뒤 공백제거
%>

<%
String sql = " delete from board1 where unq='"+unq+"'and pass='"+pass+"'";
Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql);
if( result == 1 ){
%>
	<script>
	alert("삭제완료");
	location = "board1List.jsp";
	</script>
<%	
}else {
%>
	<script>
	alert("비밀번호를 확인해주세요.");
	history.back();
	</script>
<%
}
%>