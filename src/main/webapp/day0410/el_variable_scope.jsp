<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="scope 객체 사용 - 변수의 값을 사용하기 위해서"
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


<div id="container">
<%
String name = "윤상준";
//EL에서는 변수에 직접 접근이 되지 않으므로 scope 객체에 할당하여 접근한다.
pageContext.setAttribute("pageName", "page-"+name);
request.setAttribute("reqName", "req-"+name);
session.setAttribute("sesName", "ses-"+name);
application.setAttribute("appName", "app-"+name);
%>


<!-- EL에서는 
	pageContext 객체를 사용하기 위해 pageScope.이름
	request 객체를 사용하기 위해 requestScope.이름
	session 객체를 사용하기 위해 sessionScope.이름
	application 객체를 사용하기 위해 applicationScope.이름
	 으로 사용한다.
 -->
 
 pageScope : <strong>${ pageScope.pageName }</strong><br>
 requestScope : <strong>${ requestScope.reqName }</strong><br>
 sessionScope : <strong>${ sessionScope.sesName }</strong><br>
 applicationScope : <strong>${ applicationScope.appName }</strong><br>
 <h2>scope 객체의 생략</h2>
  pageScope : <strong>${ pageName }</strong><br>
 requestScope : <strong>${ reqName }</strong><br>
 sessionScope : <strong>${ sesName }</strong><br>
 applicationScope : <strong>${ appName }</strong><br>
</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>