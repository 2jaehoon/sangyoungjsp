<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="쿠키 읽기"
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

<%
//1. 쿠키들 읽기 : JSESSIONID는 접속한 웹 브라우저를 식별하기 위한 id
Cookie[] cookies = request.getCookies();

	boolean cookieFlag = false;
if(cookies != null){
	//쿠키가 있음으로 쿠키 읽기
	Cookie readCookie = null;
	%>
	<ul>
<%	
	String cookieName = "";
	
	for(int i=0; i<cookies.length; i++){
		readCookie = cookies[i];
		cookieName = readCookie.getName();
		if(!"JSESSIONID".equals(cookieName)){
			cookieFlag = true;//쿠키가 존재함
		%>
		<li>
		쿠키명 : <%= readCookie.getName() %>,
		쿠키값 : <%= readCookie.getValue() %>
		</li>
		
		<%
		}//end if
	}//end for
}
if(!cookieFlag){
			out.println("<li>쿠키 없음</li>");
			out.println("<li><a href='add_cookie.jsp'>쿠키 심기</a></li>");
}else{
	%>
	<li>쿠키 있음 => <a href="remove_cookie.jsp">쿠키 삭제</a></li>
	<%
}//end else
%>
</ul>
</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>

</div>

</body>
</html>