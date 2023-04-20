<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.sql.SQLException"%>
<%@page import="day0415.InjectionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
if("<%=request.getMethod()  %>"=="GET"){
	alert("정상적인 방식으로 요청하지 않으셨습니다.");
	location.href="http://localhost/jsp_prj/day0414/insert_frm.jsp";
}

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
if( "POST".equals(request.getMethod()) ){
	 %>
<jsp:useBean id="iVO" class="day0415.InjectionVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="iVO"/><!-- 모든 인풋으로 값을 넣어준다. -->
<%
iVO.setIp(request.getRemoteAddr());


//입력된 값 중 일방향 해쉬와 복호화가 가능해야하는 데이터를 구분하여
//암호화작업을 수행
iVO.setPass(DataEncrypt.messageDigest("MD5", iVO.getPass() ));
DataEncrypt de = new DataEncrypt("Hssi9l1l94rq4WfpjxLV4iVhJ4480D2jqRvfdw");
iVO.setName(de.encryption(iVO.getName()));

InjectionDAO iDAO = new InjectionDAO();
try{
iDAO.insertInjection(iVO);//DB table에 추가 작업
%>
<span style="font-weight: bold; font-size: 20px">
<c:out value="${ param.id  }"/>
</span>( <c:out value="${ param.name  }"/> )님 입력해주셔서 감사합니다.<br>
입력해 주신 자료는 안전하게 보관하며, 사용이 끝나는 즉시 저장하지 않고 폐기하겠습니다.
<%
}catch(SQLException se){
	se.printStackTrace();
	%>
	<c:out value="${ param.id  }"/>는 이미 사용중이므로 다른 아이디를 입력해주세요.<br>
	<a href="#void" onclick="history.back()">뒤로</a>
	<%
}//end catch
}//end if
%>







</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>