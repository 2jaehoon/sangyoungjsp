<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="파일 업로드 처리 페이지"
    %>
    <%
request.setCharacterEncoding("UTF-8");
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


<div id="container">

<%
//파일 업로드는 최대 500mb까지 가능하나. 실제로는 10mb까지만 가능
//업로드된 파일이 10mb를 초과하면 업로드 후 파일크기를 비교하여 파일을 삭제하는 코드를 작성해보세요.


//1. 저장 디렉토리를 설정
File saveDirectory = new File("E:/dev/workspace/jsp_prj/src/main/webapp/upload/"); 
int size = 1024*1024*10;
int maxSize = 1024*1024*500;
//2. FileUpload Component 생성(MultipartRequest) => 생성함과 동시에 파일이 업로드된다.
MultipartRequest mr = new MultipartRequest(request, saveDirectory.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy() );
//3. 파일 업로더 컴포넌트를 사용하여 파라메터를 받는다.


String name = mr.getParameter("uploader");
String age = mr.getParameter("age");
//input type="file"은 파라메터로 넘어오지 않는다.
String originalName = mr.getOriginalFileName("file");
String newFileName = mr.getFilesystemName("file");


/* File uploadFile = mr.getFile("file"); */
 File uploadFile = new File( saveDirectory.getAbsolutePath() + "/" + newFileName );
System.out.print(uploadFile);
if (uploadFile.length() > size) {
	uploadFile.delete();
    %>
    파일은 10MB까지만 업로드가 가능합니다. 파일 크기를 줄여주세요.
    <%
}else{
%>
업로드 성공<br>
업로더 : <strong><%= name %></strong><br>
나이 : <strong><%= age %></strong><br>
파일명 : 새로운 이름 : <%= newFileName %>, 변경 전 파일명 : <%= originalName %><br>
<a href="../day0417/file_list.jsp">업로드된 파일 목록</a>
<%
}//end else

%>



</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>