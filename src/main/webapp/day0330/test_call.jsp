<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="jsp 호출 연습" %>
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
$(function(){
	$("#requestBtn").click(function(){
		alert('입력값에 대한 유효성 검증이 성공하면 ');
		/* //1. 폼태그를 얻기(js을 사용한 요청)
		var obj= window.document.frm;
		//2 폼에서 제공하는 submit 수행
		obj.submit(); */
		//1. 폼 태그 얻고 submit 수행(jQuery를 사용한 요청)
		$("#frm").submit();
		
	})//request
})//ready

function requestJSP(){
	//JavaScript의 location 객체를 사용
	location.href="http://localhost/jsp_prj/day0330/call.jsp";
}

function postReq(){
	//1. 폼 태그를 얻기
	var obj = document.postFrm;
	//2. submit
	alert("유효성 검사 후 요청");
	obj.submit();
}

$(function(){
	$("#postFrm").click(function(){
		$("#postFrm").submit();
	});//click
});//ready

</script>
</head>
<body>


<div id="wrap"> <!-- wrap(w:1000 h:1200) -->


<div id="header"><!-- header(w:1000 h:200) -->
	<div id="logo">Class 4</div>
	<div id="naviBar">naviBar(w:1000 h:60)</div>
</div>


<div id="container">container(w:1000 h:900)

<div>
<strong>GET방식의 요청</strong><br>
1. 링크 사용<br>
<a href="call.jsp" >상대 경로 링크 요청</a>
<a href="http://localhost/jsp_prj/day0330/call.jsp" >URL 링크 요청</a>
</div>

<div>
2. FORM 태그의 submit을 사용<br>
<!-- action  속성은 이동할 페이지의 url이 들어간다. -->
<form action="http://localhost/jsp_prj/day0330/call.jsp" >
<input type="submit" value="submit을 사용한 폼 요청"  class="btnBorder" />
</form>

<form action="http://localhost/jsp_prj/day0330/call.jsp" name="frm" id="frm">
<input type="button" value="JS submit() 함수를 사용한 폼 요청(권장)"  class="btnBorder" id="requestBtn" />
</form>

<br>
3. JavaScript의 location을 사용한 페이지 이동<br>
<a href="javascript:requestJSP()">js의 location이동</a>
</div>
<br>

<div style="border: 1px solid #222; width: 400px; height: 200px"></div>
<span style="color: #ff0000; font-size: 20px ">post방식의 요청</span>
<br>
<!-- post방식으로 요청하려면 form태그의 method 속성 값이 post가 되어야 한다. -->
<form name="postFrm" id="postFrm" action="http://localhost/jsp_prj/day0330/call.jsp"  method="POST">
<input type="button" value="JS post 요청" onclick="postReq()" class="btnBorder"  />
<input type="button" value="jQuery post 요청" class="btnBorder"  id="postBtn" />
</form>
</div>




<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>