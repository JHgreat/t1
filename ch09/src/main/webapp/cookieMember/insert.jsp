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
<%	request.setCharacterEncoding("utf-8"); /* method = "post" */%>

<!-- Member member = new Member();와 같다 -->
<jsp:useBean id="member" class="ch09.Member"></jsp:useBean>
<!-- insertForm 화면에서 입력한 id...을 셋팅 -->
<jsp:setProperty property="*" name="member"/>
<%	//singleton을 이용한 객체 생성, 이미 생성한 instance를 객체로 같이 사용
	MemberDao md = MemberDao.getInstance();
	int result = md.insert(member);//md에 있는 insert메서드를 실행하고 결과를 반환
	if(result>0){//성공%>
		<script type="text/javascript">
		alert("회원가입 축하");
		location.href ="loginForm.jsp";
		</script>
	<%}else{//실패%>
		alert("실패!");
		histor.go(-1);
	<%}
%>
</body>
</html>