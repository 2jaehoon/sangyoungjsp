<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="복호화가 가능한 암호화"
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


<div id="container">
<%
//plain text
String msg1 = "1";
String msg2 = "test@test.com";
String msg3 = "윤상준";

//암호화 Plain Text > Cipher Text(insert, update)4
DataEncrypt de = new DataEncrypt("Hssi9l1l94rq4WfpjxLV4iVhJ4480D2jqRvfdw==");
String ct1 = de.encryption(msg1);
String ct2 = de.encryption(msg2);
String ct3 = de.encryption(msg3);

%>
원본 문자열 : <%= msg1 %>, 암호화 문자열 <%= ct1 %><br>
원본 문자열 : <%= msg2 %>, 암호화 문자열 <%= ct2 %><br>
원본 문자열 : <%= msg3 %>, 암호화 문자열 <%= ct3 %><br>

<%
// 복호화 : Cipher Text > Plain Text(select)
DataDecrypt dd = new DataDecrypt("Hssi9l1l94rq4WfpjxLV4iVhJ4480D2jqRvfdw==");

String pt1 = dd.decryption(ct1);
String pt2 = dd.decryption(ct2);
String pt3 = dd.decryption(ct3);

%>

암호화 문자열 : <%=ct1 %>, 복호화 문자열 : <%=pt1 %><br>
암호화 문자열 : <%=ct2 %>, 복호화 문자열 : <%=pt2 %><br>
암호화 문자열 : <%=ct3 %>, 복호화 문자열 : <%=pt3 %><br>


</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>