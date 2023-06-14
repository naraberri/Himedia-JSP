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
String username = request.getParameter("username");
String birthday = request.getParameter("birthday");
String phone = request.getParameter("phone");
String addr = request.getParameter("addr");
String gender = request.getParameter("gender");

String[] hobby = request.getParameterValues("hobby");
%>
<%=username %> <br>
<%=birthday %> <br>
<%=phone %> <br>
<%=addr %> <br>
<%=gender %> <br>

<%
if( hobby == null ){
	out.print("취미:선택없음");
}else{
	for( int i=0; i<hobby.length; i++ ) {
		out.print(hobby[i] + " ");
	}
}
%>
<input type="button" value="뒤로" onclick="history.back()">
</body>
</html>