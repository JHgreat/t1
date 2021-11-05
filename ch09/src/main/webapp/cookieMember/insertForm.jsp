<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("../common.css");
</style>
<script type="text/javascript">
function chk() {
	if (frm.password.value != frm.password2.value) { //암호확인과 암호가 다르면
		alert("암호와 암호확인이 다릅니다.")
		frm.password.focus(); //커서를 frm밑 아이디로 이동하라
		frm.password.value = "";
		return false;// action으로 넘어가지 마라
	}
}
</script>
</head>
<body>
	<form action="join.jsp" name="frm" onsubmit="return chk()" method="post">
		<table>
			<caption>회원 등록</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" required="required" autofocus="autofocus"></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="password" required="required""></td>
			</tr>
			<tr>
				<th>암호 확인</th>
				<td><input type="password" name="password2" required="required""></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit"></th>
			</tr>
		</table>
	</form>
</body>
</html>