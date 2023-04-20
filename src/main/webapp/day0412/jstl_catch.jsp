<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
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


<div id="container">container(w:1000 h:900)
<c:catch var="e"><!-- 아래의 코드에서 예외가 발생하면 e변수에 예외발생객체의 주소가 할당 -->
<%
if(new Random().nextBoolean() ){//예외 발생 예상 코드
	//아래의 코드에서 에러가 발생되지 않는 이유는? => _jspService 떄문에
	throw new Exception("강제로 발생된 예외");
}
//out.println("정상적인 상태의 응답될 코드 정의<br>");
//}catch(Exception e){
//out.println("예외발생시 응답될 코드 정의<br>");
//}
%>
정상적인 상태의 응답 코드<br>
<img alt="" src="../common/images/naver.png" />
</c:catch>

<c:if test="${ not empty e }">
문제가 발생했을 때 응답할 코드 정의<br>
<!-- 예외의 정보가 매우 제한적이다. 이유만 나온다. -->
<% 
//자세한 에러의 이유를 확인하려면 코드를 달리하여 try~catch 사용한다.
//e.printStackTrace(); 
%>
<c:out value="${  e }"/>
</c:if>

</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>