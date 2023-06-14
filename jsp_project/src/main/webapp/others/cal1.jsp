<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String yy = request.getParameter("yy");
String mm = request.getParameter("mm");

Calendar cal = Calendar.getInstance();

int y = cal.get(Calendar.YEAR);
int m = cal.get(Calendar.MONTH);

if(yy != null && 
   mm != null &&
   !yy.equals("") && 
   !mm.equals(""))
{
	//유효성 체크
	boolean yy_chk = yy.matches("[0-9]{4}");
	boolean mm_chk = mm.matches("[0-9]{1,2}");
	if(yy_chk == true && mm_chk == true){
		y = Integer.parseInt(yy);
		m = Integer.parseInt(mm)-1;
	}
}

cal.set(y,m,1);
int dayOfweek = cal.get(Calendar.DAY_OF_WEEK);
int lastday = cal.getActualMaximum(Calendar.DATE);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<form name="frm" method="post" action="cal1.jsp">
	<input type="text" name="yy" size="4">년
	<input type="text" name="mm" size="2">월	
	<input type="submit" value="달력보기">
</form>
</div>
<div>
	<%=y %>년 <%=m+1 %>월
</div>

<table border="1" width="350">
	<tr>
		<th><font color="red">일</font></th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th><font color="blue">토</font></th>
	</tr>
	<tr>
		<%
		int cnt = 0;
		for(int i=1;i<dayOfweek;i++){
			out.print("<td></td>");
			cnt++;
		}		
		
		for(int d=1; d<=lastday; d++) {
			cnt++;	//7
			String color = "#555555";
			if(cnt==1){
				color="red";
			}else if(cnt==7){
				color="blue";
			}
		%>			
			<td><font color="<%=color%>"><%= d %></font></td>			
		<%
			if( cnt == 7){
				out.print("<tr></tr>");
				cnt = 0;
			}
		}
		%>
	</tr>
</table>

</body>
</html>