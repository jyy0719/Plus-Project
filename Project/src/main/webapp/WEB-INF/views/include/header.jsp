<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Header</title>
    <!-- css코드삽입 -->
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/header.css">
    <style>

    </style>
    <script type="text/javascript" src="${path}/resources/js/jquery-1.12.4.min.js"></script>
    <script>
        $(document).ready(function () {

            $('.hovereffect').on("click", function () {

                if ($("ul.menu li.hovereffect").hasClass("li-selected")) {
                    $("ul.menu li.hovereffect").removeClass("li-selected");
                }

                $(this).addClass("li-selected");

            });

        });
    </script>
</head>

<body>
    <!-- 사실상 헤더가 없어요  -->
    <header></header>
    <!-- 본문 너비 정하는 용으로 wrapper 아이디 설정 -->
    <div id="wrapper">
        <!-- navi bar가 사실상 저희 헤더입니다 -->
        <!-- id="selected" 나중에 자바스크립트로 수정할 부분 -->
        <nav>
            <ul class="menu">
                <li id="logo_a"><a href="#"><img id="logo_img" src="${path}/resources/img/images/logo.png"></a></li>
                <li class="hovereffect"><a href="#">HOME</a></li>
                <li class="hovereffect"><a href="#">가치더하기</a></li>
                <li class="hovereffect"><a href="#">도움더하기</a></li>
                <li class="hovereffect" id="login"><a href="login.jsp">로그인</a></li>
            </ul>
        </nav>





        <!-- 본문영역시작 -->
<!--         <section>
            <br /><br /><br />
            <div style="width: auto; height: 300px; background-color:lightgray; 
                font-size:80px; color:blue; text-align: center;">
                <br />picture

            </div>
            본문영역입니다<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

        </section> -->





        <!-- 푸터 시작 -->
        <footer>
           <!--  <ul>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">이용약관</a></li>
                <li><a href="#">문의사항</a></li>

            </ul>
            <ul>
                <li id="footerAddress">
                    <br />
                    <b>더하기+</b> | 서울특별시 마포구 백범로 23 구프라자 지하 1층 <br />
                    <b>대표:</b> 유정연 | <b>함께하는사람들 :</b> 배진경 이현정 천혜미 황순근<br />
                    Copyright 2021 . All rights reserved.<br /><br />
                </li>
                <li></li>
            </ul> -->

        </footer>
    </div> <!-- id="wrapper" -->

</body>

</html>