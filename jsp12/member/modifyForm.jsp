<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="web.jsp12.model.MemberDAO"%>
<%@ page import="web.jsp12.model.MemberDTO"%>
    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Modify Form</title>
		<link href="style.css" rel="stylesheet" type="text/css" />
	</head>
	
	<%
		if (session.getAttribute("memId") == null) {
	%>		
			<script>
				alert("로그인 해주세요");
				window.location = "/web/jsp12boardjoin/loginForm.jsp";
			</script>
	
	
	<% 	
		} else {
			String id = (String)session.getAttribute("memId");
	
			MemberDAO dao = MemberDAO.getInstance();
			MemberDTO user = dao.getUser(id);
	%>
	
	<body>
		<br />
			<h2 align="center"> 회원정보 수정 </h2>
	
		<form action="modifyPro.jsp" method="post">
		
			<table border="1">
				<tr>
					<td>ID *</td>
					<td><%= user.getId() %></td>
				</tr>
				<tr>
					<td>PW *</td>
					<td> <input type="password" name="pw" value="<%= user.getPw() %>" /> </td>
					
				</tr>
				<tr>
					<td>PW Confirm</td>
					<td> <input type="password" name="pwck" /> </td>
				</tr>
				<tr>
					<td>Name *</td> <td><%=user.getName() %> </td> 
				</tr>
				<tr>
					<td>E-mail </td>
					 <td> 
						<%if(user.getEmail()==null){%>
					<input type="text" name="email" /><%}
						else{ %>
						<input type="text" name="email" value="<%=user.getEmail() %>"/>
					<% }%>
					
					 </td>
				</tr>
				
				<tr>
					<td>Date of Birth </td> <td> 
						<%if(user.getBirth()==null){%>
					<input type="text" name="birth" maxlength="8"/><%}
						else{ %>
						<input type="text" name="birth" value="<%=user.getBirth()%>" maxlength="8"/>
					<% }%>
						</td>
				</tr>
	
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="바꿔!!" />
							<input type="reset" value="재입력" />
							<input type="button" value="취소"  onclick="window.location='main.jsp'"/>
					 </td>
				</tr>
				
			</table>
		</form>
	
	</body>
	
	<%	} %>

</html>