<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/totalList.css">



<!-- 부트 스트랩 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 나눔폰트 -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<title>더하기+ 같이해서 더 가치있는 모임</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>

<body>

	<!--------------상세검색 영역--------------->
	<div class="jumbotron">
		<div id="searchform">
			<h3>
				<b>🔎 상세 검색 </b>
			</h3>
			<hr class="my-4">

			<div id="favorite">
				<label>관심 분야</label> <select>
					<option>전체</option>
					<option>운동</option>
					<option>학습</option>
					<option>취미</option>
					<option>습관</option>
				</select>
			</div>

			<div id="where">
				<label>온/오프라인</label> <select>
					<option>전체</option>
					<option>온라인</option>
					<option>오프라인</option>
				</select>
			</div>

			<div class=search>

				<form class="box" action="#" method="get" onsubmit="return #">
					<input type="text" id="keyword" name="keyword" value='' size="40"
						placeholder="관심있는 더하기를 검색해보세요."> <input type="submit"
						value="  검색  ">
				</form>
			</div>

		</div>
	</div>
	<%-- <input type="hidden" name="userLatitude"
		value='<c:out value="${pageMaker.cri.userLatitude}"/>'>
	<input type="hidden" name="userLongitude"
		value='<c:out value="${pageMaker.cri.userLongitude}"/>'>
	</form> --%>
	<!----------------검색분류------------------>
	<div id="sort">
		<ul>
			<li class="order_button"><a href="cbHeart desc">인기순</a></li>
			<li class="order_button "><a href="cbNum desc">최신순</a></li>
			<li class="order_button"><a href="cbAppperiod"> 마감일순</a></li>
		</ul>
	</div>



	<!----------------더하기 리스트------------------>
	<section class="gallery-block ca
		rds-gallery">
		<div class="gallery-container">

			<section class="gallery-block cards-gallery">
				<div class="gallery-container">

					<div class="row">
						<c:forEach items="${list}" var="club" varStatus="status"
							begin="0" end="19">
							<div class="col-md-6 col-lg-3">
								<div class="card border-0 transform-on-hover">

									<a class="lightbox"
										href='/club/info?club_num=<c:out value="${club.clubNum}" />'>
										<img id="clubmainpic"
										src="${path}/resources${club.clubMain_pic}"
										onerror="this.onerror=null; this.src='${path}/resources/img/img1.jpg'" />

									</a>
									<div class="card-bodyarea">
										<div class=spanspace>
											<span class="badge" id="onoff">${club.clubOnOff}</span> <span
												class="badge" id="freq">${club.clubFreq}</span>

										</div>
										<div class=clubtitle>
											<a class=clubtitle
												href='/club/info?club_num=<c:out value="${club.clubNum}" />'>
												${club.clubName} </a>
										</div>
										<div class=subtitle>
											<i class="fas fa-heart"> ${club.clubHeart}</i>

										</div>

										<!-- 더하기 상세 정보 -->
										<p class="text-muted card-text">

											<c:set var="today" value="<%=new java.util.Date()%>" />
											<fmt:formatDate var="today" value="${today}"
												pattern="yyyyMMdd" />
											<fmt:formatDate var="shutDay" value="${club.clubShutDate}"
												pattern="yyyyMMdd" />
											<fmt:formatDate var="startDay" value='${club.clubStartDate}'
												pattern="yyyy-MM-dd" />
											<fmt:formatDate var="endDay" value='${club.clubEndDate}'
												pattern="yyyyMMdd" />
											<span class="period">📅 ${club.clubStartDate} ~
												${club.clubEndDate}</span></br> <span class="shutdown"> 🔒 모집
												마감까지 D - <c:out value="${shutDay-today}" />
											</span></br> <span class="person">현재<b> ${club.clubCurnum}</b> /
												${club.clubMax}명 참여중!
											</span></br>

										</p>
									</div>
								</div>
							</div>
						</c:forEach>
			</section>
			<div class="search_wrap">
				<div class="search_area">
					<select name="type">
						<option value=""
							<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
						<option value="T"
							<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
						<option value="C"
							<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
						<option value="W"
							<c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
						<option value="TC"
							<c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목
							+ 내용</option>
						<option value="TW"
							<c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목
							+ 작성자</option>
						<option value="TCW"
							<c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목
							+ 내용 + 작성자</option>
					</select> <input type="text" name="keyword"
						value="${pageMaker.cri.keyword }">
					<button>Search</button>
				</div>
			</div>

			<div class="pageInfo_wrap">
				<div class="pageInfo_area">
					<ul id="pageInfo" class="pageInfo">

						<!-- 이전페이지 버튼 -->
						<c:if test="${pageMaker.prev}">
							<li class="pageInfo_btn previous"><a
								href="${pageMaker.startPage-1}">Previous</a></li>
						</c:if>

						<!-- 각 번호 페이지 버튼 -->
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a
								href="${num}">${num}</a></li>
						</c:forEach>

						<!-- 다음페이지 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="pageInfo_btn next"><a
								href="${pageMaker.endPage + 1 }">Next</a></li>
						</c:if>

					</ul>
				</div>
			</div>



			<form id="moveForm" method="get">
				<input type="hidden" name="pageNum"
					value="${pageMaker.cri.pageNum }"> <input type="hidden"
					name="amount" value="${pageMaker.cri.amount }"> <input
					type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
				<input type="hidden" name="type" value="${pageMaker.cri.type }">
			</form>
		</div>




		<!------------------------페이징----------------------->

		<%-- 	<table>
				<tr>
					<c:if test="${pageMaker.prev}">
						<td><a
							href='<c:url value="/totalList?page=${pageMaker.startPage-1}"/>'>&laquo;</a>
						</td>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<td><a href='<c:url value="/totalList?page=${idx}"/>'>${idx}</a>
						</td>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<td><a
							href='<c:url value="/totalList?page=${pageMaker.endPage+1}"/>'>&raquo;</a>
						</td>
					</c:if>
				</tr>
			</table>  --%>


		<%-- 	<!--   URL의 이동을 처리하도록 데이터를 전송한다.-->
			<form id='actionForm' action="totallist.do" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'> 
				<input type='hidden' name='amount' value='${pageMaker.cri.amount }'> 

			</form> --%>
		</div>

		<script src="https://kit.fontawesome.com/831a4ab0db.js"
			crossorigin="anonymous"></script>
		<script>
$(".pageInfo a").on("click", function(e){
	e.preventDefault();
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	moveForm.attr("action", "/board/list");
	moveForm.submit();
	
});	


$(".search_area button").on("click", function(e){
	e.preventDefault();
	
	let type = $(".search_area select").val();
	let keyword = $(".search_area input[name='keyword']").val();
	
	if(!type){
		alert("검색 종류를 선택하세요.");
		return false;
	}
	
	if(!keyword){
		alert("키워드를 입력하세요.");
		return false;
	}		
	
	moveForm.find("input[name='type']").val(type);
	moveForm.find("input[name='keyword']").val(keyword);
	moveForm.find("input[name='pageNum']").val(1);
	moveForm.submit();
});

            		</script>
</body>
</html>