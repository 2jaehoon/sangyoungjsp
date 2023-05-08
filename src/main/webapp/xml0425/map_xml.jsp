<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="day0420.MapVO"%>
<%@page import="java.util.List"%>
<%@page import="day0420.MapDAO"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    info="DB table 조회하여 web browser에 XML로 출력"
    %><%
    //1. 문서객체 생성 : Document
    Document doc = new Document();
    //2. 최상위 근노드 : Element
    Element mapRootNode = new Element("maps");
    //DBMS 연동하는 작업///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    MapDAO mDAO = new MapDAO();
    boolean exceptionFlag = false;
    List<MapVO> list = null;
    
    try{
    	list=mDAO.selectAllRestaurent();
    	exceptionFlag = true;
    }catch(SQLException se){
    	se.printStackTrace();
    }//end catch

    //검색한 결과의 부가 정보를 생성
	Element errFlag = new Element("errFlag");
    errFlag.setText(String.valueOf( !exceptionFlag ) );
	Element resultCnt = new Element("resultCnt");
	resultCnt.setText(Integer.toString(list.size() )  );//예외가 발생하면 null이 들어간다.
    //부모 노드에 검색 정보를 설정
    mapRootNode.addContent(errFlag);
    mapRootNode.addContent(resultCnt);
    
    //3. 자식 노드를 생성 : Element
    Element mapNode = null;
    Element numNode = null;
    Element latNode = null;
    Element lngNode = null;
    Element restNameNode = null;
    Element infoNode = null;
    for( MapVO mVO : list ){//검색 결과를 가지고 노드를 생성
    	mapNode = new Element("map");
    //mapnode는 조회된 결과 값을 가진 자식 노드를 사진다.
    	numNode = new Element("numNode");
    	numNode.setText(String.valueOf(mVO.getNum()) );
    	
        latNode = new Element("latNode");
        latNode.setText(String.valueOf(mVO.getLat()) );
    	
        lngNode = new Element("lngNode");
        lngNode.setText(String.valueOf(mVO.getLng()) );
    	
        restNameNode = new Element("restNameNode");
        restNameNode.setText(String.valueOf(mVO.getRest_name()) );
    	
        infoNode = new Element("infoNode");
        infoNode.setText(String.valueOf(mVO.getInfo()) );
    	//값을 가진 노드가 자식 노드 배치
    	mapNode.addContent(numNode);
    	mapNode.addContent(latNode);
    	mapNode.addContent(lngNode);
    	mapNode.addContent(restNameNode);
    	mapNode.addContent(infoNode);
    
    //4. 자식 노드를 부모 노드에 배치
    mapRootNode.addContent(mapNode);
    
    }
    //5. 부모 노드를 문서 객체 배치. addContent(), setRootElement()
    doc.setRootElement(mapRootNode);
    //6. 출력
    XMLOutputter xOut  = new XMLOutputter( Format.getPrettyFormat() );
	xOut.output(mapRootNode, out);
    %>
