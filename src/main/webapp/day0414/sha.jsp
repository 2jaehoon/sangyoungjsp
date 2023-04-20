<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>

<%@page import="java.security.MessageDigest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="SHA( Secure Hash Algorithm ) - 일방향 암호화(원본 문자열로 돌아갈 수 없다.) "
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="http://localhost/jsp_prj/common/main_v20230217.css"/> 
<style type="text/css">

#wrap{
width:1000px; height:1200px; margin:0px auto; /* background-color:#FF0000; */
}

#header{
height:200px; /* background-color:#00FF00; */
position:relative;
background:#FFF url(http://localhost/jsp_prj/common/images/header_bg.png) repeat-x;
}

#logo{
position:absolute; top:40px; left:100px; 
width:150px; font-weight:bold; font-size:40px; font-family:고딕; 
}

#naviBar{
position:absolute; top:140px; left:0px;
height:60px;
}

#container{
height:900px; /* background-color:#23A9FF; */
position:relative;
}

#footer{
height:100px; position:relative; /* background-color:#0766E6; */
}

#flogo{
position:absolute; left:600px; 
height:60px; font-weight:bold; font-size:20px; font-family:"맑은 고딕";
color:#d7d7d7;
} 


</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">

</script>
</head>
<body>


<div id="wrap"> <!-- wrap(w:1000 h:1200) -->


<div id="header"><!-- header(w:1000 h:200) -->
	<div id="logo">Class 4</div>
	<div id="naviBar">naviBar(w:1000 h:60)</div>
</div>


<div id="container">container(w:1000 h:900)
<%
String msg1 = "1234";
String msg2 = "test_web";
String msg3 = "윤상준";

//SHA로 암호화 할 수 있는 객체 사용 MessageDigest
//1. 생성
MessageDigest md1 = MessageDigest.getInstance("SHA-224"); 
MessageDigest md2 = MessageDigest.getInstance("SHA-224"); 
MessageDigest md3 = MessageDigest.getInstance("SHA-224"); 
//2. 문자열을 byte[]로 만들어 암호화 : 알아 볼 수 없는 문자열 : Cipher Text
md1.update(msg1.getBytes());
md2.update(msg2.getBytes());
md3.update(msg3.getBytes());
//3. 암호화된 문자열을 byte[] 가져온다.( charset? )
//문자열이 알아볼 수 없는 문자열로 나온다. 그래서  Base64  클래스 사용한다
%>

<%-- <%-- 사람이 알아볼 수 없는 문자열 나온다.  <%= new String(md3.digest() ) %> --%> --%>
<%
//Base64 사용 유틸 아님@@@@
Base64 base = new Base64();
%>
<%= msg1 %>의 암호화 <%= new String(base.encode(md1.digest()) ) %><br>
<%= msg2 %>의 암호화 <%= new String(base.encode(md2.digest()) ) %><br>
<%= msg3 %>의 암호화 <%= new String(base.encode(md3.digest()) ) %><br>


<%= msg3 %>의 복호화 <%= new String(base.decode(md3.digest()) ) %><br>

<%= msg1 %>의 암호화 <%=DataEncrypt.messageDigest("SHA-224", msg1)%><br>
<%= msg2 %>의 암호화 <%=DataEncrypt.messageDigest("SHA-224", msg2)%><br>
<%= msg3 %>의 암호화 <%=DataEncrypt.messageDigest("SHA-224", msg3)%><br>



</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>