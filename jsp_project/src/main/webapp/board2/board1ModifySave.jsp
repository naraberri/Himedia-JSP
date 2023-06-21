<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메터 값 설정 -->
<!-- null값 체크(제목,암호) -->

<%
String unq = request.getParameter("unq");
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String content = request.getParameter("content");

if( title == null || pass == null){
%>
	<script>
	alert("잘못된 경로로의 접근");
	location="board1List.jsp"
	</script>
<%
	return;	//jsp 종료
}
title = title.trim();	//	앞뒤 공백제거
pass = pass.trim();		//	앞뒤 공백제거

String sql ="select count(*) cnt from board1 "
		   +" where unq='"+unq+"' and pass='"+pass+"'";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt");
if( cnt == 0 ){
%>
	<script>
		alert("암호가 일치하지 않습니다.");
		history.back();
	</script>
<%
	return;
}
%>

<!-- 저장 -->
<!-- 메시지 출력 -->
<%
String sql1 = "update board1 set "
			+ "		 title='"+title+"' "
			+ "		,name='"+name+"' "
			+ "		,content='"+content+"' "
			+ "		,udate=sysdate " 
			+ " where unq='"+unq+"' ";

int result = stmt.executeUpdate(sql1);
if( result == 1 ){
%>
	<script>
	alert("저장완료");
	location = "board1List.jsp";
	</script>
<%	
}else {
%>
	<script>
	alert("수정실패");
	history.back();
	</script>
<%
}
%>