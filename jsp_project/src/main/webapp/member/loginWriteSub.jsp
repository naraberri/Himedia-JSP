<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>

<%
String userid = request.getParameter("userid");
String userpw = request.getParameter("userpw");

String sql = " select count(*) cnt from memberinfo "
		   + " where userid='"+userid+"' and userpw='"+userpw+"' ";

Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt");
if( cnt == 0 ){
%>
	<script>
	alert("인증에 실패했습니다. \n아이디와 암호를 다시 확인해주세요.");
	history.back();
	</script>
<%
	return;
}
session.setAttribute("SessionUserId", userid);	//	세션변수 생성
session.setMaxInactiveInterval(60*60);
%>
	<script>
	alert("<%=userid%>님 환영합니다.");
	location="../main/main.jsp";
	</script>