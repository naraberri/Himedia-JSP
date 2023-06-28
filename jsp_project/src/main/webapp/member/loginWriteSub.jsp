<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="conn.Cookies"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/oracleCon.jsp" %>

<%
String userid = request.getParameter("userid");
String userpw = request.getParameter("userpw");
String chk = request.getParameter("chk"); //체크여부

if(chk == null) {
   out.print("null");
} else {
   out.print("ok");
}

String sql = "select count(*) cnt from memberInfo "
         + "where userid = '"+userid+"' and userpw = '"+userpw+"' ";

Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

rs.next();

int cnt = rs.getInt("cnt");

if(cnt == 0) {
%>
   <script>
   alert("아이디 또는 비밀번호를 잘못 입력했습니다.\n입력하신 내용을 다시 확인해주세요.");
   history.back();
   </script>
<%
   return;
}
//세션변수 생성
//ex)String SessionUserid = "userid";
session.setAttribute("SessionUserId", userid);
session.setMaxInactiveInterval(60*60*24); //세션 변수 유지시간

//쿠키설정(아이디 기억하기)    createCookie(변수명,변수값,적용범위,적용시간)
if(chk == null){ //체크해제의 경우
   response.addCookie(Cookies.createCookie("CookieUserId","","/",-1) );
} else {//체크상태일경우
   response.addCookie(Cookies.createCookie("CookieUserId",userid,"/",-1) );
}
//모든범위 모든시간
%>                                           
   <script>
   alert("<%=userid %> 환영합니다.");
   location = "../main/main.jsp";
   </script>
