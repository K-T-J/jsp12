<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="web.jsp12.model.MemberDAO"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup Pro</title>
</head>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="web.jsp12.model.MemberDTO" />
<jsp:setProperty name="dto" property="*"/>

<%
MemberDAO dao = MemberDAO.getInstance();
	dao.insertMember(dto);
	// 페이지 처리 #1.
	//response.sendRedirect("main.jsp"); // 메인 ㅍ ㅔ이지로 바로 이동
%>

<body>
	
	<%-- 페이지 처리 #4 가입처리후 화면 1초뒤 main 이동 --%>
	<meta http-equiv="Refresh" content="1;url=main.jsp"/>
	
	<%--
	<script>
	// 페이지처리 #3.
	alert("회원가입이 정상적으로처리되었습니다.");
	window.location.href="main.jsp"; // 메인으로 이동
	</script>
	--%>

	<h3>회원가입 완료 !</h3>
	<%--페이지 처리 #2 
	<button onclick="window.location='main.jsp'"> 메인으로 이동</button> <%-- 버튼클릭해서 이동 
	--%>
</body>
</html>