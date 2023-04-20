<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="세션이 필요한 이유 : 이전 페이지의 요청 값을 받아 보여주는 일"
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
<%
//웹 파라메터 저장
String name = request.getParameter("name");
String addr = request.getParameter("addr");
//세션의 생존 시간을 설정 session.setMaxInactiveInterval(초);
session.setMaxInactiveInterval(60*1);
//초*분*시*일*일*월*년


//값을 여러 페이지에서 사용하기 위해 session에 저장
//세션에 저장된 값은 interval이 기본 30분동안 유지
session.setAttribute("user_name", name);
session.setAttribute("user_addr", addr);



%>

<div id="container">container(w:1000 h:900)
<strong><%= name %></strong>님 안녕하세요?<br>
<strong>${ param.name  }</strong>님 안녕하세요?<br>
<%= name %>님의 작업 페이지로 




<a href="use_session_c.jsp">이동</a> 

</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>