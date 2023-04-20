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
	$("#btn").click(function(){
		var deptno = $("#deptno").val();
		//유효성 검증
		if( deptno.replace( / /g,"" )=="" ){
			alert("부서 번호는 필수 입력입니다.");
			$("#deptno").val("");
			return;
		}//end if
		// /g-모든 문자열 : 범위를 가지지 않는다. => 범위[시작문자-끝문자]
		//alert( deptno.replace( /[a-zA-Z0-9ㄱ-힣]/g,"" ) );
		//숫자만 입력받고 싶다. => 값에서 숫자만 쳐내고 값이 있다면 
		if( deptno.replace( /[0-9]/g,"" )!= "" ){
			alert("부서 번호는 숫자만 입력가능 합니다.");
			$("#deptno").val("");
			$("#deptno").focus();
			return;
		}//end if
		
		var jsonParam = { deptno : deptno };
		
		$.ajax({
			url : "data_jsonobj_combi.jsp",
			data : jsonParam,
			type : "POST",
			dataType : "json",
			error : function( xhr ){
				alert("서버에서 문제 발생");
				console.log( xhr.status + " / " + xhr.statusText );
			},
			success : function( jsonObj ){
				//JSONObject Parsing 문법 : 객체명.이름
				
				//html은 입력값이 태그를 가지고 있으면 해석 text는 그 자체로 보여준다.
				$( "#searchDate" ).html( jsonObj.searchDate );
			
			if( jsonObj.resultFlag ){
				//JSONArray 받기
				var ja = jsonObj.empData;
				
				var createTr = "";
				
				if($("#empTab tr").length > 1){
					$("#empTab > tbody").last().empty();
				}//end if
				
				$.each(ja, function(i,ele){
					createTr += "<tr><td>" +
					ele.empno + "</td><td>"+
					ele.ename + "</td><td>"+
					ele.job + "</td><td>"+
					ele.sal + "</td><td>"+
					ele.deptno + "</td><td>"+
					ele.hiredate + "</td></tr>";
				});//end each
				if ( jsonObj.dataSize==0 ){//검색된 데이터 없음
					createTr = "<tr><td conspan='6'>" + $("#deptno").val() + "번 부서의 검색된 사원 정보가 없습니다.</td></tr>";
				}//end if
					
					$("#empTab:last").append( createTr );
					$("#deptno").val("");
				
			}else{
				
				
				}//end else
					
			}//success
			
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
<form action="">
<h2>부서 번호를 입력하시면 사원 정보를 검색</h2>
<label>부서 번호</label><input type="text"  id="deptno" name="deptno"  autofocus="autofocus" class="inputBox" style="height: 35px; border-radius: 5px" />
<button type="button" class="btn btn-outline-dark" id="btn">검색</button>
<div style="height: 30px">
<span id="empWarn" style="font-weight: bold; color: #ff0000" ></span>
</div>
</form>

<div style="width: 740px">
<div>검색일 : <span id="searchDate"></span></div>
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