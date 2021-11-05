<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	//                       속성   값
	Cookie cook = new Cookie("id","대박");
//  생략하면 므라우저 닫으면 쿠키 종료
//	cook.setMaxAge(60*2); // 2분동안 쿠키 사용
//	cook.setMaxAge(0);    // 쿠키의 삭제 효과
	cook.setValue("kim"); // 값 변경
	response.addCookie(cook);  // pc에 cookie저장
%>
<h2>쿠키 생성</h2>
<a href="cookieUse.jsp">쿠키 값 확인</a>
</body>
</html>