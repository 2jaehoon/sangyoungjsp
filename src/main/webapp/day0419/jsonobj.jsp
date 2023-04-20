<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.vo.EmpVO"%>
<%@page import="day0419.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    info="JSONObject"
    %>
    <%
    String empno=request.getParameter("empno");
          //JSONObject으로 조회된 결과 만들기
          JSONObject jsonObj=new JSONObject();
          jsonObj.put("searchFlag", false);
    
    if(empno!=null && !"".equals(empno)){
       EmpDAO eDAO=new EmpDAO();
       
       try{
          EmpVO eVO=eDAO.selectOneEmp(Integer.parseInt(empno));
          
          boolean searchFlag= eVO!=null;
          
          jsonObj.put("searchFlag", searchFlag);
          
          if(searchFlag){
             jsonObj.put("empno", eVO.getEmpno());
             jsonObj.put("ename", eVO.getEname());
             jsonObj.put("job", eVO.getJob());
             jsonObj.put("sal", eVO.getSal());
             jsonObj.put("deptno", eVO.getDeptno());
             jsonObj.put("hiredate", new SimpleDateFormat("yyyy-MM-dd").format(eVO.getHiredate()));
          }//end if
          
       }catch(NumberFormatException nfe){
          
       }catch(SQLException se){
          se.printStackTrace();
       }//end catch
       out.print(jsonObj.toJSONString());
    }//end if
       
    
    %>