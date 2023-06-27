<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/oracleCon.jsp" %>

<%
String memberId = (String) session.getAttribute("SessionUserId");
if( memberId == null) {
%>
   
<%
}
String sql = "select name,gender,to_char(birth,'yyyy-mm-dd') birth,phone,zipcode,addr,hobby,email,homepage,rdate"
         +" from memberinfo " 
         +" where userid = '"+memberId+"' ";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

if( rs.next() == false ){
   session.removeAttribute("SessionUserId");
%>
   
   <script>
   alert("다시 로그인을 해주세요");
   location = "../member/loginWrite.jsp";
   </script>
<%
}

String name = rs.getString("name");
String gender = rs.getString("gender");
String birth = rs.getString("birth");
String phone = rs.getString("phone");
String zipcode = rs.getString("zipcode");
String addr = rs.getString("addr");
String hobby = rs.getString("hobby");
String email = rs.getString("email");
String homepage = rs.getString("homepage");

out.print(hobby);
//2000/10/10
String[] birthday = birth.split("-");
int year = Integer.parseInt(birthday[0]);
int month = Integer.parseInt(birthday[1]);
int day = Integer.parseInt(birthday[2]);

String[] phoneUser = phone.split("-");

String[] pp = new String[3];
pp[0] = phoneUser[0];
pp[1] = phoneUser[1];
pp[2] = phoneUser[2];


for( int i=0; i<phoneUser.length; i++ ) {
   pp[i] = phoneUser[i];
}

String[] hobbyUser = hobby.split(",");

boolean badook = false;
boolean janggi = false;
boolean chesss = false;
for(int i=0;i<hobbyUser.length;i++){
	if( hobbyUser[i].equals("바둑") ){ badook = true; }
	if( hobbyUser[i].equals("장기") ){ janggi = true; }
	if( hobbyUser[i].equals("체스") ){ chesss = true; }
}

if( email == null ){
	email = "";
}
if( homepage == null ){
	homepage = "";
}
%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>회원정보 수정 화면</title>
  <link rel="stylesheet" href="../css/layout.css">
</head>
<style>
td { text-align:left;  }
.input1 { width:98%;   }
.input2 { width:150px; }
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>

<script>
function fn_popup() {
	var url = "post1.jsp";
	window.open(url,"post","width=500,height=200");
}

function fn_submit() {
	var f = document.frm;
	if( f.userid.value.length < 6 || 
		f.userid.value.length > 12 ) {
		alert("아이디는 6자리 ~ 12자리 사이로 작성해주세요.");
		f.userid.focus();
		return false;
	}
	if( f.userpw.value.length < 6 || 
		f.userpw.value.length > 20 ) {
		alert("아이디는 6자리 ~ 20자리 사이로 작성해주세요.");
		f.userpw.focus();
		return false;
	}
	if( f.name.value == "") {
		alert("이름을 작성해주세요.");
		f.name.focus();
		return false;
	}
	if( f.p2.value == "" || f.p3.value == "") {
		alert("핸드폰 번호를 입력해주세요.");
		f.p2.focus();
		return false;
	}
	var hobby = document.getElementsByNames("hobby");
	var len = hobby.length;
	var cnt = 0;
	for ( var i=0; i<len; i++ ) {
		if ( hobby[i].checked == true ) {
			cnt++;
		}
	}
	if( cnt == 0 ) {
		alert("취미를 체크해주세요.");
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
<form name="frm" method="post" action="memberWriteSave.jsp">	
<table>
	<tr>
		<th>*아이디</th>
		<td>
			<%=memberId %>
		</td>
	</tr>
	<tr>
      <td>*암호</td>
      <td>
         <button type = "button">암호변경</button>
      </td>
   </tr>
	<tr>
		<th>*이름</th>
		<td><input type="text" name="name" class="input1" value="<%=name%>"></td>
	</tr>
	<tr>
		<th>*성별</th>
		<td>
			<select name="gender" id="gender">
				<option value="M" <%if( gender.equals("M") ){%>selected<%}%>>남성</option>
				<option value="F" <%if( gender.equals("F") ){%>selected<%}%>>여성</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>*생일</th>
		<td>	<!-- 1940 ~ 2022 -->
			<select name="year">
			<%
			for(int yy=1940;yy<=2022;yy++) {
			%>
				<option value="<%=yy%>"<%if(yy==year){%>selected<%}%> ><%=yy%></option>
			<%
			}
			%>
			</select>년
			<select name="month">
			<%
			for(int mm=1;mm<=12;mm++) {
			%>
				<option value="<%=mm%>" <%if(mm==month){%>selected<%}%>><%=mm%></option>
			<%
			}
			%>
			</select>월
			<select name="day">
			<%
			for(int dd=1;dd<=31;dd++) {
			%>
				<option value="<%=dd%>" <%if(dd==day){%>selected<%}%>><%=dd%></option>
			<%
			}
			%>	
			</select>일
		</td>
	</tr>
	<tr>
		<th>*핸드폰</th>
		<td>
			<select name="p1">
				<option value="010" <%if(pp[0].equals("010")){%>selected<%}%>>010</option>
				<option value="011" <%if(pp[0].equals("011")){%>selected<%}%>>011</option>
				<option value="015" <%if(pp[0].equals("015")){%>selected<%}%>>015</option>
			</select>
			<input type="number" name="p2" class="input2" value="<%=(pp[1]==null)?"":pp[1] %>">
			<input type="number" name="p3" class="input2" value="<%=(pp[2]==null)?"":pp[2] %>">
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>
			<div style="line-height:2.0;">
				<input type="number" name="zipcode" class="input2" value="<%=zipcode %>">
				<button type="button" onclick="fn_popup()">우편번호찾기</button>
				<br>
				<input type="text" name="addr" class="input1" value="<%=addr %>">
			</div>
		</td>
	</tr><tr>
		<th>취미</th>
		<td>		
			<input type="checkbox" name="hobby" value="바둑" <%if(badook == true){%> checked  <%}%>>바둑,
			<input type="checkbox" name="hobby" value="장기" <%if(janggi == true){%> checked  <%}%>>장기,
			<input type="checkbox" name="hobby" value="체스" <%if(chesss == true){%> checked  <%}%>>체스		
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="email" name="email" class="input1" value="<%=email %>"></td>
	</tr>
	<tr>
		<th>홈페이지</th>
		<td><input type="url" name="homepage" class="input1" value="<%=homepage %>"></td>
	</tr>
</table>
<div style="width:600px;
			text-align:center;
			margin-top:10px;">
	<button type="submit" onclick="fn_submit(); return false;">저장</button>
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