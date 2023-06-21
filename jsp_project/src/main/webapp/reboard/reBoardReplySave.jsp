<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp"%>
<!-- 파라메터 값 설정 -->
<%
String unq = request.getParameter("unq");
String title = request.getParameter("title");
String pass  = request.getParameter("pass");
String name  = request.getParameter("name");
String content = request.getParameter("content");
%>
<!-- 널값 체크(제목,암호) -->
<%
   if (title == null || pass  == null){
%>
      <script>
         alert("잘못된 경로로 접근");
         location="reBoardList.jsp"
      </script>
<%
return;
}

String sql1 = " select gid,thread from reboard "
		+ " where unq='"+unq+"' ";
Statement stmt1 = con.createStatement();
ResultSet rs1 = stmt1.executeQuery(sql1);
rs1.next();

String dbGid = rs1.getString("gid");
String dbThread = rs1.getString("thread");

String sql2 = " select nvl(max(thread),'1') as maxThread from reboard "
			+ " where gid='"+dbGid+"' "
			+ "   and thread like '"+dbThread+"_'";
Statement stmt2 = con.createStatement();
ResultSet rs2 = stmt1.executeQuery(sql2);
rs2.next();

String maxThread = rs2.getString("maxThread");
String myThread = "";
if( maxThread.equals("1") ){
	myThread = dbThread+"a";
} else {
	char lastWord = maxThread.charAt( maxThread.length()-1 );
	lastWord++;
	myThread = dbThread+lastWord;
}

String sql3 = " insert into reboard(unq,title,pass,name,content,rdate,gid,thread) " 
        +" values (reboard_seq.nextval,'"+title+"','"+pass+"','"+name+"','"+content+"',sysdate,'"+dbGid+"','"+myThread+"') ";

int result =stmt2.executeUpdate(sql3);
%>
<%if (result == 1) {
%>
   <script>
      alert("작성완료");
      location = "reBoardList.jsp";
   </script>
<%
}else{
%>
   <Script>
      alert("작성실패");
      history.back();
   </Script>
<%
return;
} 
%>