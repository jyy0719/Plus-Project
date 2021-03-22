<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- 나눔폰트 -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

  <title>Document</title>
</head>

<body>

  <!--------------상세검색 영역--------------->
  <div class="jumbotron">
    <div id="searchform">
      <h5><b>가치 더하기 상세검색</b></h5>
      <hr class="my-4">
      <div id="favorite">
        <label>관심분야</label>
        <select>
          <option>전체 </option>
          <option>운동</option>
          <option>공부</option>
          <option>취미</option>
          <option>습관</option>
        </select>
      </div>

      <div id="onoff">
        <label>온/오프라인</label>
        <select>
          <option>전체</option>
          <option>온라인</option>
          <option>오프라인 </option>
        </select>
      </div>

      <div class=search>

        <form class="box" action="#" method="get" onsubmit="return #">
          <input type="text" name="headerKeyword" size="40" placeholder=" #런데이 #미라클모닝 #다이어트 #영어공부">
          <input type="submit" value="  검색  ">
        </form>
      </div>

    </div>
  </div>

  <!----------------검색분류------------------>
  <div id="sort">
    <ul>
      <a href="">인기순</a>
      <a href="">최신순</a>
      <a href="">마감일순</a>
    </ul>
  </div>

  <!----------------더하기 리스트------------------>
  <section class="gallery-block cards-gallery">
    <div class="gallery-container">

      <div class="row">
        <div class="col-md-6 col-lg-3">
          <div class="card border-0 transform-on-hover">
            <a class="lightbox" href="#">
              <img src="${path}/resources/img/main2.jfif" alt="bestplus1" class="card-img-top">
            </a>

            <div class="card-body">
              <!------------------딱지------------------->
              <div class=spanspace>
                <a href="#" class="badge badge-primary">오프라인</a>
                <a href="#" class="badge badge-danger">주 3일</a>
              </div>
              <h6><a href="#"><b>bonjour! 프랑스어 부실 사람?</b></a></h6>
              <p class="text-muted card-text">
                #외국어공부 #프랑스어 #자기개발
                esttesttesttesttesttesttesttesttesttesttesttesttesttest
              </p>
            </div>
          </div>
        </div>
         <div class="col-md-6 col-lg-3">
          <div class="card border-0 transform-on-hover">
            <a class="lightbox" href="#">
              <img src="${path}/resources/img/main2.jfif" alt="bestplus1" class="card-img-top">
            </a>

            <div class="card-body">
              <!------------------딱지------------------->
              <div class=spanspace>
                <a href="#" class="badge badge-primary">오프라인</a>
                <a href="#" class="badge badge-danger">주 3일</a>
              </div>
              <h6><a href="#"><b>bonjour! 프랑스어 부실 사람?</b></a></h6>
              <p class="text-muted card-text">
                #외국어공부 #프랑스어 #자기개발
                esttesttesttesttesttesttesttesttesttesttesttesttesttest
              </p>
            </div>
          </div>
        </div>
         <div class="col-md-6 col-lg-3">
          <div class="card border-0 transform-on-hover">
            <a class="lightbox" href="#">
              <img src="${path}/resources/img/main2.jfif" alt="bestplus1" class="card-img-top">
            </a>

            <div class="card-body">
              <!------------------딱지------------------->
              <div class=spanspace>
                <a href="#" class="badge badge-primary">오프라인</a>
                <a href="#" class="badge badge-danger">주 3일</a>
              </div>
              <h6><a href="#"><b>bonjour! 프랑스어 부실 사람?</b></a></h6>
              <p class="text-muted card-text">
                #외국어공부 #프랑스어 #자기개발
                esttesttesttesttesttesttesttesttesttesttesttesttesttest
              </p>
            </div>
          </div>
        </div>
         <div class="col-md-6 col-lg-3">
          <div class="card border-0 transform-on-hover">
            <a class="lightbox" href="#">
              <img src="${path}/resources/img/main2.jfif" alt="bestplus1" class="card-img-top">
            </a>

            <div class="card-body">
              <!------------------딱지------------------->
              <div class=spanspace>
                <a href="#" class="badge badge-primary">오프라인</a>
                <a href="#" class="badge badge-danger">주 3일</a>
              </div>
              <h6><a href="#"><b>bonjour! 프랑스어 부실 사람?</b></a></h6>
              <p class="text-muted card-text">
                #외국어공부 #프랑스어 #자기개발
                esttesttesttesttesttesttesttesttesttesttesttesttesttest
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!------------------------페이징----------------------->
    <div class="page-navigation">
      <nav aria-label="Page navigation example"></nav>
      <ul class="pagination">
        <li class="page-item ">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
        <li class="page-item active"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
      </nav>
    </div>
</body>

</html>