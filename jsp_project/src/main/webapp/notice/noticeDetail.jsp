<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/oracleCon.jsp" %>    
<%	
    String unq = request.getParameter("unq");

	Statement stmt1 = con.createStatement();
    String sql1 = "update notice set views=views+1 where unq='"+unq+"'";
    ResultSet rs1 = stmt1.executeQuery(sql1);
    
    Statement stmt2 = con.createStatement();
    String sql2="select unq,title,content,views,registration from notice where unq='"+unq+"'";    
    ResultSet rs2 = stmt2.executeQuery(sql2);   	
   	
   	rs2.next();
   	String title =rs2.getString("title");
   	String content =rs2.getString("content");
   	String views =rs2.getString("views");
   	String registration =rs2.getString("registration");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body{
   font-size:12px;
   color:#111111;
   font-family:맑은고딕;
}
table{
   width:600px;
   border:1px solid #ccc;
   border-collapse:collapse;
}
th, td{
   border:1px solid #ccc;
   padding: 5;
   text-align:center;
}
</style>
<body>

<table>
	<colgroup>
		<col width="10%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<td>제목</td>
		<td><%=title %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea cols="70" rows="10" style="resize: none;"><%=content %></textarea></td>
	</tr>
	<tr>
		<td>조회수</td>
		<td><%=views %></td>
	</tr>
	<tr>
		<td>등록일</td>
		<td><%=registration %></td>
	</tr>
</table>
<button type="button" onclick="location='noticeModify.jsp?unq=<%=unq%>'">수정하기</button>
<button type="button" onclick="location='noticeList.jsp'">목록으로</button>

</body>
</html>