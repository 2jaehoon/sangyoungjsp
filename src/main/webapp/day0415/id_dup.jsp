<%@page import="java.sql.SQLException"%>
<%@page import="day0415.IpDupDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="중복 확인"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="http://211.63.89.149/jsp_prj/common/main_v20230217.css"/> 
<style type="text/css">

#wrap{
width:400px; height:400px; margin:0px auto; /* background-color:#FF0000; */
}

</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">
$(function(){
	
	$("#btn").click(function(){
		if( $("#id").val() == "" ){
			alert("아이디 필수 입력");
			
			return;
		}//end if
		$("#frm").submit();// id_dup.jsp Post방식으로 요청

	});//click
	
});//ready

function sendId( id ){
	opener.window.document.frm.id.value=id;
	self.close();
}//sendId


</script>
</head>
<body>


<div id="wrap"> <!-- wrap(w:1000 h:1200) -->

<form  action="id_dup.jsp" method="post" name="frm" id="frm">
<h2>아이디 중복 확인</h2>
<label>아이디</label>
<input type="text"  autofocus="autofocus" name="id" id = "id" class="inputBox" style="width: 250px" />
<input type="button" value="중복 확인" class="btnBorder" id="btn" />

</form>
<%
String id = request.getParameter("id");
if( ("POST").equals(request.getMethod()) && !"".equals(id) ){
	
	
	IpDupDAO idDAO = new IpDupDAO();
	try{	
	String resultId = idDAO.selectId(id);
	
%>
<div id = "searchResult">
<%if( "".equals(resultId) ){ //검색된 아이디가 없는 상황 아이디 사용가능%>
	입력하신 <span style="font-weight: bold; color:#0142BA; font-size: 20px"><%= id %></span>는 사용가능합니다<br>
	<a href="#void" onclick="sendId( ' <%=id %>' )">사용하기</a>
<%}else{ //검색된 아이디가 있는 상황 아이디 사용 불가%>
	입력하신 <span style="font-weight: bold; color:red; font-size: 20px"><%= id %></span>는 불가능합니다<br>
다른 아이디를 입력해보세요.
<%} %>


</div>
<%

}catch(SQLException se) {
	se.printStackTrace();
	%>
	아이디 중복확인 중 문제가 발생했습니다. 
	<br>다시 시도해주세요.
	<%
}//end catch	

}//end if
%>


</div>

</body>
</html>