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
String name = request.getParameter("name");
String tell = request.getParameter("tell");

if(name != null && tell != null && !name.isEmpty() && !tell.isEmpty()){
	out.print(name+"의 전번은 "+tell+"입니다");
}
%>



<form name="frm" method="post" action="selfSubmit.jsp">
이름 : <input type="text" name="name"> 전번 : <input type="text" name="tell"> <input type="submit" value="전송">
</form>

</body>
</html>