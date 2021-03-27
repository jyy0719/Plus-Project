<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.project.plus.domain.InquiryVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Insert title here</title>
<!-- font -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>
body {
	font-family: 'NanumSquare', sans-serif;
	margin-left: 40px;
}

.wrapper {
	margin-left:60px;
	width:600px;
}s
</style>
</head>
<body>
	<div class="wrapper">
		<h1>1:1문의</h1>
		<hr>
		<form action="getInquiry.jsp" method="post">
			<div class="form-group">
				<input name="a" type="text" class="form-control" style="width:600px" placeholder="제목을 입력하세요">
			</div>
		
			<div class="form-group">
				<textarea name="b" type="text" class="form-control" style="height:500px; width:600px" placeholder="문의 내용을 입력하세요"></textarea>
			</div>
			<button type="submit" class="btn btn-primary">등록</button>
		</form>
	</div>	
		
		
		
		
		
		<!-- <form action="getInquiry.do" method="post"> 
			<input name="inquiryNum" type="hidden" value=3"/>
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left" width="600">제목이 들어가는칸</td>
				</tr>
				<tr>
					<td bgcolor="orange">작성자</td>
					<td align="left">누구세요</td>
				</tr>
				<tr>
					<td bgcolor="orange" height="300">내용</td>
					<td align="left">내용입니다	</td>
				</tr>
				<tr>
					<td bgcolor="orange">등록일</td>
					<td align="left">2021-03-24</td>
				</tr>
				<tr>
					<td bgcolor="oragne">조회수</td>
					<td align="left">3</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="글 수정"/>
					</td>
				</tr>
			</table>
		</form>
		<hr>
		<a href="inquiryForm.jsp">글 등록</a>&nbsp;&nbsp;&nbsp;
		<a href="deleteInquiry.do?inquiryNum=3">글 삭제</a>&nbsp;&nbsp;&nbsp;
		<a href="inquiry.do">글 목록</a> -->

	 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>

