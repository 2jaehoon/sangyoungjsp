<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="세션사용 - 세션 값 삭제" 
    %>
    <%
    //세션값 삭제(세션이 살아있음) : session.removeAttribute("이름")
    session.removeAttribute("user_name");
    session.removeAttribute("user_addr");
    
    //세션 자체 삭제(무효화)
    session.invalidate();
    //세션 자체가 삭제되었기 떄문에 값을 얻는 행동을 할 수 없다.
   response.sendRedirect("use_session_a.jsp");
    %>
