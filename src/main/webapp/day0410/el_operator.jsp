<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="EL - 연산자의 사용"
   isELIgnored="false"
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
<strong>EL - 연산자의 사용</strong>
<!-- EL이 만들어진 목적은 출력을 위해서 만들어졌다. -->
EL에서는 문자가 없다 ", ' 모두 문자열<br>
${ "오늘은 월요일" }<br>
${ '내일은 화요일' }<br>

<ul>
<li>-4${ -4  }<br></li>
<li>4 + 10 = ${ 4+10  }</li>
<li>10 / 3 = ${ 10/3  }</li><!-- EL에서는 정수 / 정수 = 실수 -->
<li><strong>관계 연산자</strong></li>
<li>10 &gt; 4 = ${ 10 > 4 }  ( ${ 10 gt 4 } )</li>
<li>10 &lt; 4 = ${ 10 < 4 }  ( ${ 10 lt 4 } )</li>
<li>10 &gt;= 4 = ${ 10 >= 4 }  ( ${ 10 ge 4 } )</li>
<li>10 &lt;= 4 = ${ 10 <= 4 }  ( ${ 10 le 4 } )</li>
<li>10 == 4 = ${ 10 == 4 }  ( ${ 10 eq 4 } )</li>
<li>10 != 4 = ${ 10 != 4 }  ()</li><!-- ne는 코드 상에서는 발생하지만 실행은 잘 된다. -->
<li><strong>논리 연산자</strong></li>
<li>10 &gt; 4 && 4 &lt; 10 ${ 10>4 && 4<10 }  ( ${ 10 gt 4 and 4 lt 10 } )</li>
<li>10 &gt; 4 || 4 &lt; 10 ${ 10>4 || 4<10 }  ( ${ 10 gt 4 or 4 lt 10 } )</li>
</ul>
<!-- EL에서는 변수에 값을 변경하는 연산자를 사용할 수 없다.
EL => 화면 출력
 -->
<%--  <%
 int i = 11;
 pageContext.setAttribute("i", i);
 %>
i = ${ i++ } --%>
</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>