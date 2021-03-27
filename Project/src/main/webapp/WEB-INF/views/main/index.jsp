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
	href="${path}/resources/css/index.css">

<!-- 구글 아이콘되나-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

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
<style>
@charset "UTF-8";

* {
   box-sizing: border-box;
   padding: 0;
   margin: 0;
   font-family: 'NanumSquare';
}

body {
   padding-bottom: 10%;
}

a {
   text-decoration: none
}

/* 메인 carousel */
.carousel-item {
   width: 100%;
   height: 500px;
   color: white;
   position: absolute;
   overflow: hidden;
   margin: 0 auto;
}

.main-image {
   /* width: 100%;
        height: 500px; */
   position: relative;
   background-size: cover;
   width: 100%;
   height: 100%;
   object-fit: cover;
}

.main-image::before {
   content: "";
   opacity: 0.8;
   position: absolute;
   top: 0px;
   left: 0px;
   right: 0px;
   bottom: 0px;
   background-color: #000;
}

.carouser-content1 {
   font-family: 'NanumSquare';
}

.carouser-content1 p {
   font-size: 48px;
   font-weight: 900;
   color: rgb(236, 236, 236);
   text-shadow: 2px 2px 2px rgba(65, 62, 62, 0.808);
   position: relative;
   left: 50%;
   transform: translate(-50%, -100%);
}

.carouser-content2 {
   font-size: 40px;
   font-weight: 700;
   color: rgb(236, 236, 236);
   text-shadow: 2px 2px 2px rgba(65, 62, 62, 0.808);
   position: relative;
   left: 50%;
   transform: translate(-50%, -100%);
   text-align: left;
   line-height: 2;
}

.carouser-content2 h5 {
   line-height: 1.5;
}

.carouser-content3 {
   font-size: 40px;
   font-weight: 700;
   color: rgb(236, 236, 236);
   text-shadow: 2px 2px 2px rgba(65, 62, 62, 0.808);
   position: relative;
   right: -50%;
   transform: translate(-50%, -100%);
   text-align: right;
   line-height: 2;
}

.carouser-content3 h5 {
   line-height: 1.5;
}

/* 현재 위치 */
#current-location {
   font-family: 'NanumSquare';
   font-size: 18px;
   font-weight: 700;
   padding: 50px;
   position: absolute;
   left: 50%;
   transform: translate(-50%, 0);
}

/* 검색 박스 시작 */
.search {
   align-items: center;
   padding: 100px 0 70px 0px;
   clear: both;
}

form.box {
   width: 500px;
   position: absolute;
   left: 50%;
   transform: translate(-50%, 0);
   text-align: center;
}

form.box :placeholder {
   font-size: 15px;
   font-weight: 700;
   padding: 5px;
}

form.box input[type=text] {
   /* 속성선택자로 type=text인 경우에만 적용되도록 함 */
   background-color: #D3D5DA;
   margin-top: -1px;
   width: 400px;
   padding: 8px;
   border: none;
   border-radius: 20px 0 0 20px;
}

form.box input[type=submit] {
   background-color: rgb(0, 30, 250);
   color: white;
   font-size: 15px;
   padding: 8px;
   border-radius: 0 20px 20px 0;
   width: 80px;
   border: none;
   margin-left: -6px;
}

form.box input[type=text]::placeholder {
   font-size: 14px;
   text-align: center;
   font-family: 'NanumSquare';
   color: rgb(0, 0, 0)
}

/* 카테고리 버튼 */
.middle {
   text-align: center;
   position: relative;
}

.catagory-btn {
   display: inline-block;
   width: 130px;
   height: 120px;
   background-color: rgba(146, 194, 221, 0.123);
   margin: 20px 60px 20px 20px;
   border-radius: 30%;
   box-shadow: 0 5px 15px -5px #52515170;
   color: rgb(0, 30, 250);
   overflow: hidden;
   position: relative;
}

.catagory-btn i {
   line-height: 90px;
   font-size: 40px;
   transition: 0.2s linear;
   margin: -5px;
}

.catagory-btn p {
   color: rgb(0, 30, 250);
   overflow: hidden;
   position: relative;
   font-family: 'NanumSquare', sans-serif !important;
   font-size: 14px;
   font-weight: 700;
}

.catagory-btn:hover i {
   transform: scale(1.1);
   color: #f1f1f1;
}

.catagory-btn:hover p {
   transform: scale(1.1);
   color: #f1f1f1;
}

.catagory-btn::before {
   content: "";
   position: absolute;
   width: 120%;
   height: 120%;
   background: rgb(0, 30, 250);
   transform: rotate(10deg);
   left: -110%;
   top: 90%;
}

.catagory-btn:hover::before {
   animation: aaa 1s 1;
   top: -10%;
   left: -10%;
}

@keyframes aaa { 0% {
   left: -110%;
   top: 90%;
}

50%
{
left


:

 

10%;
top


:

 

-30%;
}
100%
{
top


:

 

-10%;
left


:

 

-10%;
}
}
/* 검색 카테고리  끝*/
.gallery-container {
   width: 1200px;
   height: auto;
   margin: auto;
   padding-top: 100px;
}

.card-bodyarea {
   padding: 20px 2px 50px 2px;
}

.card-content {
   position: relative;
   padding: 10px 0 20px 3px;
}

.card-content b {
   color: rgb(0, 0, 0);
}

#viewtotal {
   position: relative;
   left: 94%;
   transform: translate(-50%, 0);
   font-size: 16px;
   color: slategrey;
   font-family: 'NanumSquare';
   /* font-weight: 500; */
   text-decoration: none;
}

/* 더하기 리스트*/
.gallerytitle {
   padding-bottom: 10px;
}

#onoff {
   background-color: #00af91;
}

#freq {
   background-color: #ffb26b;
}

.spanspace {
   padding-bottom: 10px;
}

.clubtitle {
   font-size: 19px;
   font-weight: 600;
   color: #303333;
}

.subtitle {
   font-size: 14px;
   font-weight: 300;
   color: #9B9EA5;
   padding: 3px 0px 15px 2px;
}

.period {
   font-size: 15px;
   color: #303333;
   font-weight: 600;
}

.shutdown {
   font-size: 15px;
   color: #303333;
   font-weight: 600;
}

.person {
   padding-top: 5px;
   font-size: 15px;
   color: #303333;
   font-weight: 600;
}

.person b {
   font-size: 17px;
   color: rgb(0, 30, 250);
   font-weight: 900;
}

.lightbox img {
   width: 100%;
   height: 200px;
   transition: .1s;
}



/* 페이지 위로가기 버튼 */
#go-top {
   /* display: none;  */
   position: absolute;
   left: 50%;
   transform: translate(-50%, 0%);
   outline: 0;
   border: 0;
   background: transparent;
   cursor: pointer;
   z-index: 9999;
   color: rgb(0, 30, 250);
   
}
/*더하기 등록 버튼*/
#addplus {
   outline: 0;
   border: 0;
   background: transparent;
   cursor: pointer;
   position: absolute;
   right: 3%;
   
   
   
}
.material-icons{
   color: rgb(0, 30, 250);
       
}
   

</style>
</head>

<body>

	<main>
		<!-- 메인 carousel -->
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<!-- 인디케이터 -->
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>

			<!-- 슬라이드 쇼 -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="main-image" src="${path}/resources/img/main1.jfif"
						style="position: top: -160;" alt="First slide">

					<div class="carousel-caption d-none d-md-block">
						<div class="carouser-content1">
							<P>내 주변의 즐거운 모임</P>
							<P style="font-size: 60px;">더하기+</P>

						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="main-image" src="${path}/resources/img/main2.jfif"
						alt="Second slide">
					<div class="carousel-caption d-none d-md-block">
						<div class="carouser-content2">
							<p>모임은 가까워야 좋죠.</p>
							<h5>
								더하기는 현재 내 위치에서 </br> 10KM 반경의 모임만 볼 수 있어요.
							</h5>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="main-image" src="${path}/resources/img/main3.jfif"
						alt="Third slide">
					<div class="carousel-caption d-none d-md-block">
						<div class="carouser-content3">
							<p>우린 같은 곳을 봐요.</p>
							<h5>
								같은 목표를 가진 사람들이</br>함께하니 끝까지 할 수 있어요.
							</h5>
						</div>
					</div>
				</div>
			</div>
			<!-- 화살표 버튼 -->
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		</div>
	</main>

	<div id="current-location"></div>


	<!--검색창 -->
	<div class=search>
		<form class="box" action="totalList.do" method="get"
			onsubmit="return inputCheckMain()">
			<input type="text" name="keyword" size="30"
				placeholder=" 관심있는 더하기를 검색해보세요 🔍"> <input type="submit"
				value="Search">
		</form>
	</div>

	<!--검색 카테고리 -->
	<div class="middle">
		<a class="catagory-btn" href="totalLlist.do?category=운동"> <i class="fas fa-running"></i>
			<p>운동</p>
		</a> <a class="catagory-btn" href="totalLlist.do?category=학습"> <i class="fas fa-book-reader"></i>
			<p>학습</p>
		</a> <a class="catagory-btn" href="totalLlist.do?category=취미"> <i class="fas fa-cubes"></i>
			<p>취미</p>
		</a> <a class="catagory-btn" href="totalLlist.do?category=습관"> <i class="far fa-grin-alt"></i>
			<p>습관</p>
		</a>
	</div>

	<!--더하기 리스트-->
	<section class="gallery-block cards-gallery">
		<div class="gallery-container">
			<div class="gallerytitle">
				<h3 id="viewtitle">
					<b> 💙BEST 인기 더하기</b>
				</h3>
				<a href="totalList.do" id="viewtotal"> 더 보기 > </a>
			</div>

			<div class="row">
				<c:forEach items="${main}" var="club" varStatus="status" begin="0"
					end="11">
					<div class="col-md-6 col-lg-3">
						<div class="card border-0 transform-on-hover">

							<a class="lightbox"
								href='getClub.do?clubNum=<c:out value="${club.clubNum}" />'>

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
										href='getClub.do?clubNum=<c:out value="${club.clubNum}" />'>
										${club.clubName} </a>
								</div>
								<div class=subtitle>
									<i class="fas fa-heart"> ${club.clubHeart}</i>

								</div>

								<!-- 더하기 상세 정보 -->
								<p class="text-muted card-text">

									<c:set var="today" value="<%=new java.util.Date()%>" />
									<fmt:formatDate var="today" value="${today}" pattern="yyyyMMdd" />
									<fmt:formatDate var="shutDay" value="${club.clubShutDate}"
										pattern="yyyyMMdd" />
									<fmt:formatDate var="startDay" value='${club.clubStartDate}'
										pattern="yyyy-MM-dd" />
									<fmt:formatDate var="endDay" value='${club.clubEndDate}'
										pattern="yyyyMMdd" />
									<span class="period">📅 ${club.clubStartDate} ~
										${club.clubEndDate}</span></br> <span class="shutdown"> 🔒 모집 마감까지
										D - <c:out value="${shutDay-today}" />
									</span></br> <span class="person">현재<b> ${club.clubCurnum}</b> /
										${club.clubMax}명 참여중!
									</span></br>

								</p>
							</div>
						</div>
					</div>
				</c:forEach>
	</section>


	<!--내 위치에서 가까운 더하기 -->
	<section class="gallery-block cards-gallery">
		<div class="gallery-container">
			<div class="gallerytitle">
				<h3 id="viewtitle">
					<b>🚩내 주변 가까운 더하기</b>
				</h3>
				<a href="totalList.do" id="viewtotal"> 더 보기 > </a>
			</div>

			<div class="row">
				<c:forEach items="${main2}" var="club" varStatus="status" begin="0"
					end="11">
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
									<fmt:formatDate var="today" value="${today}" pattern="yyyyMMdd" />
									<fmt:formatDate var="shutDay" value="${club.clubShutDate}"
										pattern="yyyyMMdd" />
									<fmt:formatDate var="startDay" value='${club.clubStartDate}'
										pattern="yyyy-MM-dd" />
									<fmt:formatDate var="endDay" value='${club.clubEndDate}'
										pattern="yyyyMMdd" />
									<span class="period">📅 ${club.clubStartDate} ~
										${club.clubEndDate}</span></br> <span class="shutdown"> 🔒 모집 마감까지
										D - <c:out value="${shutDay-today}" />
									</span></br> <span class="person">현재<b> ${club.clubCurnum}</b> /
										${club.clubMax}명 참여중!
									</span></br>

								</p>
							</div>
						</div>
					</div>
				</c:forEach>
	</section>

	<!--페이지 위로가기 버튼 -->
	<button id="go-top">
		<svg xmlns="http://www.w3.org/2000/svg" width="38" height="38"
			fill="currentColor" class="bi bi-arrow-up-circle-fill"
			viewBox="0 0 16 16">
        <path fill-rule="evenodd"
				d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z" />
      </svg>


	</button>
 <button id="addplus">
		<a href="clubForm.jsp"> <span class="material-icons"
			style="display: inline-block; font-size: 55px;"> add_circle </span></a>
	</button> 



	</div>
	</div>
</body>

<!--어썸폰트 아이콘 -->
<script src="https://kit.fontawesome.com/831a4ab0db.js"
	crossorigin="anonymous"></script>
<!--부트스트랩-->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>


<!--구글맵 api-->
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA14FclHyP6uY1AXC81jP9ZEsnWKEn-nYE"></script>

<script>
	<!--메인 carousel 2초-->
	$('.carousel').carousel({ interval: 2000 })
	

	

<!------------------현재 위치 가져오기----------------->

        if (!!navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
            document.getElementById("current-location").innerHTML = "잠깐! 현재 위치를 찾고 있습니다.";
        }
        else {
            alert("해당 브라우저는 위치추적을 지원하지 않습니다");
        }
        function successCallback(position) {
            var lat = position.coords.latitude;          // 위도
            var lng = position.coords.longitude;         // 경도
            var latlng = new google.maps.LatLng(lat, lng);
			console.log(lat, lng);  //현재 위치 위도 경도
				
/* 	$.ajax({
		type:"post",
		data:{
			userLatitude : lat,
			userLongitude : lng
		},
		url : "plus/main.do",
		
		error : function(error) {
			console.log("error");
		},
		success : function(data) {
			console.log(data);

		}
	}); */

			 
             <!----위도, 경도 주소로 변환하기---->
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'latLng': latlng }, function (results, status) {
                if (status !== google.maps.GeocoderStatus.OK) {
                    alert(status);
                }
                // This is checking to see if the Geoeode Status is OK before proceeding
                if (status == google.maps.GeocoderStatus.OK) {
                    // console.log(results);
                    var totaladdress = (results[3].formatted_address);  // 국가,시,구,동까지 나오는 주소
                    const arr = totaladdress.split(" ");                // address를 공백 기준으로 자름
                    var address=(arr[1] + " "+ arr[2] +" "+ arr[3]);      //대한민국 제외하고 담기
                    console.log(arr[1] + arr[2] + arr[3]);
              
                }
                document.getElementById("current-location").innerHTML = "🚩 현재 위치 : " + address;
               
            });
        }
        function errorCallback(error) {
            alert(error.message);
        }
     

        <!------------------스크롤 위로 올리기----------------->
        var backToTop = () => {
            // Scroll | button show/hide
            window.addEventListener('scroll', () => {
                if (document.querySelector('html').scrollTop > 100) {
                    document.getElementById('go-top').style.display = "block";
                } else {
                    document.getElementById('go-top').style.display = "none";
                }
            });
            // back to top
            document.getElementById('go-top').addEventListener('click', () => {
                window.scrollTo({
                    top: 0,
                    left: 0,
                    behavior: 'smooth'
                });
            })
        };
        backToTop();
        
        
        
        
        <!------------------검색창----------------->
        const inputCheckMain = function(){
            // 공백을 제거한 뒤에 개수를 세던지 한다.
            let headerKeyword = $.trim($("[name=keyword]").val());
            $('[name=keyword]').val(keyword);
            console.log(keyword.length);
            if (keyword.length >= 30) {
               alert("30자 이하로 검색해주세요.");
               return false;
            }
         };
    </script>
</html>
