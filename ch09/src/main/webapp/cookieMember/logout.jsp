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
	Cookie[] cooks = request.getCookies();
	if (cooks == null)
		response.sendRedirect("loginForm.jsp");
	else{
		for(int i = 0; i<cooks.length;i++){
			if(cooks[i].getName().equals("id")){
				cooks[i].setMaxAge(0);
				response.addCookie(cooks[i]);
				break;
			}
		}
	}
	%>
<script type="text/javascript">
	alert("로그아웃되었습니다.")
	location.href ="loginForm.jsp"
</script>	
</body>
</html>