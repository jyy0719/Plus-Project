<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 등록</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

</head>
<body>

	<div id="wrap">


		<section id="container">
			<center>
				<div class="section_in">
					<h2>공지사항 등록</h2>


					<hr>
					<fieldset class="formContent">

						<div>
							<label for="location">제목</label> <input type="text"
								name='qsTitle' id="title" style="width: 300px; height: 25px;">
						</div>
						<div class="request">
							<label for="request" class="class">내용</label>
							<textarea class="mgtop" name='qsContent' id="content" rows="10"
								cols="100" style="resize: none"></textarea>
						</div>
					</fieldset>
					<hr>

					<div class="btn_announce">
						<input type="submit" value="등록하기" class="btn_announce2">
					</div>
					</form>

				</div>
		</section>
	</div>

	<hr>
	<a href="getAnnounceList.do">글 목록 가기</a>
	</center>

</body>
</html>













