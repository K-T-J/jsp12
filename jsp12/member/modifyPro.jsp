<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="web.jsp12.model.MemberDAO"%>
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="style.css" rel="stylesheet" type="text/css" />
	</head>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="dto" class="web.jsp12.model.MemberDTO" />
	<jsp:setProperty property="*" name="dto"/>
	
	<%
		//넘어오는 데이터 : pw, email, birth -> 수정은 birth, email만 수정 (비밀번호는 니들이해라)
		// update users set birth=?, email=? where id=?
		// modifyForm에서는 id 값이 없어서 위에 dto에 없음. 그래서 따로가져와야함 session에서 꺼내 !!!
		String id =(String)session.getAttribute("memId");
		dto.setId(id);
		
		//DB에 접근, 해당 id의 birth와 email 업데이트 
		MemberDAO dao = MemberDAO.getInstance();
		
		int result = dao.updateUser(dto);
	%>
	
	<body>
		<br />
			<h2 align="center"> 회원정보 수정화면 </h2>
			<%
			if(result==1){ // 수정이 잘됨.%>
				
				<table>
					<tr>
						<td>
						<b>회원정보가 수정되었습니다.</b>
						</td>
					</tr>
					<tr>
						<td>
						<button onclick="window.location='main.jsp'">메인으로</button>
						</td>
					</tr>
				</table>
			<%}else {%>
				<script>
					alert("회원 정보 수정 실패...");
					history.go(-1);
				</script>
			<% }%>
	
	</body>
</html>