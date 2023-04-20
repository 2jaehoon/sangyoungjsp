<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = " html form control을 제공하는 페이지"  %>
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
var cnt=0;
function addDiv(){
	if( cnt>3 ){ alert("5개까지만 추가 가능");
	return;}
	var output = "<div><label>취미</label>" +
	'<input type="text" name="hobby" class="inputBox" /></div>';
	
	$("#data").append(output);
	cnt++;
}

function removeDiv(){
	$("#data div:last").remove();
	cnt--;
	if(cnt<0){
		cnt=0;
	}
}

$(function(){
	$("#getBtn").click(function(){
		$("#getFrm").submit();
	});	
	$("#postBtn").click(function(){
		$("#postFrm").submit();
	});
});
</script>
</head>
<body>


<div id="wrap"> <!-- wrap(w:1000 h:1200) -->


<div id="header"><!-- header(w:1000 h:200) -->
	<div id="logo">Class 4</div>
	<div id="naviBar">naviBar(w:1000 h:60)</div>
</div>


<div id="container">container(w:1000 h:900)
<h2> get 요청</h2>
<form action="parameter_values_form_process.jsp" method="get" id= "getFrm" >
<label>이름</label>
<input type="text" name="name" class="inputBox"/><br>
<label>취미</label>
<input type="checkbox" name="hobby" value="유튜브"/>유튜브<br>
<input type="checkbox" name="hobby" value="코딩"/>코딩<br>
<input type="checkbox" name="hobby" value="조기축구"/>조기축구<br>
<input type="checkbox" name="hobby" value="등산"/>등산<br>
<input type="checkbox" name="hobby" value="노래"/>노래<br>
<input type="button" class="btnBorder" id= "getBtn"  value="전송"/><br>
</form>

<h2> post 요청</h2>
<form action="parameter_values_form_process.jsp" method="post" id= "postFrm" >
<label>이름</label>
<input type="text" name="name" class="inputBox"/><br>
<label>취미</label>
<input type="checkbox" name="hobby" value="유튜브"/>유튜브<br>
<input type="checkbox" name="hobby" value="코딩"/>코딩<br>
<input type="checkbox" name="hobby" value="조기축구"/>조기축구<br>
<input type="checkbox" name="hobby" value="등산"/>등산<br>
<input type="checkbox" name="hobby" value="노래"/>노래<br>

<div id="controlImg">
<a href="javascript:addDiv()"><img alt="추가" src="images/add.png" title="추가"></a>
<a href="javascript:removeDiv()"><img alt="삭제" src="images/remove.png" title="삭제"></a>
</div>

<div id="data">
<label>취미</label>
<input type="text" name="hobby" class="inputBox" />
</div>

<input type="button" class="btnBorder" id= "postBtn"  value="전송"/><br>
</form>





</div>




<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>