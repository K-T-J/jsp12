<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<% if (session.getAttribute("memId") == null) { %>
	<script>
		alert("로그인 해주세요");
		window.location = "/web/jsp12boardjoin/loginForm.jsp";
	</script>
<% } else { %>

<% } %>

<body>
<br />
	<h1 align="center">마이페이지</h1>
	<table>
	<tr>
		<td>
			<a href="modifyForm.jsp">정보수정</a>	
		</td>
	</tr>
	<tr>
		<td>
			<a href="deleteForm.jsp">회원탈퇴</a>	
		</td>
	</tr>
	<tr>
		<td>
			<a href="main.jsp">메인으로</a>	
		</td>
	</tr>
	
	
	</table>

</body>
</html>