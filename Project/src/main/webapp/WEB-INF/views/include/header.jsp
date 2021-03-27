<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>LoginHeader</title>
    <!-- css코드삽입 -->

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/header.css">
    <style>

    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>


    <script type="text/javascript" src="${path}/resources/js/jquery-1.12.4.min.js"></script>

    <link rel="stylesheet" type="text/css" href="${path}/resources/css/header.css">
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    <script>
        $(document).ready(function () {

            $('.hovereffect').on("click", function () {

                if ($("ul.menu-left li.hovereffect").hasClass("li-selected")) {
                    $("ul.menu-left li.hovereffect").removeClass("li-selected");
                }

                $(this).addClass("li-selected");

            });

        });


        //로그인 정보 받아오는 함수 같긴 한데 .. 

        Kakao.init("9ce759cfc8b480d36084d93d5b5d195f")

 /*        Kakao.init("9ce759cfc8b480d36084d93d5b5d195f")
>>>>>>> 170baa291e8511c0350858cb9578227bcf00169e
=======
        Kakao.init("9ce759cfc8b480d36084d93d5b5d195f")
>>>>>>> a81e2f39fa7755a39c42fca95b40ef207c94d9ab

        Kakao.Auth.login({
            url:'v2/user/me',
            success: function(res){
                console.log(res);
                
                var nickname = res.properties.nickname;
                var email = res.kakao_acount.email;
                var html = '<BR>' + nickname + '<BR>' + email;

            $('body').append(html);

                 
            }

        })


        //카카오 로그아웃시키는 함수 ... ? 
        function kakaoLogout() {
    if (!Kakao.Auth.getAccessToken()) {
      alert('Not logged in.')
      return
    }
    Kakao.Auth.logout(function() {
      alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken())
    })

  } */



    </script>
</head>

<body>
    <!-- 사실상 헤더가 없어요  -->

    <header></header>
    <!-- 본문 너비 정하는 용으로 wrapper 아이디 설정 -->
    <div id="wrapper">

    <!-- 본문 너비 정하는 용으로 wrapper 아이디 설정 -->

    <header></header>
    <!-- 본문 너비 정하는 용으로 wrapper 아이디 설정 -->
    <div id="wrapper">

        <!-- navi bar가 사실상 저희 헤더입니다 -->
        <nav>
            <ul class="menu-left">
                <li id="logo_a"><a href="index.jsp"><img id="logo_img" src="${path}/resources/img/images/logo.png"></a></li>

                <li class="hovereffect nav-left"><a href="#">HOME</a></li>

                <li class="hovereffect nav-left li-selected"><a href="#">HOME</a></li>

                <li class="hovereffect nav-left"><a href="#">HOME</a></li>

                <li class="hovereffect nav-left"><a href="#">가치더하기</a></li>
               	<li class="hovereffect nav-left"><a href="#">도움더하기</a></li>
 
 
 <!-- 로그인정보 없을 때는 로그인버튼 보이게 , 로그인 후에는 채팅, 알람, 드롭다운 버튼 보이게 했습니다   -->
           <c:choose>
            <c:when test = "${user.memberEmail != null }"> <!-- 로그인 정보가 있으면 -->
             	<li class="nav-right btncolor">
                    <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" id="btncolor"><b>${user.memberNickname }</b>님, 환영합니다
                        <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                        <form>
                        <li class="dropli"><a href="memberUpdate.jsp">My Profile</a></li>
                        </form>
                      <form action="logout.do" method="get">
                      <!--  onclick="kakaoLogout()" -->
                        <li class="dropli api-btn"><a href="logout.jsp">LogOut</a></li>
                      </form>
                        </ul>
                    </div>
                </li>
                <li class="nav-right icon"><a href="#"><img src="${path}/resources/img/images/chat.png" id="icon"></a></li>
                <li class="nav-right icon"><a href="#"><img src="${path}/resources/img/images/bell1.png" id="icon"></a></li>
             </c:when>
             <c:otherwise><!-- 로그인 정보가 없으면  -->

                <li class="nav-right nav-left hovereffect" id="login"><a href="login.jsp">로그인</a></li>

                <li class="nav-right nav-left hovereffect" id="login"><a href="loginPage.do">로그인</a></li>

                <li class="nav-right nav-left hovereffect" id="login"><a href="login.do">로그인</a></li>

             
             </c:otherwise>
          </c:choose>
            </ul>          
        </nav>

    </div> <!-- id="wrapper" -->
</body>
</html>