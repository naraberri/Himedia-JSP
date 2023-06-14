<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<title>Insert title here</title>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
</head>
<body>

<form name="frm" method="post" action="write2sub.jsp">
이름 :     <input type="text" name="username"> <br>
생년월일 : <input type="text" id="datepicker" name="birthday"> <br>
연락처 :   <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" name="phone"> <br>
거주지 :   <input type="text" name="addr"> <br>
성별 :     <input type="radio" name="gender" value="M"> 남,
	       <input type="radio" name="gender" value="F"> 여 <br>
취미 :     <input type="checkbox" name="hobby" value="바둑"> 바둑,
     	   <input type="checkbox" name="hobby" value="장기"> 장기,
     	   <input type="checkbox" name="hobby" value="체스"> 체스 <br>
<input type="submit" value="전송">
</form>

</body>
</html>