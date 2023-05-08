<%@page import="java.util.List"%>
<%@page import="org.jdom2.Element"%>
<%@page import="java.net.URL"%>
<%@page import="org.jdom2.Document"%>
<%@page import="org.jdom2.input.SAXBuilder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="같은 서버에 존재하는 XML Parsing"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="http://localhost/jsp_prj/common/main_v20230217.css"/> 

<!-- 부트 스트랩 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- 부트 스트랩 끝 -->

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
//1. 파서 객체 생성
SAXBuilder builder = new SAXBuilder();
//2. XML과 연결하여 문서 객체 저장
Document doc = builder.build(new URL( "http://localhost/jsp_prj/xml0425/map_xml.jsp" ));
//3. 최상위 부모 노드 얻기
Element rootNode = doc.getRootElement();
// out.println( "부모노드 : " + rootNode ); // HTML의 DTD에 XML 노드가 존재하지 않아서
//WEB browser가 그릴 수 없다.
// System.out.println( "부모노드 : " + rootNode );
// 4. 자식 노드 얻기 : 정보를 가진 노드
Element errFlagNode = rootNode.getChild("errFlag");
Element resultCntNode = rootNode.getChild("resultCnt");
boolean flag = Boolean.parseBoolean( errFlagNode.getText() );
%>
검색 결과 <%= !flag? "에러 없음":"에러 발생" %><br>
<% if( !flag ) {%>
검색 건수 : <%= resultCntNode.getText() %> 건<br>
<%
}


//4. 자식 노드들 얻기 : 값을 가진 노드들
List<Element> mapNodes = rootNode.getChildren("map");

//5. 자식 노드들에서 원하는 값을 얻어 출력

%>
<div style="width: 800px">
<table class="table table-dark table-striped">
<thead>
<tr>
<th style="width: 80px">번호</th>
<th style="width: 150px">위도</th>
<th style="width: 150px">경도</th>
<th style="width: 200px">식당명</th>
<th style="width: 400px">정보</th>
</tr>
</thead>
<tbody>
<% if( mapNodes.isEmpty() ){ %>
<tr>
<td colspan="5">입력된 식당 정보가 존재하지 않습니다.</td>
</tr>
<%}//end if %>
<%
Element numNode=null;
Element latNode=null;
Element lngNode=null;
Element restNameNode=null;
Element infoNode=null;
for(Element mapNode : mapNodes){
	numNode = mapNode.getChild("numNode");
	latNode = mapNode.getChild("latNode");
	lngNode = mapNode.getChild("lngNode");
	restNameNode = mapNode.getChild("restNameNode");
	infoNode = mapNode.getChild("infoNode");
	%>
	<tr>
	<td><%= numNode.getText() %></td>
	<td><%= latNode.getText() %></td>
	<td><%= lngNode.getText() %></td>
	<td><%= restNameNode.getText() %></td>
	<td><%= infoNode.getText() %></td>
	</tr>
	<%
}
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