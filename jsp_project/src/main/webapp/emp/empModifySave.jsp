<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>
<%
Statement stmt = con.createStatement();
%>
<!-- 파라메터 값 받기 설정 -->
<% 
String empno = request.getParameter("empno");
String ename = request.getParameter("ename");
String sal = request.getParameter("sal");
String hiredate = request.getParameter("hiredate");
String job = request.getParameter("job");
String mgr = request.getParameter("mgr");
String comm = request.getParameter("comm");
String deptno = request.getParameter("deptno");

if( empno == null || empno.equals("")){
	%>
	<script>
	alert("잘못된 경로로의 접근입니다.");
	history.back();
	</script>
<%
	return;	//jsp 종료
}
if(mgr==null){
	mgr="";
}

String sql = "update emp set ename='"+ename+"', sal='"+sal+"',hiredate='"+hiredate+"'"
		   + ",job='"+job+"',mgr='"+mgr+"',comm='"+comm+"',deptno='"+deptno+"'"
		   + " where empno='"+empno+"'";
int result = stmt.executeUpdate(sql);
if( result ==1 ){
%>
	<script>
	alert("저장완료");
	location = "empList.jsp";
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