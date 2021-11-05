<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id ="";
	Cookie[] cooks =request.getCookies();
	if(cooks ==null) response.sendRedirect("loginForm.jsp");
	else{
		for(int i =0; i<cooks.length;i++){	//쿠키는 로그인을 했는지 확인하는것이 목적
			if(cooks[i].getName().equals("id")){//id에 해당하는 쿠키가 있다면
				id = cooks[i].getValue();
			break;
			}
		}
	
	if(id==null || id.equals("")){
		response.sendRedirect("loginForm.jsp");
		}
	}
%>
<h2><%=id %>님 환영합니다.</h2>
<a href ="logout.jsp">로그아웃</a>
</body>
</html>