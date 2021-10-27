<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Main</title>
   <link href="style.css" rel="stylesheet" type="text/css" >
</head>
<%    if(session.getAttribute("memId") == null){ // 세션속성없다 == 비 로그인
		// 세션이 없으면 쿠키는 있냐 ?
		String id = null, pw=null, auto=null;
		Cookie[] coos = request.getCookies(); // 쿠키들 모두 꺼내기
		if(coos != null){ // 쿠키가 있다면
			for(Cookie c : coos){
				if(c.getName().equals("autoId")) { id = c.getValue(); }
				if(c.getName().equals("autoPw")) { pw = c.getValue(); }
				if(c.getName().equals("autoAuto")) { auto = c.getValue(); }
			}
		}
		// 세션은 없지만, 쿠키가 있어서 값을 꺼내 담아보고,
		// 만약에 세 변수에 값이 들어있으면 session을 만들어 주기 위해 loginPro바로 넘기기.
		if(auto !=null && id !=null && pw !=null){
			response.sendRedirect("loginPro.jsp");
		}
%>
<body>
   <br />
   <h1 align="center"> Main </h1>
   <table>
      <tr>
         <td> 로그인 원하시면 버튼을 누르세요 <br />
            <button onclick="window.location='loginForm.jsp'"> 로그인 </button>         
         </td>
      </tr>
      <tr>
         <td> 
            <a href="signupForm.jsp"> 회원가입 </a>      
         </td>
      </tr>
      <tr>
         <td> 
            <a href="/web/jsp12boardjoin/board/list.jsp"> 게시판 </a>      
         </td>
      </tr>
   </table>
   <br /><br />
   <div align="center">
      <img src="imgs/11.jpg" width="300" />
   </div>
</body>
<%}else{  // 세션 속성 있다 == 로그인함 %>
<body>
   <br />
   <h1 align="center"> Main </h1>
   
   <table>
      <tr>
         <td> <%= session.getAttribute("memId") %> 님 환영합니다. <br /><br />
            <button onclick="window.location='logout.jsp'"> 로그아웃 </button>         
            <button onclick="window.location='mypage.jsp'"> 마이페이지 </button>         
         </td>
      </tr>
   </table>

   <br /><br />
   <div align="center">
      <img src="imgs/11.jpg" width="300" />
   </div>
</body>
<%}%>
</html>