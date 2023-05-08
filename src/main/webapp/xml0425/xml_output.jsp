<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Document"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP를 요청했을 때 web browser에서 XML로 응답하기"
    trimDirectiveWhitespaces="true"
    %><%
//1. Document  생성
Document doc = new Document();
//2. 최상위 root node(근 노드) 생성
Element rootNode = new Element("names");

String[] names = { "김경태", "김규미", "모민경", "윤상준", "황충연", "박진호"  };

Element nameNode = null;//자식 노드의 값을 저장할 객체
for( int i=0; i<names.length; i++ ){
//3. sub node(자식 노드) 생성, 값 할당
nameNode=new Element("name");
nameNode.setText(names[i]);
//4. 자식 노드를 부모 노드에 배치
rootNode.addContent( nameNode );
}
//5. 부모 노드를 문서 객체에 배치
doc.addContent(rootNode);
//6. 문서 노드를 사용처에 맞게 출력한다
XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
xOut.output(doc, out);//out은 웹 브라우저로 출력하기 위한 내장 객체
%>