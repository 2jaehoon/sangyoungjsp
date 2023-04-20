<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info ="HTML Form Control에 입력된 값을 받기 위해" %>
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

div{ line-height: 33px }
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
<div style="font-weight: bold; font-size: 25px" >
<%
String method=request.getMethod();
%>
<span style="color: #<%= "GET".equals(method)?"FF0000":"0000ff" 
%>  "><%=request.getMethod() %></span>방식으로 요청하였고 그에 대한 응답 JSP
</div>

<div>
<% 
//이름이 유일한 web parameter(사용자가 입력한 값을 받기 위해) 받기
//parameter_form_process.jsp를 요청할 때 생성되는 QueryString
//name=s&age=s&addr=서울시+강남구+역삼동&domain=none&info=s

//post 방식의 한글 처리 : request.setCharacterEncoding("변경할 charset");
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String age = request.getParameter("age");
String addr = request.getParameter("addr");
String domain = request.getParameter("domain");
String info = request.getParameter("info");

%>

<div style="color: #8995b7; font-size: 27px"  >
<strong>이름</strong> : <%= name %><br>
<strong>나이</strong> : <%= age %><br>
<strong>주소</strong> : <%= addr %><br>
<strong>도메인</strong> : <%= domain %><br>
<strong>정보</strong> : <%= info.replaceAll("\n", "<br>") %><br>

<!-- 링크로 이전페이지 이동하면 입력값이 모두 사라지고 -->
<a href="parameter_form.jsp">다시 입력(link)</a>
<!-- history로 이전페이지 이동하면 입력값이 input type="password"만 사라진다. -->
<a href="javascript:history.back()">다시 입력(history)</a>
</div>

</div>


</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>