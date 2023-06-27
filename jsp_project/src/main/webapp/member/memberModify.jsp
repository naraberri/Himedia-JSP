<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/oracleCon.jsp" %>
<%
String memberId = (String) session.getAttribute("SessionUserId");
if( memberId == null) {
%>
   <script>
   alert("로그인을 해주세요");
   location = "../member/loginWrite.jsp";
   </script>
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
   alert("다시 로그인을 해주세요.");
   location="../member/loginWrite.jsp";
   </script>
   
<%
	return;
}
String name      = rs.getString("name");
String gender   = rs.getString("gender");
String birthday = rs.getString("birth");
String phone    = rs.getString("phone");
String zipcode    = rs.getString("zipcode");
String addr    = rs.getString("addr");
String hobby    = rs.getString("hobby");
String email   = rs.getString("email");
String homepage = rs.getString("homepage");

String[] b_array = birthday.split("-");
int b_year = Integer.parseInt(b_array[0]);
int b_month = Integer.parseInt(b_array[1]);
int b_day = Integer.parseInt(b_array[2]);

String[] p_array = phone.split("-");

String[] pp = new String[3];
pp[0] = p_array[0];
pp[1] = p_array[1];
pp[2] = p_array[2];


for( int i=0; i<p_array.length; i++ ) {
   pp[i] = p_array[i];
}

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/layout.css">
</head>
<style>
td{ text-align:left;}
.input1 {width : 98%;}
.input2 {width : 150px;}



</style>
<script>

function fn_submit(){
   var f = document.frm
   if (f.name.value ==""){
      alert("이름작성해주세요.");
      f.name.focus();
      return false;
   }
   if(f.p2.value == "" ||f.p3.value == ""){
      alert("핸드폰 번호를 채워주세요");
      f.p2.focus();
      return false;
   }
    var hobby = document.getElementsByName("hobby");
      var len = hobby.length;
      var cnt = 0;
      for( var i=0;i<len;i++){
         if(hobby[i].checked==true){
            cnt++;
         }
      }
      if(cnt ==0){
         alert("취미를 선택해주세요.");
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
         <!--  nav menu S  -->
            <%@include file="../include/navmenu.jsp" %>
         <!--  nav menu E  -->
      </div>
      <div class="nav_right_space">&nbsp;</div>
    </nav>
   <aside>
       <!--  aside  menu S  -->
         <%@include file="../include/aside.jsp" %>
       <!--  aside  menu E  -->
   </aside>
    <section>
       <article>
   <!--  본문 S -->
<form name = "frm" method = "post" action="memberModifySave.jsp">
<table>
   <tr>
      <td>*아이디</td>
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
      <td>*이름</td>
      <td>
         <input type = "text" name = "name" value = "<%=name %>" class = "input1">
      </td>
   </tr>
   <tr>
      <td>*성별</td>
      <td>
         <select name = "gender">
            <option value = "M" <%if( gender.equals("M") ){%>selected<%}%>>남성</option>
            <option value = "F" <%if( gender.equals("F") ){%>selected<%}%>>여성</option>
         </select>
      </td>
   </tr>
   <tr>
      <td>*생일</td>
      <td><select name = "year">
      <%
      for (int yy = 1940; yy <= 2022; yy++){
      %>
            <option value = "<%=yy%>" <%if(yy==b_year){%>selected<%} %>><%=yy %></option>
      <% 
      }
      %>
         </select>
         <select name = "month">
         <%
         for (int mm =1; mm<=12; mm++ ){
         %>
            <option value = "<%=mm%>" <%if(mm==b_month){%>selected<%} %>><%=mm %></option>
         <% 
         }
         %>
            </select>
         <select name = "day">
         <%
         for (int dd = 1; dd <= 31; dd++){
         %>
            <option value ="<%=dd%>" <%if(dd==b_day){%>selected<%} %>><%=dd %></option>
         <%
         }
         %>
         </select>일
      </td>
   </tr>
   <tr>
      <td>*핸드폰</td>
      <td>
      <select name = "p1">
         <option value="010" <%if(pp[0].equals("010")){%>selected<%}%>>010</option>
		 <option value="011" <%if(pp[0].equals("011")){%>selected<%}%>>011</option>
		 <option value="015" <%if(pp[0].equals("015")){%>selected<%}%>>015</option>
      </select>
      <input type ="number" name = "p2" class = "input2" value="<%=pp[1]%>">
      <input type ="number" name = "p3" class = "input2" value="<%=(pp[2]==null)?"":pp[2]%>">
      </td>
   </tr>
   <tr>
      <td>주소</td>
      <td>
      <div style = "line-height : 2.0; ">
         <input type = "number" name = "zicode" value="<%=zipcode %>" class = "input2" value="<%=zipcode %>">
         <button type = "button" onclick = "fn_popup()">우편번호찾기</button>
         <br>
         <input type = "text" name = "addr"  value="<%=addr %>" class = "input1">
      </div>
      </td>
   </tr>
   <tr>
      <td>취미</td>
      <td>
      <input type = "checkbox" name = "hobby" value = "바둑" <%if(hobby.indexOf("바둑") > -1){%> checked <%}%>>바둑,
      <input type = "checkbox" name = "hobby" value = "장기" <%if(hobby.indexOf("장기") > -1){%> checked <%}%>>장기,
      <input type = "checkbox" name = "hobby" value = "체스" <%if(hobby.indexOf("체스") > -1){%> checked <%}%>>체스
      </td>
   </tr>
   <tr>
      <td>이메일</td>
      <td><input type = "email" name = "email" value="<%=email %>"class = "input1"></td>
   </tr>
   <tr>
      <td>홈페이지</td>
      <td><input type = "url" name = "homepage" value="<%=homepage %>" class = "input1"></td>
   </tr>
</table>
<div style = "width :600px;
           text-align : center;
           margin-top : 10px; ">
   <button type = "submit" onclick = "fn_submit(); return false">저장</button>
   <button type = "reset">취소</button>
</div></form>
   <!--  본문 E -->
   
       </article>
    </section>
    <footer>
       <!--  footer  menu S  -->
         <%@include file="../include/footer.jsp" %>
       <!--  footer  menu E  -->
    </footer>
</div>
</body>
</html>