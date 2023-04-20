<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="사용자가 입력한 값을 받아서 back-end로 전송하기 위한 페이지" %>
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
function sendData(){
	var obj = document.getFrm;
	
	//유효성 검증
	if(obj.domain.selectedIndex==0){
		alert("도메인을 반드시 선택해주세요.");
		return;
	}//end if
	
	//유효성 검증이 완료되면 값을 받아야할 페이지로 값들을 전송한다.
	obj.submit();
	
}//sendData

$(function(){
	$("#postBtn").click(function(){
		$("[name='postFrm']").submit();
	});
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
<span style="font-weight: bold; font-size:25">GET방식의 요청 처리 폼</span><br>
HTML Form Control의 name속성이 유일한 경우의 처리.<br/>
<form action="parameter_form_process.jsp" method="get" name="getFrm" enctype="application/x-www-form-urlencoded" >
<label>이름</label> <input type="text" name="name" class="inputBox" /><br/>
<label>나이</label> <input type="password" name="age" class="inputBox" /><br/>
<label>주소</label> <input type="hidden" name="addr" value="서울시 강남구 역삼동" /><br/>
<label>도메인</label>
<select name="domain">
<option value="none">--도메인 선택--</option>
<option value="daum.net">다음메일</option>
<option value="naver.com">네이버메일</option>
<option value="nate.com">네이트메일</option>
<option value="gmail.com">구글메일</option>
<option value="hotmail.com">핫메일</option>
</select>
<br/>
<label>설명</label>
<textarea rows="5" cols="40" name="info"></textarea>
<br/>
<!-- submit은 유효성 검사를 실패해도 전송됨 -->
<input type="button" value="GET방식전송" class="btnBorder"  onclick="sendData()"/> 
</form>
</div>
<div>
<span style="font-weight: bold; font-size:25">POST방식의 요청 처리 폼</span><br>
HTML Form Control의 name속성이 유일한 경우의 처리.<br/>
<form action="parameter_form_process.jsp" method="post" name="postFrm" >
<label>이름</label> <input type="text" name="name" class="inputBox" /><br/>
<label>나이</label> <input type="password" name="age" class="inputBox" /><br/>
<label>주소</label> <input type="hidden" name="addr" value="서울시 강남구 역삼동" /><br/>
<label>도메인</label>
<select name="domain">
<option value="none">--도메인 선택--</option>
<option value="daum.net">다음메일</option>
<option value="naver.com">네이버메일</option>
<option value="nate.com">네이트메일</option>
<option value="gmail.com">구글메일</option>
<option value="hotmail.com">핫메일</option>
</select>
<br/>
<label>설명</label>
<textarea rows="5" cols="40" name="info"></textarea>
<br/>
<!-- submit은 유효성 검사를 실패해도 전송됨 -->
<input type="button" value="POST방식전송" class="btnBorder" id="postBtn" /> 
</form>
</div>
</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>