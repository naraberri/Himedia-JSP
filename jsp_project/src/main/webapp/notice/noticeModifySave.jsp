<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/oracleCon.jsp" %>
<%
Statement stmt = con.createStatement();
%>
<% 
String unq = request.getParameter("unq");
String title = request.getParameter("title");
String content = request.getParameter("content");

if( unq == null || unq.equals("")){
%>
	<script>
	alert("잘못된 경로로의 접근입니다.");
	history.back();
	</script>
<%
	return;	//jsp 종료
}

String sql = "update notice set title='"+title+"',content='"+content+"' where unq='"+unq+"'";
int result = stmt.executeUpdate(sql);
if( result ==1 ){
%>
	<script>
	alert("저장완료");
	location = "noticeList.jsp";
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