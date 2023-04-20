<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
request.setCharacterEncoding("UTF-8");//GET 방식일 때에는 동작하지 않는다.

//이름이 유일
String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name");
String birth = request.getParameter("birth");
String tel = request.getParameter("tel");
String email = request.getParameter("email");
String email2 = request.getParameter("email2");
String gender = request.getParameter("gender");
String location = request.getParameter("location");
String lang[] = request.getParameterValues("lang");
String zipcode = request.getParameter("zipcode");
String addr = request.getParameter("addr");
String addr2 = request.getParameter("addr2");
%>
<br>
<%=  name %>님 가입을 환영합니다.
가입 시 입력한 정보는 아래와 같습니다.
<br>
아이디 : <%= id  %><br>
비밀번호 : <%= password  %><br>
이름 : <%=  name %><br>
생일 : <%= birth   %><br>
전화번호 : <%= tel  %><br>
이메일 : <%= email  %>@<%= email2  %><br>
성별 : <%= gender  %><br>
지역 : <%= location  %><br>
언어 : 
<%
//try catch로 처리하든 if로 처리한다.
if( lang!=null ){//배열이 존재하면 반복한다. 
for(int i=0; i<lang.length; i++){
%>
<%=lang[i] %>
<% 
}//end for
}else{%>
선택한 취미 없음
	<%
}//end else
%><br>
집 : <%= zipcode  %><br>
주소 : <%= addr  %><%= addr2  %><br>
</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>