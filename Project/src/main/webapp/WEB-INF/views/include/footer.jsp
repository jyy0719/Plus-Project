 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<%--     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Header and Footer</title> --%>
    <!-- css코드삽입 -->
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/footer.css">
    <style>

    </style>
   <%--  <script type="text/javascript" src="${path}/resources/js/jquery-1.12.4.min.js"></script> --%>
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
   
        <footer>
            <ul>
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
            </ul>

        </footer>


</body>

</html>