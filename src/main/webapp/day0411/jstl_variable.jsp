<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSTL core 사용"
    %>
    <!-- 1.  taglib를 사용하기 위한 지시자 선언 -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
String name="윤상준";
int age = 27;
%>
<%-- <c:set var="name" value = "윤산준"/>
<c:set var="age" value = "25"/> --%>
<c:set var="name" value = "<%= name %>"/>
<c:set var="age" value = "<%= age %>"/>

<!-- EL에서 바로 사용 가능 -->
이름 :  ${ name }, 나이 : ${ age }

<br>
<!-- 출력 -->
<c:out value="name" /><!-- value 속성에 입력된 값이 그대로 출력됨 -->

<!-- el만 사용했을 떄보다 가독성 향상 -->
 이름 : <c:out value="${ name }"/>,  나이 : <c:out value="${ age }"/><br>
 HTML Form Control에 값으로 들어갈 때에는 &lt;c:out을 사용하지 않는다.<br>
 
 
 <input type="text" name="name" class="inputBox" value ="${ name }"/><br>
 <input type="text" name="age" class="inputBox" value ="${ age }"/><br>
 
 
<!-- 변수 삭제 : 삭제된 변수는 출력되지 않는다. -->
<c:remove var="name"/>
 이름 : <c:out value="${ name }"/>,  나이 : <c:out value="${ age }"/><br>
 
 <%
 String link = "<a href='http://sist.co.kr'>쌍용교육센터</a>";
 %>
 
 <c:set var = "link" value="<%= link %>"/>
 
 링크 : ${ link }
 <!-- c:out을 사용하면 html tag가 해석되지 않고 그대로 출력
 escapeXml 속성에 false를 설정하면 태그가 해석되어 제공된다.
  -->
 <c:out value="${ link }" escapeXml="false"/>
</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>