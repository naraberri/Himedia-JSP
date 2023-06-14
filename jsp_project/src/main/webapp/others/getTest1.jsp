<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GET 방식 테스트</title>
</head>
<body>
<%
String eng2 = request.getParameter("eng");
String kor2 = request.getParameter("kor");
out.print(eng2 + "<br>");
out.print(kor2);
%>
</body>
</html>