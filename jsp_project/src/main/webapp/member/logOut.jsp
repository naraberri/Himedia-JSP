<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
session.removeAttribute("SessionUserId");
session.invalidate();
%>
	<script>
	alert("로그아웃되었습니다.");
	location="../main/main.jsp";
	</script>