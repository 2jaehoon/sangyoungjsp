<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="웹 파라메터 명이 같을 때 처리하는 법"
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
<h1>요청 값을 처리하여  응답되는 페이지</h1>
<%
//post방식의 한글 처리
request.setCharacterEncoding("UTF-8");//GET 방식일 때에는 동작하지 않는다.

//이름이 유일
String name = request.getParameter("name");
//이름이 중복 : request.getParameterValues 메서드를 사용하지 않고
//request.getParameter 메서드를 사용하면 입력 값 중 가장 처음에 입력된 값 하나만 받는다.
//String hobby = request.getParameter("hobby");

String[] hobby = request.getParameterValues("hobby");
%>
<h2>요청방식 : <%= request.getMethod() %></h2>
<ul>
<li>이름 : <strong><%= name %></strong></li>
<li> 취미 : 
<%if( hobby!=null ){//배열이 존재하면 반복한다. 
for(int i=0; i<hobby.length; i++){
%>
<%=hobby[i] %>
<% 
}//end for
}else{%>
선택한 취미 없음
	<%
}//end else
%>
</li>
</ul>
</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>