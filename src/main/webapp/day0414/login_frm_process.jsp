<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="day0414.LoginDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="입력값을 받아 암호화를 수행한 후 검색 결과를 받아서 복호화를 한 후 세션에 저장"
    %>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<jsp:useBean id="lVO" class="day0414.LoginVO" scope="page"/>
<jsp:setProperty property="*" name="lVO"/>
<%
System.out.println("============"+lVO);
//웹 파라메터의 아이디와 비밀번호가 존재하는 경우 비밀번호를
if( lVO.getId()==null || "".equals( lVO.getId() ) || lVO.getPass()==null||"".equals( lVO.getPass() ) ){
	response.sendRedirect("login_frm.jsp");
	return;
}
//MD5 알고리즘을 사용하여 일방향 해시로 암호화 수행한다.
//아이디와 비밀번호는 LoginVO를 만들어서 사용할 것.
lVO.setPass( DataEncrypt.messageDigest("MD5", lVO.getPass() ) );
lVO.setIpAddr(request.getRemoteAddr() );
System.out.println("============"+lVO);
//DAO를 사용하여 로그인 작업 수행
LoginDAO lDAO = new LoginDAO();
String name = lDAO.selectLogin(lVO);
if("".equals(name)){//로그인 실패
%>
<img alt="" src="images/img_2.gif"><br>
아이디나 비밀번호를 확인해주세요<br>
다시<a href="login_frm.jsp">로그인</a> 
<%
}else{
	// 로그인 결과로 받은 이름은 암호화된 이름 => 복호화
	DataDecrypt dd= new DataDecrypt("Hssi9l1l94rq4WfpjxLV4iVhJ4480D2jqRvfdw");
	name = dd.decryption(name);
	//이름을 어떤 페이지에서든 사용하기 위해 세션에 설정
	session.setAttribute("sesName", name);
	
	
	session.setMaxInactiveInterval(60);
	
	%>
	<img alt="" src="images/img_1.gif"><br>
	<strong><%=name %></strong>님 로그인 하셨습니다.<br>
	작업페이지로<a href="job.jsp">이동</a> 
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