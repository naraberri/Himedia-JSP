<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String unq = request.getParameter("unq");
%>

<%
if( unq == null || unq.equals("") ) {
%>
	<script>
	alert("잘못된 경로로의 접근!!");
	location="board1List.jsp";
	</script>
<%
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>layout2</title>
  <link rel="stylesheet" href="../css/layout.css">
</head>

<script>
function fn_submit() {
	if( f.pass.value == "") {
		alert("암호를 입력해주세요.");
		f.pass.focus();
		return false;
	}
	f.submit();
}

</script>
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
		aside 영역
	</aside>
    <section>
       <article>
<!-- 본문 START -->
			<form name="frm" method="post" action="board1Delete.jsp">
			<input type="hidden" name="unq" value="<%=unq %>">
			<table>
				<caption style="font-size:20px;
								font-weight:bold;">암호화면</caption>
				<colgroup>
					<col width="20%"/>
					<col width="*"/>
				</colgroup>
				<tr>
					<th>암호</th>
					<td><input type="password" name="pass" style="width:98%;"></td>
				</tr>
			</table>
			<div style="width:600px;
						margin-top:10px;
						text-align:center;">
				<button type="submit" onclick="fn_submit();return false;" >삭제</button>
				<button type="reset">취소</button>
			</div>
			</form>
<!-- 본문 END -->
       </article>
    </section>
    <footer>
        Footer 영역
    </footer>
</div>
</body>
</html>