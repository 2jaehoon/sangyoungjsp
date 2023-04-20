<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="application/octet-stream"
    pageEncoding="UTF-8"
    info="무조건 다운 로드하기 위한 jsp"
    %>
<%
String fileName = request.getParameter("fileName");
System.out.print(fileName);
if(fileName != null){//파일명에 대한 파라메터가 존재하니?
// 한글 파일명에 대한 처리 : UTF-8 => 8859_1;
		fileName = new String(fileName.getBytes( "UTF-8" ), "8859_1");
		System.out.print(fileName);
}//end if
//1. 다운로드할 파일명을 설정
//다운로드할 파일명이 고정인 경우
//response.setHeader("Content-Disposition", "attachement;fileName=sang.dat");
//다운로드할 파일명이 동적인 경우
response.setHeader("Content-Disposition", "attachement;fileName="+fileName);


if(fileName != null){//파일명에 대한 파라메터가 존재하니?
	// 한글 파일명에 대한 처리 : UTF-8 => 8859_1;
			fileName = new String(fileName.getBytes( "8859_1" ), "UTF-8");
	}//end if


//2. 선택한 파일과 연결하기 위한 File 객체 생성
File file = new File("E:/dev/workspace/jsp_prj/src/main/webapp/upload/" + fileName);


if(file.exists() ){
//3. HTML을 출력하기 위한 출력 스트림의 초기화
out.clear();// 스트림에 정보가 존재하지 않는다.
out=pageContext.pushBody();// JSP의 정보를 보내기 위해 내장객체를 할당.

//입력스트림 연결
FileInputStream fis = new FileInputStream( file );
//접속자에게 보내줄 출력 스트림 재설정
OutputStream os = response.getOutputStream();


byte[] readData = new byte[512];// 파일을 읽여들여 저장할 배열

int byteLeng = 0;//읽여들인 파일의 방의 수

while( (byteLeng=fis.read( readData ) )!= -1 ){//읽어들인 데이터 있음
	os.write(readData, 0, byteLeng);
}
os.flush();//스크림에 기록된 내용을  목적지로 스트림에 분출한다.



}//end if
%>