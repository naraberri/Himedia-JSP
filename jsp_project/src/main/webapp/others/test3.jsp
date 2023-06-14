<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
public int multi(int a,int b){
	int c = a * b;
	return c;
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
10 * 25 = <%= multi(10, 25) %>
</body>
</html>