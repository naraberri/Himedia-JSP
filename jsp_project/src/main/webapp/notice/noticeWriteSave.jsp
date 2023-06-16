<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>
<%
Statement stmt = con.createStatement();
%>

<% 
String title = request.getParameter("title");
String content = request.getParameter("content");
String registration = request.getParameter("registration");

if( title == null || title.equals("") ||
	content == null || content.equals("") ){
%>
	<script>
	alert("제목 , 내용은 필수 사항입니다.");
	history.back();
	</script>
<%
	return;	//jsp 종료
}
%>

<%

String sql = " insert into notice(unq,title,content)"
		   + " values(notice_unq_seq.nextval,'"+title+"','"+content+"')";
int result = stmt.executeUpdate(sql);
if( result == 1 ){
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