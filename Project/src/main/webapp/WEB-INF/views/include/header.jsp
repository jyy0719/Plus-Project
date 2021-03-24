<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<!-- css코드삽입 -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/header.css">
<style>
</style>
<script type="text/javascript"
	src="${path}/resources/js/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function() {

		$('.hovereffect').on("click", function() {

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
	<!-- 본문 너비 정하는 용으로 wrapper 아이디 설정 -->
	<!--     <div id="wrapper">
 -->
	<!-- navi bar가 사실상 저희 헤더입니다 -->
	<!-- id="selected" 나중에 자바스크립트로 수정할 부분 -->
	<nav>
		<ul class="menu">
			<li id="logo_a"><a href="#"><img id="logo_img"
					src="${path}/resources/img/images/logo.png"></a></li>
			<li class="hovereffect"><a href="#">HOME</a></li>
			<li class="hovereffect"><a href="#">가치더하기</a></li>
			<li class="hovereffect"><a href="#">도움더하기</a></li>
			<li class="hovereffect" id="login"><a href="login.jsp">로그인</a></li>
		</ul>
	</nav>
 <title>LoginHeader</title>
    <!-- css코드삽입 -->
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
 /*        Kakao.init("9ce759cfc8b480d36084d93d5b5d195f")

        Kakao.Auth.login({
            url:'v2/user/me',
            success: function(res){
                console.log(res);
                
                var nickname = res.properties.nickname;
                var email = res.kakao_acount.email;
                var html = '<BR>' + nickname + '<BR>' + email;

            $('body').append(html);


	<!-- 본문영역시작 -->

	<!-- <section>

<!--         <section>

            <br /><br /><br />
            <div style="width: auto; height: 300px; background-color:lightgray; 
                font-size:80px; color:blue; text-align: center;">
                <br />picture

                 
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


	<!-- 푸터 시작 -->
	<!--  
        <footer>
        -->

	<!--  <ul>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">이용약관</a></li>
                <li><a href="#">문의사항</a></li>-->


    </script>
</head>

<body>
    <!-- 사실상 헤더가 없어요  -->
    <!-- 본문 너비 정하는 용으로 wrapper 아이디 설정 -->
        <!-- navi bar가 사실상 저희 헤더입니다 -->
        <nav>
            <ul class="menu-left">
                <li id="logo_a"><a href="index.jsp"><img id="logo_img" src="${path}/resources/img/images/logo.png"></a></li>
                <li class="hovereffect nav-left li-selected"><a href="#">HOME</a></li>
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
                <li></li>
            </ul> -->
	<!--    </div>  -->
	<!-- id="wrapper" -->


	<!--  
        </footer>
        -->
	</div>
	<!-- id="wrapper" -->


                <li class="nav-right icon"><a href="#"><img src="${path}/resources/img/images/chat.png" id="icon"></a></li>
                <li class="nav-right icon"><a href="#"><img src="${path}/resources/img/images/bell1.png" id="icon"></a></li>
             </c:when>
             <c:otherwise><!-- 로그인 정보가 없으면  -->
                <li class="nav-right nav-left hovereffect" id="login"><a href="loginPage.do">로그인</a></li>
             
             </c:otherwise>
          </c:choose>
            </ul>          
        </nav>

</body>

</html>