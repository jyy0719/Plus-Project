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
  /* 전체 */
  * {
    margin: 0;
    padding: 0;
    color: #333;
    font-family: 'NanumSquare', sans-serif !important;
}
/* 본문영역 너비 조정 */

/* #wrapper {
    width: 1200px;
    height: auto;
    margin: 0 auto;

} */

nav {
    height: 64px;
    border-bottom: thistle 1px solid; 
}

nav li {
    display: inline-block;
    font-weight: 800;
    font-size: 20px;
    position: relative;
    top: 24px;
    padding: 5px 20px;
    /* color: #333333; */
   /*  float: left; */
    margin-right: 10px;
}

nav li.nav-left:hover {
    background-color: #1e00ff;
    padding: 5px 20px;
    border-radius: 30px;
    color: white;

}

nav li a {
    text-decoration: none;
}

nav li.nav-left a:hover {
    color: white;
    text-decoration: none;
}

nav li.nav-left a:focus {
    color: white;
    text-decoration: none;

}

/* 메뉴 선택된거 파란색 버튼으로 남아있게 설정 (제이쿼리 관련) */
ul.menu-left li.li-selected {
    background-color: #1e00ff;
    padding: 5px 20px;
    border-radius: 30px;
    color: white !important;

}


a, a:visited, a:hover, a:active {
    color: inherit;
}

/* 로고 관련 */

#logo_img {
    position: relative;
    top: -7px;
    width: auto;
    height: 50px;

}

#logo_a:hover {
    background-color: white;
}

#logo_img:hover {
    background-color: white;
}


nav li #selected {
    background-color: #1e00ff;
    padding: 5px 10px;
    border-radius: 30px;
    color: white;
}

.nav-right{
    float: right;
}

.icon{
    padding-right: 0;
    padding-left: 10px;
}
.icon:hover{
    padding-top: 2px;
}
#icon{
    width: 25px;
    height: 25px;
}

/* 
.hello-user{
    padding-top: 0;
}
.hello-user:hover{
    text-decoration: underline;
    padding-top: 0;
} */

#btncolor{
    background-color: white;
    color: #333;
    border: none;
    padding-top: 0;
    font-size: 18px;
   
}

.btncolor{
    padding-left: 0;
}

.dropli{
    font-size: small;
    position: relative;
    top: -1px;
}
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
        <nav>
            <ul class="menu">
                <li id="logo_a"><a href="#"><img id="logo_img" src="${path}/resources/img/images/logo.png"></a></li>
                <li class="hovereffect"><a href="#">HOME</a></li>
                <li class="hovereffect"><a href="#">가치더하기</a></li>
                <li class="hovereffect"><a href="#">도움더하기</a></li>
                <li class="hovereffect" id="login"><a href="login.jsp">로그인</a></li>
            </ul>
        </nav>

</body>


</html>