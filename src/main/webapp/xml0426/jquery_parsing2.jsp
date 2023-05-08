<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="여러 노드의 파싱"
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

<!-- bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<!-- bootstrap 끝-->

<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$.ajax({
			url : "http://localhost/jsp_prj/xml0425/map_xml.jsp",
			type : "post",
			dataType : "xml",
			error : function( xhr ){
				alert( xhr.status )
			},
			success : function( xml ){
				//유일한 노드<errFlag>, <resultCnt>
				var flag = $( xml ).find( "errFlag" ).text();
				//파싱한 데이터는 문자열
				if( Boolean(flag) ){//Boolean 내장함수를 사용하면 문자열을 Boolean형으로casting
					//반복 노드
					var output = "<table class='table table-bordered'>"
					+"<tr><th>번호</th><th>위도</th><th>경도</th><th>식당명</th><th>소개</th></tr>";
					
				$( xml ).find("map").each(function(idx, mapNode) {
					output+="<tr>";
					output+="<td>" + $(mapNode).find("numNode").text() + "</td>";
					output+="<td>" + $(mapNode).find("latNode").text() + "</td>";
					output+="<td>" + $(mapNode).find("lngNode").text() + "</td>";
					output+="<td>" + $(mapNode).find("restNameNode").text() + "</td>";
					output+="<td>" + $(mapNode).find("infoNode").text() + "</td>";
					output+="</tr>";
						
					});//each
					
					$("#output").html( output );
					}else{
						alert("데이터를 로딩하는 중 문제가 발생");
					}//end else
			}//success
			
		});//ajax
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
<input type="button" value="클릭"  id="btn" class="btn btn-success"/>
<input type="button" value="클릭2"  id="btn2" class="btn btn-warning"/>
<div id="output"></div>
</div>



<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>