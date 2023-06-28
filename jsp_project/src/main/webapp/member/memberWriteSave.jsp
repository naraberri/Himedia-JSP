<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>

<%
String userid = request.getParameter("userid");
String userpw = request.getParameter("userpw");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String p1 = request.getParameter("p1");
String p2 = request.getParameter("p2");
String p3 = request.getParameter("p3");
String zipcode = request.getParameter("zipcode");
String addr = request.getParameter("addr");
String [] hobby = request.getParameterValues("hobby");
String email = request.getParameter("email");
String homepage = request.getParameter("homepage");

String birth = year+"/"+month+"/"+day;
String phone = p1+"-"+p2+"-"+p3;
String hobby1 = "";

for( int i=0;i<hobby.length;i++){
	if( i==0){
		hobby1 += hobby[i];
	}else if ( i > 0 && hobby[i] != null ){
		hobby1 += ","+hobby[i];
	}
}

/* String hobbyStr = String.join(",", hobby); */

if( userid == null || userpw == null || name == null){
%>
	<script>
	alert("잘못된 경로로의 접근");[]
	location="loginWrite.jsp"
	</script>
<%
	return;	//jsp 종료
}
userid = userid.trim();	//	앞뒤 공백제거
userpw = userpw.trim();
name = name.trim();

if(userid.equals("")|| userpw.equals("")){
%>
      <script>
      alert("아이디 또는 암호를 입력해주세요");
      history.back();
      </script>
<%
   return;
}
%>

<%
String ptn1 = "^[0-9a-zA-Z]{1}[0-9a-zA-Z_-]{5,11}";
boolean chk1 = userid.matches(ptn1);
if( chk1 == false){
%>
	<script>
	alert("영문 또는 숫자로 이루어진 6자~12자 아이디");
	history.go(-1);
	</script>
<%
	return;
}
String sql1 = "select count(*) cnt from memberinfo "
			+ " where userid='"+userid+"'";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql1);
rs.next();
int cnt = rs.getInt("cnt");
if( cnt > 1 ){
%>
	<script>
	alert("이미 사용중인 아이디 입니다.");
	history.go(-1);
	</script>
<%
	return;
}
%>
<%
String sql2 = " insert into memberinfo " 
            +" values (memberinfo_seq.nextval,'"+userid+"','"+userpw+"'"
            +" ,'"+name+"','"+gender+"'"
            +" ,'"+birth+"','"+phone+"'"
            +" ,'"+zipcode+"','"+addr+"','"+hobby1+"','"+email+"','"+homepage+"',sysdate ) ";
Statement stmt2 = con.createStatement();
int result =stmt2.executeUpdate(sql2);
if (result == 1) { 
%>
   <script>
      alert("회원가입완료");
      location = "../main/main.jsp";
   </script>
<%
}else{
%>
   <Script>
      alert("작성실패");
      history.go(-1);
   </Script>
<%
} 
%>