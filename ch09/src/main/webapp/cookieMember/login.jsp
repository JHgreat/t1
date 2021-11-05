<%@page import="ch09.MemberDao"%>
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
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	MemberDao md = MemberDao.getInstance();
	int result = md.loginChk(id,password);
	if(result>0){//로그인 성공했으면
		Cookie cook = new Cookie("id",id);//쿠키생성
		response.addCookie(cook);//pc에 쿠키를 저장
		response.sendRedirect("main.jsp");
	}else if(result == 0){%>
		<script type="text/javascript">
		alert("암호를 틀렸습니다.");
		history.back();
		</script>
	<%}else{%>
		<script type="text/javascript">
		alert("아이디조차 없습니다.");
		history.back();
		</script>
	<%}
%>
</body>
</html>