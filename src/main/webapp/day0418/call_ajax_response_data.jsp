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
<!-- bootstrap 끝-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- bootstrap 끝-->

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">
$(function(){
	$("#btnHTML").click(function(){
		//AJAX 호출
		//success 안에는 파라메터 이름을 뭐든 괜찮다.
		
		//HTML은 정적이다.
		$.ajax({
			url : "response_html.jsp",
			type : "GET",
			dataType : "html",
			error : function( xhr ){
				alert('에러 발생 : ' + xhr.status + ", " + xhr.statusText );				
			},
			success : function( html ){
				$("#resultDiv").html( html );
				$("#text").val( html );// 폼 컨트롤에도 넣을 수 있다.
			}
		})//ajax
		
	})//click
	
	$("#btnTEXT").click(function(){
		$.ajax({
			url : "response_text.jsp",
			type : "POST",
			dataType : "text",
			error : function( xhr ){
				console.log( xhr.status + " / " + xhr.statusText );
			},
			success : function( text ){
				$("#resultDiv").html( "서버에서 받아온 문자열 : " + text );
				$("#text").val( text );// 폼 컨트롤에도 넣을 수 있다.
			}
		})//ajax
		
	})//click
	
	$("#btnXML").click(function(){
		$.ajax({
			url : "response_xml.jsp",
			type : "POST",
			dataType : "xml",  //"text", xml의 태그 내용을 보고 싶을 때에는 text로 dataType으로 바꾸면 된다. 혹은 아래와 같이 변수로 설정하면 된다.
			error : function( xhr ){
				alert( xhr.status + " / " + xhr.statusText );
			},
			success : function( xml ){
				var msg = $( xml ).find( "msg" ).text();
				$("#resultDiv").html( "서버에서 받아온 문자열 : " + msg );
				$("#text").val( msg );// 폼 컨트롤에도 넣을 수 있다.
			}
		})//ajax
		
	})//click
	
	$("#btnJSON").click(function(){
		$.ajax({
			url : "test_json_obj.jsp",
			type : "GET",
			dataType : "JSON",
			error : function( xhr ){
				alert( xhr.status + " / " + xhr.statusText );
			},
			success : function( jsonObj ){
				var output = "이름 : " + jsonObj.name + "<br>" //이렇게 잘라서 쓰는 것을 파싱이라고 함
								+ "나이 : " + jsonObj.age + "<br>"
								+ "주소 : " + jsonObj.addr + "<br>"
							$("#resultDiv").html( output );
								
							var output2 = jsonObj.addr + "에 살고 있는 " + jsonObj.age	+ "세 " + 
							jsonObj.name + "님은 쌍용교육센터 반장입니다.";
							
							
							$("#name").html( jsonObj.name );
							$("#data").html( output2 );
			}
		
		})//ajax
		
	})//click
	
});//ready

</script>
</head>
<body>


<div id="wrap"> <!-- wrap(w:1000 h:1200) -->


<div id="header"><!-- header(w:1000 h:200) -->
	<div id="logo">Class 4</div>
	<div id="naviBar">naviBar(w:1000 h:60)</div>
</div>


<div id="container">
<div>
<button type="button" class="btn btn-outline-secondary" id="btnHTML">HTML 요청</button>
<button type="button" class="btn btn-outline-success" id="btnTEXT">TEXT 요청</button>
<button type="button" class="btn btn-outline-danger" id="btnXML">XML 요청</button>
<button type="button" class="btn btn-outline-warning" id="btnJSON">JSON 요청</button>
</div>

<div id="resultDiv"></div>
<input type="text" class="form-control" style="width: 350px; margin-top: 100px" id="text" />

<div class="card" style="width: 18rem;">
  <img src="../common/images/tae.png" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title" id="name">Card title</h5>
    <p class="card-text" id="data">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>

</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>