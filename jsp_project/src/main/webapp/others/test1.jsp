<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String title = "jsp";
int year = 2023;
out.print(title+"<br>");
out.print(year);
%>
<br>
<%=title %> <br>
<%=year %>
</body>
</html>