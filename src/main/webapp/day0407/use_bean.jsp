<%@page import="day0407.TestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="표준 액션을 사용한 객체 생성 및 사용"
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
//JSP에서 자바 클래스를 사용하기 위해서는 코드 scriptlet에 작성한다.
//1. 객체 생성
TestVO tVO = new TestVO();
//2. 객체 사용
tVO.setName("이재훈");
tVO.setAge(25);
String name = tVO.getName();
int age = tVO.getAge();
%>

<div>
 전통적인 자바 코드<br>
 이름 : <%= name %><br>
 나이 : <%= age %>
</div>

<div>
액션 태그를 사용한 객체<br>
<!-- 기본 생성자만 호출된다. -->
<jsp:useBean id="testVO" class="day0407.TestVO" />

<!-- setter method 호출
property= "set을 제외한 method명 첫 자를 소문자로 기술"
setName() => property="name"
setAge() => property="Age"

대소문자가 여러 개 나오면 첫 자만 모두 소문자로 나머지는 대소문자를 가려 작성
setMyName() => property="myName"
 -->
<jsp:setProperty property="name" name="testVO" value="이재훈"  />
<jsp:setProperty property="age" name="testVO" value="25"  />

<!-- getProperty를 사용하면 getter 호출과 화면 출력이 한 번에 출력된다. -->
이름 : <jsp:getProperty property="name" name="testVO"/><br>
나이 : <jsp:getProperty property="age" name="testVO"/><br>

<%
//useBean  액션 태그의 id 속성은 객체명이므로 jsp 태그에서 사용할 수 있다.
%>
<input type="text" name="name" class="inputBox" value="<%=testVO.getName() %>" >
<br>
<input type="text" name="age" class="inputBox" value="<%=testVO.getAge() %>" >

</div>


</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>