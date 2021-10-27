<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%
		// 세션 속성 삭제...
		session.invalidate(); 
		//쿠키가 있으면 쿠키도 삭제...
		Cookie[] coos = request.getCookies();
		if(coos != null){
			for(Cookie c : coos){
				if(c.getName().equals("autoId") || c.getName().equals("auto") || c.getName().equals("autoAuto")){
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
		}
		response.sendRedirect("main.jsp"); // 메인 강제이동
		
	%>
<body>

</body>
</html>