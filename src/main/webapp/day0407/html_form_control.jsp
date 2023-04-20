<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="http://localhost/jsp_prj/common/main_v20230217.css"/>
<style type="text/css">
#wrap{ width: 1000px; height: 1200px;margin: 0px auto; }
#header{  height: 200px; position: relative;
	background: #FFFFFF url(http://localhost/jsp_prj/common/images/header_bg.png)  repeat-x;}

#logo{ position:absolute;top: 40px;left:100px; width: 150px; font-weight: bold; font-size: 40px;
	font-family: 고딕 ;}	
#naviBar{ position:absolute;top:140px;left:0px;height: 60px }	 
#container{ height: 900px;position: relative; }	 

#footer{ height: 100px;position: relative;  }	 
#flogo{ position:absolute;top:20px;left:100px;height: 60px;font-weight: bold; font-size: 20px;
	font-family: 고딕 ; color:#d7d7d7; text-align: right; width:100%;  }	 

</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">

</script>

</head>
<body>
<div id="wrap"> 
<div id="header">  
	<div id="logo">Class 4.</div>
	<div id="naviBar">navi ( 1000 x 60)</div>
</div>
<div id="container">


<!-- <form action="html_form_control_process.jsp" method="post" id= "postFrm" > -->
<form action="bean_html_form_control_process.jsp" method="post" id= "postFrm" >
<table width="800" border="1" cellspacing="0" cellpadding="5">
<tr>
  <td width="70">아이디</td> <td><input type="text" class="inputBox" name="id"/></td>
</tr>
<tr>
  <td>비밀번호</td> <td><input type="password"  class="inputBox" name="password"/></td>
</tr>
<tr>
  <td>이름</td> <td><input type="text" class="inputBox" class="inputBox" name="name"/></td>
</tr>
<tr>
  <td>생일</td> <td><input type="date" value="2023-02-15" class="inputBox" name="birth"/></td>
</tr>
<tr>
  <td>휴대폰</td> <td><input type="tel" class="inputBox" name="tel"/> </td>
</tr>
<tr>
  <td>이메일</td> <td><input type="text" class="inputBox" name="email"/> @ 
  <select class="inputBox" name="email2">
  <option value="google.com">google.com</option>
  <option value="daum.net">daum.net</option>
  <option value="nate.com">nate.com</option>
  <option value="naver.com">naver.com</option>
  <option value="hotmail.com">hotmail.com</option>
  </select>
  </td>
</tr>
<tr>
  <td>성별</td> <td><input type="radio" value="m" name="gender" checked="checked">남
  <input type="radio" value="f" name="gender">여</td>
</tr>
<tr>
  <td>소재지</td> <td>
  <select class="inputBox" name="location">
    <option> 선택해주세요. </option>
    <option value="서울"> 서울 </option>
    <option value="경기도"> 경기도 </option>
    <option value="강원도"> 강원도 </option>
    <option value="충청도"> 충청도 </option>
    <option value="경상도"> 경상도 </option>
    <option value="전라도"> 전라도</option>
    <option value="제주도"> 제주도</option>
  </select>
  </td>
</tr>
<tr>
<td>관심언어</td>
<td>
<input type="checkbox" name="lang" value="Java">자바
<input type="checkbox" name="lang" value="C/C++">C/C++
<input type="checkbox" name="lang" value="VB">VB
<input type="checkbox" name="lang" value="ASP">ASP
<input type="checkbox" name="lang" value="JSP">JSP
</td>
</tr>
<tr>
  <td>우편번호</td> <td><input type="text" class="inputBox" name="zipcode"/> <input type="button" value="우편번호 검색"  class="btnBorder"></td>
</tr>
<tr>
  <td>주소</td> <td><input type="text" class="inputBox" name="addr"/><br/><input type="text" class="inputBox" name="addr2"></td>
</tr>
</table>
<table width="800" cellpadding="5">
<tr>
<td align="center"><input type="submit" value="확인"  class="btnBorder"/>  <input type="reset" value="취소"  class="btnBorder">  </td>
</tr>
</table>
</form>
</div>
<div id="footer">footer ( 1000 x 100)
	<div id="flogo"> Copyright &copy; Class 4. All rights reserved.</div>
</div>
</div>
</body>
</html>



    