<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String url = "jdbc:oracle:thin:@//localhost:1522/xe";
String username = "c##java";
String userpass = "1234";
//	드라이버(ojdbc6.jar) 연결
Class.forName("oracle.jdbc.OracleDriver");
//	DB 접속
Connection con = DriverManager.getConnection(url,username,userpass);
Statement stmt = con.createStatement();

String sql = "select deptno,dname,loc from dept order by deptno desc";
ResultSet rs = stmt.executeQuery(sql);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="400" align="center">
	<tr>
		<th width="16%">순번</th>
		<th width="28%">부서번호</th>
		<th width="28%">부서이름</th>
		<th width="28%">부서위치</th>
	</tr>
	
	<%
	int cnt = 1;
	while(rs.next()) {
		String deptno = rs.getString("deptno");
		String dname = rs.getString("dname");
		String loc = rs.getString("loc");
	%>
		<tr>
			<td><%=cnt %></td>
			<td><%=deptno %></td>
			<td><%=dname %></td>
			<td><%=loc %></td>
		</tr>	
	<%
	cnt++;
	} 
	%>
	<tr>
		<td colspan="4" align=right><input type="button" value="글쓰기" onclick = "location='deptWrite.jsp'"></td>
	</tr>
</table>
</body>
</html>