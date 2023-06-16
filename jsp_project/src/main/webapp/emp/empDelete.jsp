<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/oracleCon.jsp" %>

<% 
String empno = request.getParameter("empno");
/* empno.equals("")를 먼저쓰면 이프문을 만나자마자 
오류(equals는 null에는 쓸수 없음.null.equals("")) */
if( empno == null || empno.equals("")){
%>
	<script>
	alert("잘못된 경로로의 접근입니다.");
	history.back();
	</script>
<%
	return;	//jsp 종료
}
%>
	
<%
String sql = " delete from emp where empno='"+empno+"'";
Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql);
if( result == 1 ){
%>
	<script>
	alert("삭제완료");
	location = "empList.jsp";
	</script>
<%	
}else {
%>
	<script>
	alert("삭제실패");
	history.back();
	</script>
<%
}
%>