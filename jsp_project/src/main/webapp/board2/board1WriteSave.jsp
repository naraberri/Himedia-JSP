<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메터 값 설정 -->
<!-- null값 체크(제목,암호) -->

<% 
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
%>

<!-- 저장 -->
<!-- 메시지 출력 -->
<%
Statement stmt = con.createStatement();

String sql = " insert into board1(unq,title,pass,name,content,rdate,udate)"
		   + " values(board1_seq.nextval,'"+title+"','"+pass+"'"
		   +	   	  ",'"+name+"','"+content+"',sysdate,sysdate)";
int result = stmt.executeUpdate(sql);
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
	alert("저장실패");
	history.back();
	</script>
<%
}
%>