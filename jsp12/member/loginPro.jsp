<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="web.jsp12.model.MemberDAO"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login Pro</title>
		<link href="style.css" rel="stylesheet" type="text/css" />
	</head>
	<%
	request.setCharacterEncoding("utf-8");
	
		// 넘어온 파라미터 받기(loginForm 타고 왔을때 처리)
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String auto = request.getParameter("auto"); // 자동로그인 체크박스 값 꺼내기
	
		// 쿠키 체크(login폼을 안타고, main에  바로 날라왔을때는 위 파라미터에서 값을 꺼내도 없기때문에 다시 쿠키에서 꺼내서 id,pw,auto 꺼내서 채워지기
			Cookie[] coos = request.getCookies();
			if(coos != null){
				for(Cookie c : coos){
					if(c.getName().equals("autoId")) id = c.getValue();
					if(c.getName().equals("autoPw")) pw = c.getValue();
					if(c.getName().equals("autoAuto")) auto = c.getValue();
				}		
			}
		
		System.out.println("id : "+id);
		System.out.println("pw : "+pw);
		System.out.println("auto : "+auto);
		
		// 로그인 체크
		MemberDAO dao = MemberDAO.getInstance();
		boolean res = dao.idPwCheck(id, pw);
		
		if(res){ //아이디 패스워드가 맞다 -> 로그인 처리
			if(auto != null) {// 자동로그인 체크하고 로그인했으면 !!!
				Cookie c1= new Cookie("autoId", id);
				Cookie c2= new Cookie("autoPw", pw);
				Cookie c3= new Cookie("autoAuto", auto);
				c1.setMaxAge(60*60*24); //하루(24시간)안에 다시 접속하면 쿠키 갱신
				c2.setMaxAge(60*60*24); //하루
				c3.setMaxAge(60*60*24); //하루
				response.addCookie(c1);
				response.addCookie(c2);
				response.addCookie(c3);
			}
			
			session.setAttribute("memId", id); // 세션 만들기 -> 로그인처리
			response.sendRedirect("main.jsp");
		}else{
	%>
			<script>
				alert("id 또는 pw가 일치하지 않습니다.");
				history.go(-1);
			</script>
		<%}
	%>
	
	<body>
	
	</body>
</html>