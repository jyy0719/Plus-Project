<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>나의 문의 사항</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<!-- font -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>
body {
	font-family: 'NanumSquare', sans-serif;
	margin-left: 40px;
}
</style>

</head>
<body>
	일단 내용부터 뽑을게요 
	<c:out value="${InquiryVO.memberNum}"></c:out>
	<c:forEach var="inquiry" items="${inquiryList}">
${inquiry.inquiryTitle}<br />
${inquiry.inquiryType}<br />
		<fmt:parseDate var="parseRegDate" value="${inquiry.inquiryRegDate}"
			pattern="yyyy-MM-dd" />
		<fmt:formatDate var="resultRegDt" value="${parseRegDate}"
			pattern="yyyy-MM-dd" />
${resultRegDt}<br />
${inquiry.inquiryContent}<br />
	</c:forEach>
</body>
</html>