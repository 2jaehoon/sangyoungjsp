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

/* #container{ height:900px; /* background-color:#23A9FF;  height고정position:relative;}    height고정 */
#container{ min-height:900px; /* background-color:#23A9FF; */position:relative;} /*  height 늘어남*/


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
	$("#btn").click(function(){
		
		$.ajax({
			url : "data_jsonarr.jsp",
			dataType : "JSON",
			error : function( xhr ){
			alert("제송합니다")
			console.log( xhr.status );
			},
			success : function( jsonArr ){
				var tbody="";
				
				let cnt = 0;
				//tr이 하나 이상이면 넣지 않는다.
				
				
				
				if( $("#empTab tr").length<2 ){
				
				$.each( jsonArr, function(idx, jsonObj) {
					cnt++;
				tbody+="<tr><td>"+
				jsonObj.empno+"</td><td>"+
				jsonObj.ename+"</td><td>"+
				jsonObj.job+"</td><td>"+
				jsonObj.sal+"</td><td>"+
				jsonObj.deptno+"</td><td>"+
				jsonObj.hiredate+"</td></tr>";
				});//each
				
				if( cnt==0 ){
					tbody="<tr><td colspan='6'>모든 사원이 퇴사하였습니다.</td></tr>";
				}//end if
				
				
				}//end if
				
				 $("#empTab:last").append( tbody ); 
				
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
<h2>모든 사원 정보 검색</h2>

<button type="button" class="btn btn-outline-dark" id="btn">검색</button>
<div style="height: 30px">
<span id="empWarn" style="font-weight: bold; color: #ff0000" ></span>
</div>

<div style="width: 740px">
<table class="table table-hover" id="empTab">
<thead>
<tr>
<th style="width: 80px">사원 번호</th>
<th style="width: 150px">사원명</th>
<th style="width: 150px">직무</th>
<th style="width: 120px">연봉</th>
<th style="width: 80px">부서번호</th>
<th style="width: 160px">입사일</th>
</tr>
</thead>
</table>
</div>



</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>