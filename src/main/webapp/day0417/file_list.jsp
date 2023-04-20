<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="업로드된 파일의 목록을 테이블로 보여주기"
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

<!-- 부트 스트립 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- 부트 스트랩 끝 -->
</head>
<body>


<div id="wrap"> <!-- wrap(w:1000 h:1200) -->


<div id="header"><!-- header(w:1000 h:200) -->
	<div id="logo">Class 4</div>
	<div id="naviBar">naviBar(w:1000 h:60)</div>
</div>


<div id="container">
<input type="button" value="클릭"  class="btn btn-primary" />
<input type="button" value="클릭"  class="btn btn-outline-warning" />
<button type="button" class="btn btn-warning">
  읽은 사람들 <span class="badge text-bg-secondary">6</span>
</button>
<%
File uploadDir = new File("E:/dev/workspace/jsp_prj/src/main/webapp/upload");
File[] files = uploadDir.listFiles();


%>
<div  style="width: 630px">
<table class="table table-hover">
<thead>

<tr>
<th style="width: 80px">번호</th>
<th style="width: 400px">파일명</th>
<th style="width: 100px">파일 크기(byte)</th>
<th style="width: 150px">업로드 일자</th>
</tr>
</thead>
<tbody>
<%
if( files == null ){//파일이 없음.
	%>
	<tr>
	<td colspan="3" style="text-align: center;">
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="../day0411/images/a.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="../day0411/images/b.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="../day0411/images/ab.png" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
	</td>
	</tr>
	<%
}else{//파일이 존재
	File file = null;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a HH:mm");
	for(int i=0; i<files.length; i++){
		file=files[i];
		%>
		<tr>
		<td><%=i+1 %></td>
		<td>
		<!-- 웹브라우저는 브라우저가 해석할 수 있으면 브라우저 안에서 해석하여 보여주고
		그렇지 않다면 다운로드를 수행
		 -->
		<a href="download.jsp?fileName=<%=file.getName() %>"><%=file.getName() %></a>
		
	
		</td>
		<td><%=file.length() %></td>
		<td><%=sdf.format( new Date(file.lastModified())) %></td>
		</tr>
		<%
	}
	
	
}//end else
%>
</tbody>
</table>
</div>


</div>



<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>