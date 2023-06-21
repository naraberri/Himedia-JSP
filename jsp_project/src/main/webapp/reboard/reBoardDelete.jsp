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
	location="reBoardList.jsp"
	</script>
<%
	return;	//jsp 종료
}
pass = pass.trim();		//	앞뒤 공백제거
%>

<%
String sql1 = " select gid,thread from reboard "
			+ " where unq='"+unq+"' and pass='"+pass+"' ";
Statement stmt1 = con.createStatement();
ResultSet rs1 = stmt1.executeQuery(sql1);

if( !rs1.next() ){
%>
	<script>
		alert("암호를 잘못 입력했습니다");
		history.back();
	</script>
<%
	return;
}

String dbGid = rs1.getString("gid");
String dbThread = rs1.getString("thread");

String sql2 = " select count(*) cnt from reboard "
			+ " where gid='"+dbGid+"' and thread like '"+dbThread+"_' ";
Statement stmt2 = con.createStatement();
ResultSet rs2 = stmt2.executeQuery(sql2);
rs2.next();

int cnt = rs2.getInt("cnt");

String sql3 = "";
if( cnt > 0 ){
	sql3 = " update reboard "
			   + " set title='작성자가 삭제한 글입니다.' "
			   + " ,content=' ' "
			   + " where unq='"+unq+"' ";	
}else{
	sql3 = " delete from reboard where unq='"+unq+"'";
}
int result = stmt2.executeUpdate(sql3);
if( result == 1 ){
%>
	<script>
	alert("삭제완료");
	location = "reBoardList.jsp";
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