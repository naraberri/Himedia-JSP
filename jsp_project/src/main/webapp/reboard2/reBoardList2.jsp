<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<%
String viewPage = request.getParameter("viewPage");
if( viewPage == null) {
	viewPage = "1";
}

int first_rn = ((Integer.parseInt(viewPage)-1) * 10) + 1;
int last_rn = first_rn+9;

String sql0 = "select count(*) as total from reboard";
Statement stmt0 = con.createStatement();
ResultSet rs0 = stmt0.executeQuery(sql0);
rs0.next();
int total = rs0.getInt("total");

int lastpage = (int) Math.ceil((double)total/10) ;
String sql4 = "select count(*) as total1 from reboard where thread='a'";
Statement stmt4 = con.createStatement();
ResultSet rs4 = stmt4.executeQuery(sql4);
rs4.next();
int total1 = rs4.getInt("total1");
int number = total1 - (Integer.parseInt(viewPage)-1)*10;

String sql1 = " select b.* from( "
	    	+ "	 select rownum rn,a.* from( "
		    + "  	 select "
		    + "      	 unq ,title ,name ,hits ,to_char(rdate,'yyyy-mm-dd') as rdate,thread "
		    + "      from reboard "
		    + "      order by gid desc,thread asc) a ) b "
		   	+ " where rn >= "+first_rn+" and rn <= "+last_rn;
Statement stmt1 = con.createStatement();
ResultSet rs1 = stmt1.executeQuery(sql1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 게시판 목록</title>
</head>
<style>
body{
	font-size:12x;
	font-family:맑은 고딕;
}
table{
	width:600px;
	border:1px solid #555555;
	border-collapse:collapse;
}
th,td{
	border:1px solid #555555;
}
</style>

<body>
<table>
	<caption style="font-size:20px;
					font-weight:bold;">답변 게시판 목록</caption>
	<colgroup>
		<col width="10%"/>
		<col width="*"/>
		<col width="15%"/>
		<col width="10%"/>
		<col width="15%"/>
	</colgroup>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>조회수</th>
		<th>등록일</th>
	</tr>
	
	<%
	while( rs1.next() ) {
		String unq = rs1.getString("unq");
		String thread = rs1.getString("thread");
		String title = rs1.getString("title");
		String name = rs1.getString("name");
		String hits = rs1.getString("hits");
		String rdate = rs1.getString("rdate");
		
		int thread_len = thread.length();
	%>
	<tr>
		<td>
		<%
		if(thread_len==1){
		%>
		<%=number %>
		<%
		number--;
		} 
		%>
		</td>
		<td>
		<%
		for(int i=1; i<thread_len; i++){
			out.print("&nbsp;&nbsp;");
		}
		if( thread_len > 1){ out.print("(re)"); }
		%>
		<a href="reBoardDetail.jsp?unq=<%=unq%>"><%=title %></a>
		</td>
		
		<td><%=name %></td>
		<td><%=hits %></td>
		<td><%=rdate %></td>		
	</tr>
	<%	
	}
	%>
</table>

<div style="width:600px;margin-top:10px;text-align:center;">
	<!-- 페이징처리 -->
	<%
	for(int i=1; i<=lastpage; i++){
	%>
		<a href="reBoardList2.jsp?viewPage=<%=i%>"><%=i %></a>
	<%	
	}
	%>
</div>

<div style="width:600px;margin-top:10px;text-align:right;">
	<button type="button" onclick="location='reBoardWrite.jsp'">글쓰기</button>
</div>

</body>
</html>	