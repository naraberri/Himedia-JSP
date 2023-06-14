<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Random</title>
</head>
<body>
<%
Random random = new Random();
%>
<%=random.nextInt() %> <br>
<%=random.nextBoolean() %> <br>
<%=random.nextLong() %> <br>
</body>
</html>