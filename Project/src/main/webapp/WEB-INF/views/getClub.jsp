<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>모임상세보기</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   	<link rel='stylesheet' type='text/css' href='${path}/resources/css/getClub.css'> 
    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script> 
</head>
<header></header>
<section>
<input type="hidden" value="${club.clubNum}" name="clubNum"/>
  <img id="mainImg" src="${path}/resources${club.clubMain_pic}" onerror="this.onerror=null; this.src='${path}/resources/img/img1.jpg'" />
  <div class="stickyWrap">
    <div class="stickyTab">
        <div id="moreInfoTab">
            <a href="#moreInfo" class="tabMenu">상세정보</a> 
        </div>
        <div id="introTab">
            <a href="#leaderInfo" class="tabMenu">리더소개</a>
        </div>
        <div id="reviewTab">
            <a href="#review" class="tabMenu">후기</a>
        </div>
    </div>
  </div>
  <article>
  
  <div id="moreInfo">
  <img class="images" src="${path}/resources${club.clubContent1_pic}"></img> 
     ${club.clubContent1}
  </div>
  <hr>
    <h3>리더 소개</h3>
  <div id="leaderInfo">
  	<img class="images" src="${path}/resources${club.clubContent2_pic}"></img> 
      ${club.clubContent2}
  </div>
  <hr>
  <div class="reviewTitle"><h3>후기<small>(총 ${reviewCount}개)</small></h3></div>
<div id="review">
		<!-- 리뷰 출력 부분  -->
		<c:forEach items="${reviews}" var="review">
		     <div class="userReview">
		        <strong>블루베리</strong>     
		        <div class="reviewRate">
		           ${review.reviewRate}
		        </div>
		        <div id="reviewRegDate">
		       		<fmt:formatDate value="${review.reviewRegDate}" var="changedDate" pattern="yyyy. MM. dd"/>
		       			${changedDate}
		        </div>
		        <div id="reviewText">
		            ${review.reviewContent}
		        </div>
		     </div>
		</c:forEach>
</div>
<div class="newList">

</div>
<button type="button" class="btn" id="moreReviewBtn">더보기</button>
</article>
</section>
<aside>
    <div class="stickybox">
        <div id="leaderId">${club.clubLeader} <span class="badge" id="onoff">${club.clubOnOff}</span> <span class="badge" id="freq">${club.clubFreq}</span> </div>
        <div class="titleInfo">
            <div id="clubname">${club.clubName}</div>
            <!-- 해시태그 출력부분  -->
            <c:forEach items="${tags}" var="tag">
            	<span class="label label-info"># ${tag}</span>
            </c:forEach>
            <div id="location">
                <img src="${path}/resources/img/mapicon.png"></img> 
                <div id="locationText"> 위치표시 </div>
            </div> 
        </div>
        <div class="clubInfoTable">
            <div id="infoLabel">모집종료일</div>
            <div class="fstyle" id="endDate">${club.clubShutDate}</div>
            <div id="infoLabel">모임진행기간</div>
            <div class="fstyle" id="makeDate">${club.clubStartDate}</div>
            <div id="tilde"> ~ </div>
            <div class="fstyle" id="shutDate">${club.clubMakeDate}</div>
            <div id="infoLabel">참가인원</div>
            <div class="fstyle" id="people"> ${club.clubCurnum}명 / ${club.clubMax}명 </div>
            <div id="infoLabel">참가비</div>
            <div class="fstyle" id="amount">${club.clubFee}P</div>
                <button type="button" class="btn" id="applyBtn">신청하기</button>
                <button type="button" class="btn" id="heartBtn"><img src="${path}/resources/img/heart.png"></button>
                <button type="button" class="btn" id="shareBtn"><img src="${path}/resources/img/share.png"></button>
        </div>
    </div>
</aside>
<footer></footer>

<script>

$(document).ready(function () {
	
	/* 탭메뉴  */
    var $selectMenu = null;
    $(".tabMenu").click(function(){
          
                if ($selectMenu != null){
                    $selectMenu.removeClass("selected");
                }

                $selectMenu = $(this);
                $selectMenu.addClass("selected");
            })

	
	
    let count = $("#review").find(".reviewRate").length;
    
	for(var i=0; i<count; i++){
    let rating =  $(".reviewRate").contents()[i].textContent;
    	
         if(rating==1){
        	 rating = "★☆☆☆☆"
         } else if (rating==2){
        	 rating = "★★☆☆☆"
         } else if (rating==3){
        	 rating = "★★★☆☆"
         } else if (rating==4){
        	 rating ="★★★★☆"
         } else {
        	 rating = "★★★★★"
         }
         
         $(".reviewRate").contents()[i].textContent= rating;
	} 
	 
	 
	 let reviewCnt = '${reviewCount}'   
	 console.log(reviewCnt)
				// limit으로 넣어줄 값 
				let startIndex = 0;	
	 			// 5개씩 로딩 
				let step = 5;	
		  	
			    //더보기 버튼 클릭시
			    $('#moreReviewBtn').click(function(){
					startIndex += step;
					console.log(startIndex)
					getMoreReview(startIndex);
				});
			    
			    // 더보기
				function getMoreReview(startIndex){
					$.ajax({
						type: "post",
						async: "true",
						dataType: "json",
						data: JSON.stringify({
							clubNum:'${club.clubNum}',
							startIndex:startIndex
						}),
						contentType: "application/json",
						url: "/plus/getMoreReview.do",
			            success: function (data, textStatus) {
			            	console.log(data);
			            	let reviewList = "";
		                    for(i = 0; i < data.length; i++){
								//let newList = '<div id="review">';
		                        let  newList = '<div class="userReview">';
		                            // nickname 아직 안받아와서 
		                        newList += '<strong>블루베리</strong>';
		                        if(data[i].reviewRate == 1){
		                            newList += '<div class="reviewRate">★☆☆☆☆</div>';
		                        } else if (data[i].reviewRate == 2){
		                            newList += '<div class="reviewRate">★★☆☆☆</div>';
		                        
		                        } else if (data[i].reviewRate == 3){
		                            newList += '<div class="reviewRate">★★★☆☆</div>';
		                
		                        } else if (data[i].reviewRate == 4){
		                            newList += '<div class="reviewRate">★★★★☆</div>';
		                        
		                        } else if (data[i].reviewRate == 5){
		                            newList += '<div class="reviewRate">★★★★★</div>';
		                        }
		                        newList += '<div id="reviewRegDate">' + data[i].reviewRegDate + '</div>';
		                        newList += '<div id="reviewText">' + data[i].reviewContent + '</div></div>';
		                        reviewList += newList;
					
								}
				            	$(reviewList).appendTo($(".newList")).slideDown();
				        		// 더보기 버튼 삭제
				            	if(startIndex + step > reviewCnt){
				        			$('#moreReviewBtn').remove();
				        		}
			            	}
						});
					}
})

</script>
</html>