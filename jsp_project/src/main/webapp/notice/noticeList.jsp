<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/oracleCon.jsp" %>

<%
Statement stmt = con.createStatement();

String colname = request.getParameter("colname");
String searchtxt = request.getParameter("searchtxt");

String str="";
if ( colname != null    && 
    !colname.equals("")&& 
    searchtxt !=null   &&
    !searchtxt.equals("") )
{   
   //str = "AND ename ='홍길동'";
   if(colname.equals("unq")){
   str=" where "+colname+"='"+searchtxt+"'";
   }else {
	   str=" where "+colname+" like '%"+searchtxt+"%'"; 
   }
}
%>

<%
String sql = " select unq,title,content,views,registration from notice "
		   + str
		   + " order by unq ";
ResultSet rs =stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice List</title>
</head>

<script>

function fn_delete(unq) {
	if( confirm("정말 삭제하시겠습니까?") ){
		location="noticeDelete.jsp?unq="+unq;
	}
}function fn_modify(unq) {
	
	if( confirm("수정하시겠습니까?") ){
		location="noticeModify.jsp?unq="+unq;
	}
}
</script>

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

<div style="margin-bottom:5px;">

<form name="frm" method="post" action="noticeList.jsp">
<select name = "colname">
   <option value="">-검색-</option>
   <option value="unq">글번호</option>
   <option value="title">제목검색</option>
   <option value="content">내용검색</option>
</select>
<input type="text" name="searchtxt">
<button type="submit">검색</button>
<button type="button" onclick = "location='noticeWrite.jsp'">새글등록</button>
<button type="button" onclick = "location='noticeList.jsp'">목록</button>
</form>

</div>

<table>
   <colgroup>
      <col width="10%"/>
      <col width="20%"/>
      <col width="20%"/>
      <col width="10%"/>
      <col width="20%"/>
      <col width="10%"/>
      <col width="10%"/>
   </colgroup>
   <tr>
      <th>글번호</th>
      <th>제목</th>
      <th>내용</th>
      <th>조회수</th>
      <th>등록일</th>
      <th>수정</th>
      <th>삭제</th>
   </tr>
   <%
   int number=0;
   while(rs.next()){
      number++;
      String unq = rs.getString("unq");
      String title = rs.getString("title");
      String content = rs.getString("content");
      String views = rs.getString("views");
      String registration = rs.getString("registration");
   %>
   <tr>      
      <td><%=unq %></td>
      <td><a href="noticeDetail.jsp?unq= <%=unq %>"><%=title %></a></td>
      <td><%=content %></td>
      <td><%=views %></td>
      <td><%=registration %></td>
      <td><button type="button" onclick="fn_modify('<%=unq%>')">수정</button></td>
      <td><button type="button" onclick="fn_delete('<%=unq%>')">삭제</button></td>
   </tr>

<%    
}
%>
   
</table>

</body>
</html>