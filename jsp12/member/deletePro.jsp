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
	//넘어오는 데이터 : pw
	String id = (String)session.getAttribute("memId");
	String pw = request.getParameter("pw");
	
	MemberDAO dao = MemberDAO.getInstance();
	
	int result = dao.deleteUser(id, pw);
	// result == 0 비번 잘못
	// result == 1 회원탈퇴 성공
	// result == -1 비번 가져오는것부터 잘못됨.
	// delete from users where id=?

			
	// 회원 정보 삭제가 잘 되었을때,
	if(result ==1 ){ 
		session.invalidate();
		//쿠키 있으면 쿠키도 삭제
		Cookie[] coos = request.getCookies();
		if(coos != null){
			for(Cookie c : coos){
				if(c.getName().equals("autoId") || c.getName().equals("auto") || c.getName().equals("autoAuto")){
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
		}
			%>
	<body>
			<br />
		<h2 align="center"> 회원 탈퇴 화면 </h2>
		<table>
			<tr>
			<td>회원 정보가 삭제되었습니다.</td>
			</tr>
			<tr>
			<td><button onclick="window.location='main.jsp'">메인으로</button></td>
			</tr>
		</table>
	</body>
	<%}else{ %>
		<script>
			alert("비밀번호가 맞지않습니다. 다시 시도해주세요");
			history.go(-1);
		</script>
			
	<%}%>



</html>