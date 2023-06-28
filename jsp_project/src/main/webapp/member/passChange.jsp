<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호변경</title>
</head>

<script>
function fn_submit() {
	var p1 = document.frm.pass1.value;
	var p2 = document.frm.pass2.value;
	var p3 = document.frm.pass3.value;
	
	if( p1=="" || p2=="" || p3=="") {
		alert("공백확인을 해주세요.");
		document.frm.pass1.focus();
		return false;
	}
	if( p2.length < 6 || p2.length > 20 ) {
		alert("새로운 암호는 6자~20자 사이로 해주세요");
		document.frm.pass2.focus();
		return false;
	}
	if( p2 != p3 ) {
		alert("새로운 암호와 암호확인이 일치하지 않습니다.");
		document.frm.pass2.focus();
		return false;
	}
	document.frm.submit();
}

</script>

<body>
<form name="frm" method="post" action="passChangeSub.jsp">
<div>
	<table border="1" width="500">
		<tr>
			<th>현재암호</th>
			<td><input type="password" name="pass1"></td>
		</tr>
		<tr>
			<th>변경암호</th>
			<td><input type="password" name="pass2"></td>
		</tr>
		<tr>
			<th>암호확인</th>
			<td><input type="password" name="pass3"></td>
		</tr>
	</table>
	<div>
		<button type="submit" onclick="fn_submit();return false;">변경</button>
		<button type="reset">취소</button>
	</div>
</div>
</form>
</body>
</html>