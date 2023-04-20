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
<!-- bootstrap 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- bootstrap 끝 -->


<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">
$(function(){
	$("#query").click(function(){
		
		var name = $("#name").val();
		var age = $("#age").val();
		//서버로 보내기 위한 QueryString 생성
		var queryString = "name="+name+"&age="+age;
		//만들어진 queryString은 data 속성에 넣어서 보낸다.
		$.ajax({
			url : "querystring.jsp",
			data : queryString, //변수에 담아서 넣음
			type : "GET", //포스트 사용시 UTF-8로
			dataType : "JSON",
			error : function( xhr ){
			// 404 : URL이 잘못된 경우, 500 : JSP 코딩 에러
			// 200 : 원래는 성공이나 AJAX에서는 응답은 성공했으나 응답된 데이터가
			// 		  사용할 수 없는 데이터 형식( dataType에 맞지 않는다. )
				alert( xhr.status + " / " + xhr.statusText );
			},
			success : function( jsonObj ){
				alert( jsonObj );
			}
		})//ajax
	
		
	})//click
	
	$("#json").click(function(){
		
		var name = $("#name").val();
		var age = $("#age").val();
		
		//서버로 보내기 위한 JSONObject 생성
		var paramJsonObj = { name: name, age: age };
		//만들어진 queryString은 data 속성에 넣어서 보낸다.
		$.ajax({
			url : "querystring.jsp",
			data : paramJsonObj, //변수에 담아서 넣음
			type : "GET", //포스트 사용시 UTF-8로
			dataType : "JSON",
			error : function( xhr ){
			// 404 : URL이 잘못된 경우, 500 : JSP 코딩 에러
			// 200 : 원래는 성공이나 AJAX에서는 응답은 성공했으나 응답된 데이터가
			// 		  사용할 수 없는 데이터 형식( dataType에 맞지 않는다. )
				alert( xhr.status + " / " + xhr.statusText );
			},
			success : function( jsonObj ){
				alert( jsonObj );
			}
		})//ajax
		
	})//click
	
})//ready
</script>
</head>
<body>


<div id="wrap"> <!-- wrap(w:1000 h:1200) -->


<div id="header"><!-- header(w:1000 h:200) -->
	<div id="logo">Class 4</div>
	<div id="naviBar">naviBar(w:1000 h:60)</div>
</div>


<div id="container">
<h1>파라메터 전송</h1>
<button type="button" class="btn btn-success btn-lg" id="query" >QueryString 요청</button>
<button type="button" class="btn btn-warning btn-lg" id="json" >JSON Object 요청</button>

<div>
<form>
<label>이름</label><input type="text" name="name" id="name" class="inputBox" /><br>
<label>나이</label><input type="text" name="age" id="age" class="inputBox" /><br>
</form>
</div>

</div><!-- 컨테이너 div -->


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>