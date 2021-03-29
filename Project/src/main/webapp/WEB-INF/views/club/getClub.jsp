<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임상세보기</title>
<link rel='stylesheet' type='text/css' href='${path}/resources/css/getClub.css'>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
</head>
<wrap class="clearfix">
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
      <img class="images" src="${path}/resources${club.clubContent1_pic}" onerror="this.style.display='none';" />
         ${club.clubContent1}
      </div>
      <hr>
        <h3>리더 소개</h3>
      <div id="leaderInfo">
          <img class="images" src="${path}/resources${club.clubContent2_pic}" onerror="this.style.display='none';" /> 
          ${club.clubContent2}
      </div>
      <hr>
      <div class="reviewTitle"><h3>후기<small>(총 ${reviewCount}개)</small></h3></div>
    <div id="review" class="clearfix">
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
    <div class="newList">
       
    </div>
    	<button type="button" class="btn" id="moreReviewBtn">더보기</button>
    </div>
    </article>
    </section>
    <section id="right_con">
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
                    <!-- 공유 버튼  -->
                    <button type="button" class="btn" id="shareBtn" onclick="sendLink()"><img id="file" src="${path}/resources/img/share.png"></button>
                    
                </div>
            </div>
        </aside>
    </section>
</wrap>
<!-- 카카오 link api -->
<script>
  Kakao.init('c727ac6af8f4ea892e4524df5eed6359');
  Kakao.isInitialized();

    function sendLink() {
      Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
          title: 'PLUS 모임!',
          description: '"${club.clubName}" 모임에 지금 바로 참여해보세요~',
          imageUrl:
            'https://postfiles.pstatic.net/MjAyMTAzMjFfMTYy/MDAxNjE2MzMxNjMzMTQy.AqxK620MPDQyOyUWo0DQaD2gX7k63f360KEStS_8LhUg.2HGpYONTIq7XJd6uKdSkvOCEsJu70nUTujm9HSGnXG8g.PNG.jk940816/logo.png?type=w966',
          link: {
            mobileWebUrl: 'http://localhost:9999/plus/getClub.do',
            webUrl: 'http://localhost:9999/plus/getClub.do',
          },
        },
        social: {
          likeCount: 286,
          commentCount: ${reviewCount},
        },
        buttons: [ 
          {
            title: '웹으로 보기',
            link: {
              mobileWebUrl: 'http://localhost:9999/plus/getClub.do',
              webUrl: 'http://localhost:9999/plus/getClub.do',
            },
          },
          {
            title: '앱으로 보기',
            link: {
              mobileWebUrl: 'http://localhost:9999/plus/getClub.do',
              webUrl: 'http://localhost:9999/plus/getClub.do',
            },
          },
        ],
      })
    }
  </script>
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
 
	 if(reviewCnt<=5){
		 $('#moreReviewBtn').css("display","none");
	 }

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
			            success: function (data) {
			            	console.log(data);
			            	let reviewList = "";
		                    for(i = 0; i < data.length; i++){
		                        let  newList = '<div class="userReview">';
		                        newList += '<strong>'+ data[i].members.memberNickname + '</strong>';
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
			    
			    $("#applyBtn").click(function(){
			    	$.ajax({
						type: "post",
						data: {
							clubNum:'${club.clubNum}',
							memberNum:"3"
						},
						url: "/plus/apply.do",
						
			            success: function (data) {
			            	console.log(data);
				            	if(data==1){
				            		alert("모임 신청이 완료되었습니다!");
				            	} else if(data==0){
				            		alert("이미 신청한 모임입니다!");
				            	}
			            	},
			            error: function() {
			            	  alert("error");
			            	}
						});
			    	
			    })
})
</script>
<script>
 
console.log("하트확인 전 ")
if(${isThereHeart == 0}){
	state=0
}else{
	state=1
}
 console.log("하트확인 후 " + state)

function toggleImg(){
	var state = document.getElementById("heartInput").value; 
	console.log(state);
	if(state==0){
		 state=1;
     document.getElementById("heartImg").src = "${path}/resources/img/blackheart.png"; 
	$.ajax({
		type: "post",
		data: {	
			clubNum:'${club.clubNum}',
			memberNum:"3",
			clubName: '${club.clubName}'
		},
		url: 'insertHeart.do',
        success: function (result) {
        	console.log(result);
				console.log(result)
  				alert(result);
				console.log(state)
        	},
        error: function() {
        	  alert("error");
        	}
		});
	 
	
	}else{
		state=0; 
		document.getElementById("heartImg").src = "${path}/resources/img/heart.png";
		 
		 $.ajax({
				type: "post",
				data: {
					clubNum:'${club.clubNum}',
					memberNum:"3"
				},
				url: 'deleteHeartOne.do',
		        success: function (result) {
		        	console.log(result);
						console.log(result)
		  				alert(result);
		        	},
		        error: function() {
		        	  alert("error");
		        	}
				});
	}
} 

</script>
</html>