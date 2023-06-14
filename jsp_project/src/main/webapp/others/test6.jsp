<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>풀어보기</title>
</head>
<body>
<%
String address = "123456 서울시 강남구 논현동77";
%>
<%= address.length() %> <br>
<%= address.indexOf("123456") %> <br>
<%= address.indexOf("서울시") %> <br>
<%= address.substring(0,7) %> <br>
<%= address.substring(7) %> <br>
<%= address.contains("논현") %> <br>

<%
String birthday ="20100115 20011225 19981102";
Calendar cal =  Calendar.getInstance();
int yy =cal.get(Calendar.YEAR);
String[] birthdays = birthday.split(" ");      
%>
전송데이터 : <%=birthday %><br>
<%
for (int i=0; i<birthdays.length;i++){
   String y = birthdays[i].substring(0,4);
   String m = birthdays[i].substring(4,6);
   String d = birthdays[i].substring(6);
   int age = yy - Integer.parseInt(y);
%>
   데이터 <%= i+1 %> : 나이(만 <%=age %>), 생일(<%=m %>월<%=d %>일)<br>
<%
}
%>
</body>
</html>