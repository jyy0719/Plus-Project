<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>모임상세보기</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <%-- <link rel='stylesheet' type='text/css' href='${path}/resources/css/clubInfo.css'> --%>
    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script> 
<style>
@charset "UTF-8";
*{
    font-family: 'NanumSquare', sans-serif !important;
}
header{
    height:50px;
}

#mainImg{
            position: absolute;
            width: 713px;
            height: 433px;
            left: 120px;
            top: 50px;     
}

aside{
    position: relative;
    top: 50px;
    left: 900px;
    width: 350px;
    height:2000px;
    display: flex;
    flex-direction: column;
}


#tilde{
	font-size: 2em;
}


.stickybox{
    position:sticky;
    top:0;
    width: 350px;
    height: 650px;
    padding: 24px;
    border-radius: 3px;
    box-shadow: rgb(41 42 43 / 16%) 0px 2px 6px -2px;
    border: 1px solid rgb(255, 255, 255);
  
}


#leaderId{
    position: absolute;
    top:0px;

}

.titleInfo{
    width:300px;
    height: 200px;
}

#clubname{
    width: 300px;
    font-size: 30px;
    font-weight: 700;
    padding-top:20px;
    padding-bottom: 10px;
}
.clubInfoTable{
    position:absolute;
    width: 487px;
    height: 531px;
    top: 230px;
    padding-top: 20px;
    padding-bottom: 5px;
}


#location{

    display:flex;
    margin-top:20px;
    width:300px;
    height: 30px;
    
}
#location img{

    width:15px;
    height: 15px;
}
#locationText{
    /* position: absolute; */
    width:300;
    height: 20px;
    margin-left:5px;
}

.selected {
    color:#000;
    font-weight: 600;
 }

a{
    color:#6e7c7c;
}

a:link {text-decoration: none;}

#moreInfoTab{
    float:left;
    padding-right: 50px;
    cursor: pointer;
 
}

#introTab{
    float:left;
    padding-right: 50px;
    cursor: pointer;
}
#reviewTab{
    float:left;
    padding-right: 50px;
    cursor: pointer;
}

article{
    position: absolute;
    width: 720px;
    left: 120px;
    top: 691px;
}

#moreInfo{
    border:1px solid black;
    height: 300px;
    padding-top:40px;
    margin-bottom:30px;
}
#leaderInfo{
    border:1px solid black;
    height: 300px;
    padding-top:40px;
    margin-bottom:30px;
}
#review{
    border:1px solid black;
    height: 300px;
    margin-bottom:50px;
}
#infoLabel{
    padding-top: 10px;
    padding-bottom: 5px;
}

.fstyle{
    font-size: 20px;
    font-weight: 700;
    padding-bottom:10px;
}
#makeDate{
    float:left;
}



#applyBtn{
    position: absolute;
    width: 200px;
    height: 50px;
    left:-5px;
    top: 350px;
    border: 0;
    outline:0;
    color:white;
    background-color: #001eff;
}

#heartBtn{
    position:absolute;
    width:50px;
    height: 50px;
    top:350px;
    left:200px;
    border: 0;
    outline:0;
}

#heartBtn img{
  
    position: absolute;
    width:24px;
    height: 24px;
    left: 25%;
    top:25%;
}
#shareBtn{
    position:absolute;
    width:50px;
    height:50px;
    top:350px;
    left:250px;
    margin-left: 5px;
    border: 0;
    outline:0;
}
#shareBtn img{
  
    position: absolute;
    width:24px;
    height: 24px;
    left: 25%;
    top:25%;
}

section{
    position:relative;
    width: 713px;
}
.stickyWrap{
    position:absolute;
    height:1500px;
    width: 713px;
    left: 120px;
    top: 550px;

}
.stickyTab{
    position:sticky;
    background-color: white;
    z-index: 500;
    top:0;
    color: #6e7c7c;
    width: 720px;
    height: 50px;
    padding-top:20px;
    border-bottom: 1px solid #dddddd;
    font-size: 20px;
    font-weight: 500;
}
#onoff{
    background-color: #00af91;
}
#freq{
    background-color: #ffb26b;
}
</style>
<script>

$(document).ready(function () {

    var $selectMenu = null;
    $(".tabMenu").click(function(){
          
                if ($selectMenu != null){
                    $selectMenu.removeClass("selected");
                }

                $selectMenu = $(this);
                $selectMenu.addClass("selected");
            })
    })
</script>
</head>
<header></header>
<section>
<input name="seq" type="hidden" value="${club.clubNum}"/>
  <img id="mainImg" src="${path}/resources/img/img1.jpg">
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
     ${club.clubContent1}
  </div>
  <div id="leaderInfo">
      ${club.clubContent2}
  </div>
<div id="review">
      여기는 리뷰 쓰는 곳 
</div>
</article>
</section>
<aside>
    <div class="stickybox">
        <div id="leaderId">${club.clubLeader} <span class="badge" id="onoff">${club.clubOnOff}</span> <span class="badge" id="freq">${club.clubFreq}</span> </div>
        <div class="titleInfo">
            <div id="clubname">${club.clubName}</div>
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
</html>