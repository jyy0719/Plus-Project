<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/announce.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
</head>
<body>
	<center>

		어떻게하면 DB값이 들어올지 모르겠어요
		<div>${announce.announceTitle }</div> 
		<c:forEach var="announce" items="${announceList}">
			<tr>
				<td>${announce.announceNum}</td>
				<td align="left"><a href="getAnnounce.do?announceNum=${announce.announceNum}">${announce.announceTitle}</a></td>
				<td>${announce.announceContent}</td>
				<td>${announce.announceRegDate}</td>
			</tr>
			</c:forEach>
		<table border="1">
			<tr>
				<td name="announceTitle" value="${announce.announceTitle }"/>
			</tr>
		</table>
		<br> <a href="${path }/insertAnnounceForm.jsp">글 등록하기</a>
	</center>
	<div class="visual-box">
		<div class="visual-box-in">
			<!-- <h2>자주묻는질문</h2> -->
			<div class="header">공지사항</div>
			<div class="desc">알려드릴 소식이 있어요</div>
		</div>
	</div>

	<div class="notimenu">
		<div class="notisubmenu">
			<a href="">공지사항</a> <a href="faq.jsp">자주묻는질문</a>
		</div>
	</div>

	<div id="announce">
		<c:forEach items="${announceTitle}" var="announce"></c:forEach>
		<button class="accordion">
			<div class="question"></div>
			<!-- 결제 기능 점검 기간 안내입니다 -->
			${announceTitle }
		</button>
		<c:forEach items="${announceContent }" var="announce">
			<div class="panel">
			<p>${announceContent}</p>
				<!-- <p>몇시부터 몇시까지 안될 예정이예요</p> -->
			</div>
		</c:forEach>
		<button class="accordion">
			<div class="question"></div>
			✨포인트 지급 이벤트 중! (03/08~04/21)✨
		</button>

		<div class="panel">
			<p>사이버머니 나도 필요한데</p>
		</div>
		<button class="accordion">
			<div class="question"></div>
			프로젝트 넘 힘들어
		</button>

		<div class="panel">
			<p>
				테스트 내용입니다 조금 길게 적어넣어야 하는데 할말이 없어 복붙합니다<br /> 테스트 내용입니다 조금 길게 적어넣어야
				하는데 할말이 없어 복붙합니다<br /> 테스트 내용입니다 조금 길게 적어넣어야 하는데 할말이 없어 복붙합니다<br />
				테스트 내용입니다 조금 길게 적어넣어야 하는데 할말이 없어 복붙합니다<br /> 테스트 내용입니다 조금 길게 적어넣어야
				하는데 할말이 없어 복붙합니다<br /> 테스트 내용입니다 조금 길게 적어넣어야 하는데 할말이 없어 복붙합니다<br />
			</p>
		</div>
	</div>

	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.maxHeight) {
					panel.style.maxHeight = null;
				} else {
					panel.style.maxHeight = panel.scrollHeight + "px";

				}
			});
		}
	</script>
	<%-- <%@ include file="include/footer.jsp" %> --%>
</body>
</html>













