<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%  // Enumeration, Iterator 자료를 순차적으로 읽는 데이터를 담아서 처리
	Enumeration<String> et = session.getAttributeNames();
	while(et.hasMoreElements()) {
		String name = et.nextElement();
		String value = (String)session.getAttribute(name);
		out.println("세션명 : "+name+"<br>");
		out.println("세션값 : "+value+"<p>");
	}
%>
<h2>세션 읽기</h2>
ID : <%=session.getAttribute("id") %><p>
암호 : <%=session.getAttribute("pass") %>
</body>
</html>