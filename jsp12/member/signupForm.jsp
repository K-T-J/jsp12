<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 창</title>
<link href="style.css" rel="stylesheet" type="text/css" />
	<script>
		// 유효성 검사 
		function check() {
			// id가 중복 되는지 확인 
			var inputs = document.inputForm;	// 스크립트로 html 의 form 요소 가져오기 
			
			if (!inputs.id.value) {				// if(조건식) 안에 값이 있으면 true , 없으면 false 로 // (!inputs.id.value) ==> 값이 없을때 
				alert("아이디를 입력하세요.");
			return false;
			}
			
			if (!inputs.pw.value) {				
				alert("비밀번호를 입력하세요.");
			return false;
			}
			
			if (!inputs.pwCh.value) {				
				alert("비밀번호를 입력하세요.");
			return false;
			}
			
			if (!inputs.name.value) {				
				alert("이름을 입력하세요.");
			return false;
			}
			
			// 비밀번호와 비밀번호 확인란 작성값 동일 체크 
			if (inputs.pw.value != inputs.pwCh.value) {
				alert("비밀번호를 동일하게 입력 하세요.");
				return false;
			}
		} // close of the check 
		
		// ID 중복 체크 
		function confirmId(inputForm) {		// <-- inputForm <- this.form 객체 받음 
			if (inputForm.id.value == "" || !inputForm.id.value) {
				alert("ID를 입력하세요.");
				return;
			}
		
			// 팝업을 띄워
			var url = "confirmId.jsp?id=" + inputForm.id.value; 	// 예) confirmId.jsp?id=pika
			
			open(url, "confirmId", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizeable=no, width=500, height=300");
		}
		
	</script>
</head>
<body>
	<br />
		<h2 align="center"> Sign up </h2>

	<form action="signupPro.jsp" method="post" name="inputForm" onsubmit="return check()">
	
		<table border="1">
			<tr>
				<td>ID *</td> <td> <input type="text" name="id" /></td>
			</tr>
			<tr>
				<td>ID 중복체크*</td> <td> <input type="button" value="ID 중복확인" onclick="confirmId(this.form)" /></td>
			</tr>
			<tr>
				<td>PW *</td> <td> <input type="password" name="pw" /> </td>
			</tr>
			<tr>
				<td>PW Confirm</td> <td> <input type="password" name="pwck" /> </td>
			</tr>
			<tr>
				<td>Name *</td> <td> <input type="text" name="name" /> </td> 
			</tr>
			<tr>
				<td>E-mail </td> <td> <input type="text" name="email" /> </td>
			</tr>
			
			<tr>
				<td>Date of Birth </td> <td> <input type="text" name="birth" placeholder="YYYY-MM-DD" maxlength="8" />
														</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="확인" />
						<input type="reset" value="재입력" />
						<input type="button" value="취소"  onclick="window.location='main.jsp'"/>
				 </td>
			</tr>
			
		</table>
	</form>

</body>
</html>