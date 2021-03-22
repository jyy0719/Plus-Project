<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>

<%@ include file="WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" type="text/css" href="resources/css/announce.css">
<!-- themify CSS -->
<!-- <link rel="stylesheet" type="text/css"
	href="../resources/icon/themify-icons/themify-icons.css"> -->

</head>

<body>


	<div class="visual-box">
		<div class="visual-box-in">
			<!-- <h2>자주묻는질문</h2> -->
			<div class="header">공지사항</div>
			<div class="desc">알려드릴 소식이 있어요</div>
		</div>
	</div>

	<div class="notimenu">
		<div class="notisubmenu">
			<a href="">공지사항</a>
			<a href="faq.jsp">자주묻는질문</a>
			<!-- <a href="../cs/inquire">문의사항</a> -->
		</div>
	</div>

	<div id="announce">
		<%-- <c:forEach items="${faqContent}" var="faq"></c:forEach> --%>
		<button class="accordion">
			<div class="question"></div>
			결제 기능 점검 기간 안내입니다
		</button>

		<div class="panel">
			<p>몇시부터 몇시까지 안될 예정이예요</p>
		</div>
		<%--  </c:forEach>  --%>
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
	<%@ include file="WEB-INF/views/include/footer.jsp" %>
</body>

</html>