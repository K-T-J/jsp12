<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head> 
	<meta charset="UTF-8">
	<title>게시판</title>
	<link href="/web/jsp17/style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<br />
	<div align="right"> 
		<c:if test="${sessionScope.sid == null}">
			<button onclick="window.location='/web/member/loginForm.hrd'">로그인</button>
		</c:if>
		<c:if test="${sessionScope.sic != null}">
			<button onclick="window.location='/web/member/logout.hrd'">로그아웃</button>
		</c:if>
	</div>
	
	
	<h1 align="center"> 게시판 </h1>
	<c:if test="${count == 0}">
	<table>
		<tr>
			<td><button onclick="window.location='/web/board/writeForm.hrd'"> 글쓰기 </button></td>
		</tr>
		<tr>
			<td align="center">게시글이 없습니다.</td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${count != 0}">
	<table>
		<tr>
			<td colspan="5" align="right"><button onclick="window.location='/web/board/writeForm.hrd'"> 글쓰기 </button></td>
		</tr>
		<tr>
			<td>No.</td>
			<td>제  목</td>
			<td> num / ref / re_step / re_level </td>
			<td>작성자</td>
			<td>시  간</td>
			<td>조회수</td>
		</tr>
		
		<c:forEach var="article" items="${articleList}">
			<tr>
				<td>${number}
					<c:set var="number" value="${number -1}"/><%--c:set 변수만들기   number--; 와 동일--%>
				</td>
				<td align="left">
					<c:set var="wid" value="0"/>
					<c:if test="${article.re_level >0}">
						<c:set var="wid"  value="${10 * article.re_level}"/>
						<img src="web/jsp17/img/tabImg.PNG" width="${wid}" />
						<img src="web/jsp17/img/replyImg.png" width="11" /> 
					
					</c:if>
				
					<a href="/web/board/content.hrd?num=${article.num}&pageNum=${pagenum}"> ${article.subject } </a>
				</td>
				<td> ${article.num } / ${article.ref } / ${article.re_step} / ${article.re_level} </td>
				<td><a href="mailto:${article.email}"> ${article.writer} </a></td>
				<td>${article.reg}</td>
				<td>${article.readcount}</td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
	
	
	<br /> <br /> 
	<%-- 페이지 번호 --%>
	<div align="center">
	<c:if test="${count >0}">
		<c:set var="pageBlock" value="3"/>
		<fmt:parseNumber var="res" value="${count / pageSize}" integerOnly="true"/><%--integerOnly 소수점 안나오게 --%>
		<c:set var="pageCount" value="${res + (count % pageSize == 0 ? 0 : 1)}"/>
		<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
		<fmt:parseNumber var="startPage" value="${result * pageBlock + 1}"/>
		<fmt:parseNumber var="endPage" value="${startPage + pageBlock -1}"/>
		
		<c:if test="${endpage > pageCount}">
			<c:set var="endPage" value="${pageCount}"/>
		</c:if>
		
		
		<%--검색했을때 페이지번호들 --%>
		<c:if test="${sel != null && search != null}">
			<c:if test="${startPage > pageBlock}">
				<a href="/web.board/list.hrd?pageNum=${startPage-pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &lt; &nbsp;</a>
			
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/web/board/list.hrd?pageNum=${i}&sel=${sel}&search=${search}" class="pageNums"> &nbsp;${i} &nbsp; </a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				&nbsp; <a href="/web/board/list.hrd?pageNum=${startPage+pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &gt; </a>
			</c:if>
		</c:if>
		
		<%--검색안했을때 페이지번호들 --%>
		<c:if test="${sel == null && search == null}">
			<c:if test="${startPage > pageBlock}">
				<a href="/web/board/list.hrd?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/web/board/list.hrd?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				&nbsp; <a href="/web/board/list.hrd?pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
			</c:if>
		</c:if>
	</c:if><%-- end:count > 0  --%>
	
	
	<br /> <br />
	<%-- 작성자/내용 검색 --%>
	<form action="list.jsp">
		<select name="sel">
			<option value="writer">작성자</option>
			<option value="content">내용</option>
		</select>
		<input type="text" name="search" />
		<input type="submit" value="검색" />
	</form>
	<br />
	
	<h3 style="color:grey"> 현재페이지 : ${pageNum }</h3>
	<br /> 
	<c:if test="${sel != null && search != null }">
		<button onclick="window.location='/web/board/list.hrd'"> 전체 게시글 보기 </button> <br />
	</c:if>	
	<button onclick="window.location='/web/member/main.hrd'"> 메인으로 </button>
	</div>
	
</body>
</html>
