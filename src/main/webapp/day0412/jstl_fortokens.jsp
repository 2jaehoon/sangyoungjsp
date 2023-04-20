<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="CSV데이터 자르기"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"  href="http://localhost/jsp_prj/common/main_v20230217.css"/>

<style type="text/css">

#wrap{ width: 1000px; height: 1200px;margin: 0px auto; }
#header{  height: 200px; position: relative; background: #FFFFFF url(http://localhost/jsp_prj/common/images/header_bg.png)  repeat-x;}

#logo{ position:absolute;top: 40px;left:100px; width: 150px; font-weight: bold; font-size: 40px;   font-family: 고딕 ;}   
#naviBar{ position:absolute;top:140px;left:0px;height: 60px }    
#container{ height: 900px;position: relative; }    

#footer{ height: 100px;position: relative;  }    
#flogo{ position:absolute;top:20px;left:100px;height: 60px;font-weight: bold; font-size: 20px; font-family: 고딕 ; color:#d7d7d7; text-align: right; width:100%;  }    

</style>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<script type="text/javascript">

   
});//ready

</script>

</head>
<body>

<div id="wrap">

   <div id="header">
      <div id="logo">Class 4.</div>
      <div id="naviBar">navi ( 1000 x 60)</div>
   </div>
   
   <div id="container">
   <%
   String csvData="지하식당,짜장면,순대국밥.대구탕,도시락,제육볶음,돈까스,라멘,마라탕.알탕";
   
   String select="제육볶음";
   
   pageContext.setAttribute( "csvData", csvData );//EL에서 값을 사용하기 위해서
   pageContext.setAttribute( "select", select );//EL에서 값을 사용하기 위해서
   %>
   <%-- 
   var="CSV데이터하나가 저장될 변수명" 
   items="${ 사용할 scope 객체의 이름 }"
   delims="읽어들인 데이터를 자를 문자"--%>
   
   <c:forTokens var="csv" items="${ pageScope.csvData }" delims=",.">
      <input type="radio" name="lunch" value="${ csv }" ${ pageScope.select eq csv?"checked":""}/>
                                           <%-- 이걸로도 사용 가능<c:if test="${ pageScope.select eq csv }">checked</c:if> />--%>
      <c:out value="${ csv }"/>
   </c:forTokens>
   </div>
   
   
   <div id="footer">footer ( 1000 x 100)
      <div id="flogo"> Copyright &copy; Class 4. All rights reserved.</div>
   </div>
   
</div>

</body>
</html>



    