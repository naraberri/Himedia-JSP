<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>

<%
String userid = (String) session.getAttribute("SessionUserId");

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

if( userid == null || name == null){
%>
	<script>
	alert("잘못된 경로로의 접근");[]
	location="loginWrite.jsp"
	</script>
<%
	return;	//jsp 종료
}
userid = userid.trim();	//	앞뒤 공백제거
name = name.trim();
%>

<%
String sql = " update memberinfo set "
		   + "  name='"+name+"' "
		   + " ,gender='"+gender+"' "
		   + " ,birth='"+birth+"' "
		   + " ,phone='"+phone+"' "
		   + " ,zipcode='"+zipcode+"' "
		   + " ,addr='"+addr+"' "
		   + " ,hobby='"+hobby1+"' "
		   + " ,email='"+email+"' "
		   + " ,homepage='"+homepage+"' "
		   + " where userid='"+userid+"' ";
            
Statement stmt = con.createStatement();
int result =stmt.executeUpdate(sql);
if (result == 1) { 
%>
   <script>
      alert("정보수정완료");
      location = "../main/main.jsp";
   </script>
<%
}else{
%>
   <Script>
      alert("수정실패");
      history.go(-1);
   </Script>
<%
} 
%>