<%@page import="java.util.List"%>
<%@page import="org.jdom2.Element"%>
<%@page import="java.net.URL"%>
<%@page import="org.jdom2.Document"%>
<%@page import="org.jdom2.input.SAXBuilder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="http://localhost/jsp_prj/common/main_v20230217.css"/>
<style type="text/css">
#wrap{ width: 1000px; height: 1200px;margin: 0px auto; }
#header{  height: 200px; position: relative;
	background: #FFFFFF url(http://localhost/jsp_prj/common/images/header_bg.png)  repeat-x;}

#logo{ position:absolute;top: 40px;left:100px; width: 150px; font-weight: bold; font-size: 40px;
	font-family: 고딕 ;}	
#naviBar{ position:absolute;top:140px;left:0px;height: 60px }	 
#container{ height: 900px;position: relative; }	 

#footer{ height: 100px;position: relative;  }	 
#flogo{ position:absolute;top:20px;left:100px;height: 60px;font-weight: bold; font-size: 20px;
	font-family: 고딕 ; color:#d7d7d7; text-align: right; width:100%;  }	 

</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">

</script>

<!-- bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<!-- bootstrap 끝-->
<style type="text/css">

a{ text-decoration: none; font-size:20px}
</style>
</head>
<body>
<div id="wrap"> 
<div id="header">  
	<div id="logo">Class 4.</div>
	<div id="naviBar">navi ( 1000 x 60)</div>
</div>
<div id="container">
<%
String[] titles={"속보","정치","경제","사회","국제","문화","연예","스포츠",
		"풀영상","뉴스랭킹","뉴스룸","상암동 클라스","정치부회의"}; 
String[] urls={"newsflash","politics",	"economy",	"society",
		"international",	"culture",	"entertainment",	"sports",
		"fullvideo",	"newsrank",	"newsroom",
		"morningand","politicaldesk"}; 
			
%>
<table class="table">
<tr>
<%for(int i=0 ; i < titles.length; i++){ %>
<th><a href="jtbc_rss.jsp?url=<%=urls[i] %>"><%= titles[i] %></a></th>
<%}//end for %>
</tr>
</table>
<div>
<c:if test="${ not empty param.url }">
<%
String url="https://fs.jtbc.co.kr/RSS/"+request.getParameter("url")+".xml";
// System.out.println( url );
//1. builder 생성
SAXBuilder builder = new SAXBuilder();
//2. xml문서객체 얻기
Document doc = builder.build(new URL( url ));
//3. 최상위 부모 노드 얻기
Element rssRootNode = doc.getRootElement();
Element channelRootNode = rssRootNode.getChild("channel");
//4. 자식 노드 얻기
Element categoryNode = channelRootNode.getChild("category");
Element pubDateNode = channelRootNode.getChild("pubDate");
%>
<div>
<h2><strong><%= categoryNode.getText() %></strong>(<%= pubDateNode.getText() %>)</h2>
</div>
<%
//  자식 노드들 얻기
List<Element> itemNodes = channelRootNode.getChildren("item");

//5. 반복
Element titleNode = null;
Element linkNode = null;
Element descNode = null;
Element dateNode = null;
for( Element itemNode : itemNodes ){
	 titleNode = itemNode.getChild("title");
	 linkNode = itemNode.getChild("link");
	 descNode = itemNode.getChild("description");
	 dateNode = itemNode.getChild("pubDate");
%>
<table class="table table-dark table-striped">
<tr>
<td style="width: 80px">제목</td>
<td  style="width: 350px">
<a href="<%= linkNode.getText() %>" target="black" style="font-size: 12px"><%= titleNode.getText() %></a>
</td>
<td style="width: 80px">작성일</td>
<td style="width: 140px"><%= linkNode.getText() %></td>
</tr>
<tr>
<td style="width: 80px">설명</td>
<td colspan="3" style="width: 570px"><%= descNode.getText() %></td>

</tr>
</table>
<%
}//end for
//6.
%>
</c:if>
</div>
</div>
<div id="footer">footer ( 1000 x 100)
	<div id="flogo"> Copyright &copy; Class 4. All rights reserved.</div>
</div>
</div>
</body>
</html>



    