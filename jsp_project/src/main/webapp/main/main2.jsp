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
int last_rn = first_rn+4;

String sql0 = "select count(*) as total from board1";
Statement stmt0 = con.createStatement();
ResultSet rs0 = stmt0.executeQuery(sql0);
rs0.next();
int total = rs0.getInt("total");

int lastpage = (int) Math.ceil((double)total/5) ;

int number = total - (Integer.parseInt(viewPage)-1)*5;

String sql1 = " select b.* from( "
	    	+ "	 select rownum rn,a.* from( "
		    + "  	 select "
		    + "      	 unq ,title ,name ,to_char(rdate,'yyyy-mm-dd') as rdate "
		    + "      from board1 "
		    + "      order by unq desc) a ) b "
		   	+ " where rn >= "+first_rn+" and rn <= "+last_rn;
Statement stmt1 = con.createStatement();
ResultSet rs1 = stmt1.executeQuery(sql1);
%>


<%
String viewPage1 = request.getParameter("viewPage1");
if( viewPage1 == null) {
	viewPage1 = "1";
}

int first_rn1 = ((Integer.parseInt(viewPage1)-1) * 10) + 1;
int last_rn1 = first_rn1+4;

String sql3 = "select count(*) as cnt from reboard";
Statement stmt3 = con.createStatement();
ResultSet rs3 = stmt3.executeQuery(sql3);
rs3.next();
int total1 = rs3.getInt("cnt");

int lastpage1 = (int) Math.ceil((double)total1/5) ;

int number1 = total1 - (Integer.parseInt(viewPage1)-1)*5;

String sql4 = " select b.* from( "
	    	+ "	 select rownum rn,a.* from( "
		    + "  	 select "
		    + "      	 unq ,title ,name ,to_char(rdate,'yyyy-mm-dd') as rdate,thread "
		    + "      from reboard "
		    + "		 where thread ='a'"
		    + "      order by gid desc,thread asc) a ) b "
		   	+ " where rn >= "+first_rn1+" and rn <= "+last_rn1;
Statement stmt4 = con.createStatement();
ResultSet rs4 = stmt4.executeQuery(sql4);
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
								font-weight:bold;">게시판 목록</caption>
				<colgroup>
					<col width="10%"/>
					<col width="*"/>
					<col width="15%"/>
					<col width="15%"/>
				</colgroup>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>등록일</th>
				</tr>
				
				<%
				while( rs1.next() ) {
					String unq = rs1.getString("unq");
					String title = rs1.getString("title");
					String name = rs1.getString("name");
					String rdate = rs1.getString("rdate");
				%>
				<tr>
					<td><%=number %></td>
					<td style="text-align:left;"><a href="../board/board1Detail.jsp?unq=<%=unq%>"><%=title %></a></td>
					<td><%=name %></td>
					<td><%=rdate %></td>
				</tr>
				<%
					number--;
				}
				%>	
			</table>			
			<div style="width:600px;margin-top:10px;text-align:center;">
				<!-- 페이징처리 -->
				<%
				for(int i=1; i<=lastpage; i++){
				%>
					<a href="main2.jsp?viewPage=<%=i%>&viewPage1=<%=viewPage1%>"><%=i %></a>
				<%	
				}
				%>
			</div>			
		<table>
			<caption style="font-size:20px;
							font-weight:bold;">답변 게시판 목록</caption>
			<colgroup>
				<col width="10%"/>
				<col width="*"/>
				<col width="15%"/>
				<col width="15%"/>
			</colgroup>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>등록일</th>
			</tr>
			
			<%
			while( rs4.next() ) {
				String unq = rs4.getString("unq");
				String thread = rs4.getString("thread");
				String title = rs4.getString("title");
				String name = rs4.getString("name");
				String rdate = rs4.getString("rdate");
				
				int thread_len = thread.length();
			%>
			<tr>
				<td><%=number %></td>
				<td style="text-align:left;">
				<a href="../reboard/reBoardDetail.jsp?unq=<%=unq%>"><%=title %></a>
				</td>
				
				<td><%=name %></td>
				<td><%=rdate %></td>		
			</tr>
			<%
				number--;
			
			}
			%>
			</table>			
			<div style="width:600px;margin-top:10px;text-align:center;">
				<!-- 페이징처리 -->
				<%
				for(int i=1; i<=lastpage1; i++){
				%>
					<a href="main2.jsp?viewPage1=<%=i%>&viewPage=<%=viewPage%>"><%=i %></a>
				<%	
				}
				%>
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