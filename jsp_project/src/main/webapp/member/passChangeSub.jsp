<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>

<%
String userid = (String) session.getAttribute("SessionUserId");
String p1 = request.getParameter("pass1");
String p2 = request.getParameter("pass2");
String p3 = request.getParameter("pass3");

if( p1 == null || p1 == "" ||
	p2 == null || p2 == "" ||
	p3 == null || p3 == "") {
%>
	<script>
		alert("잘못된 경로로의 접근");
		self.close();
	</script>
<%
	return;
}

String sql = " select count(*) cnt from memberinfo "
		   + " where userid='"+userid+"' "
		   + " and userpw='"+p1+"' ";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt");

if( cnt==0 ) {
%>
	<Script>
    alert("기존비밀번호를 확인해주세요.");
    history.back();
 	</Script>
<% 
	return;
}

String sql1 = " update memberinfo set "
			+ " userpw='"+p2+"' "
			+ " where userid='"+userid+"' ";
Statement stmt1 = con.createStatement();
int result =stmt1.executeUpdate(sql1);
if (result == 1) { 
%>
   <script>
      alert("암호수정완료. \n다음 로그인 시 적용됩니다.");
      opener.location="../main/main.jsp";
      self.close();
   </script>
<%
}else{
%>
   <Script>
      alert("암호수정실패. \n다시 로그인 해주세요.");
      opener.location="../member/loginWrite.jsp";
      self.close();
   </Script>
<%
} 
%>