<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>답변형게시판 등록 화면</title>
  <link rel="stylesheet" href="../css/layout.css">
</head>

<script>
function fn_submit() {
	var f = document.frm;
	if( f.title.value == "") {
		alert("제목을 입력해주세요.");
		f.title.focus();
		return false;
	}
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
	<!-- aside S -->
	<%@ include file="../include/aside.jsp" %>
	<!-- aside E -->		
	</aside>
    <section>
       <article>

	<!-- 본문 S -->
	<form name="frm" method="post" action="reBoardWriteSave.jsp">
	<table>
	<caption style="font-size:20px;
					font-weight:bold;">(답변형)등록화면</caption>
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" style="width:98%;"></td>
	</tr>
	<tr>
		<th>암호</th>
		<td><input type="password" name="pass" style="width:98%;"></td>
	</tr>
	<tr>
		<th>글쓴이</th>
		<td><input type="text" name="name" style="width:98%;"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="content" style="width:98%;height:100px;resize:none;"></textarea>
		</td>
	</tr>
	</table>
	<div style="width:600px;
				margin-top:10px;
				text-align:center;">
		<button type="submit" onclick="fn_submit();return false;" >저장</button>
		<button type="reset">취소</button>
	</div>
</form>
	<!-- 본문 E -->
	
       </article>
    </section>
    <footer>
    <!-- footer area S -->
    <%@ include file="../include/footer.jsp" %>
    <!-- footer area E -->
    </footer>
</div>
</body>
</html>