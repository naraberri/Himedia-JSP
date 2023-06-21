<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<%
String unq = request.getParameter("unq");
%>

<%
if( unq == null || unq.equals("") ) {
%>
	<script>
	alert("잘못된 경로로의 접근!!");
	location="reBoardList.jsp";
	</script>
<%
	return;
}
%>

<%
String sql = " select title,name,content,rdate "
		   + " from reboard "
		   + " where unq='"+unq+"' ";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
if( !rs.next() ) {
%>
	<script>
	alert("잘못된 경로로의 접근!!");
	location="reBoardList.jsp";
	</script>	
<%
	return;
}
String title = rs.getString("title");
String name = rs.getString("name");
String content = rs.getString("content");
String rdate = rs.getString("rdate");

content = content.replace("\n","<br>");

stmt.executeUpdate("update reboard set hits=hits+1 where unq='"+unq+"'");
%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>layout2</title>
  <link rel="stylesheet" href="../css/layout.css">
</head>
<body>
<div class="wrap">
    <header>
		<div class="top_header">

		</div>
    </header>
    <nav>
	 	<div class="nav_left_space">&nbsp;</div>
		<div class="nav_center_space">
	<!-- nav menu S -->
	<%@ include file="../include/navmenu.jsp" %>
	<!-- nav menu E -->	
		</div>
		<div class="nav_right_space">&nbsp;</div>
    </nav>
	<aside>
	<!-- aside S -->
	<%@ include file="../include/aside.jsp" %>
	<!-- aside E -->		
	</aside>
    <section>
       <article>

	<!-- 본문 S -->
		<table>
			<caption style="font-size:20px;
							font-weight:bold;">답변 상세 게시판</caption>
			<colgroup>
				<col width="20%"/>
				<col width="*"/>
			</colgroup>
			<tr>
				<th>제목</th>
				<td><%=title %></td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td><%=name %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
				<div style="width:98%; height:150px;">
				<%=content %>
				</div>
				</td>
			</tr>
			<tr>
				<th>등록일시</th>
				<td><%=rdate %></td>
			</tr>
		</table>
		<div style="width:600px;
					margin-top:10px;
					text-align:center;">
			<button type="button" onclick="history.back();" >이전</button>
			<button type="button" onclick="location='reBoardModify.jsp?unq=<%=unq %>'">수정</button>
			<button type="button" onclick="location='reBoardPass.jsp?unq=<%=unq %>'">삭제</button>
			<button type="button" onclick="location='reBoardReply.jsp?unq=<%=unq %>'">답변</button>
		</div>
	<!-- 본문 E -->
	
       </article>
    </section>
    <footer>
    <!-- footer area S -->
    <%@ include file="../include/footer.jsp" %>
    <!-- footer area E -->
    </footer>
</div>
</body>
</html>