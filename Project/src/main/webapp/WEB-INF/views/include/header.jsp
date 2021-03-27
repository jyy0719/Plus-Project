<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- css코드삽입 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/header.css">
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/jquery-1.12.4.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
/* 
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
 */





    </script>
</head>

<body>
    <!-- 사실상 헤더가 없어요  -->
  
    <!-- 본문 너비 정하는 용으로 wrapper 아이디 설정 -->

        <!-- navi bar가 사실상 저희 헤더입니다 -->
        <nav>
            <ul class="menu-left">
                <li id="logo_a"><a href="main.do"><img id="logo_img" src="${path}/resources/img/images/logo.png"></a></li>
                <li class="hovereffect nav-left"><a href="#">HOME</a></li>
                <li class="hovereffect nav-left"><a href="#">가치더하기</a></li>
                  <li class="hovereffect nav-left"><a href="expert.do">도움더하기</a></li>
 
 
 <!-- 로그인정보 없을 때는 로그인버튼 보이게 , 로그인 후에는 채팅, 알람, 드롭다운 버튼 보이게 했습니다   -->
           <c:choose>
            <c:when test = "${user.memberEmail != null }"> <!-- 로그인 정보가 있으면 -->
                <li class="nav-right btncolor">
                    <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" id="btncolor"><b>${user.memberNickname }</b>님, 환영합니다
                        <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                        <form>
                        <li class="dropli"><a href="memberUpdate.do">My Profile</a></li>
                        </form>
                      <form action="logout.do" method="get">
                      <!--  onclick="kakaoLogout()" -->
                        <li class="dropli api-btn"><a href="logout.do">LogOut</a></li>
                      </form>
                        </ul>
                    </div>
                </li>
                <li class="nav-right icon"><a href="chat.do?memberNum=${user.memberNum}" target="_blank"><img src="${path}/resources/img/images/chat.png" id="icon"></a></li>
                <li class="nav-right icon"><a href="#"><img src="${path}/resources/img/images/bell1.png" id="icon"></a></li>
             </c:when>
             <c:otherwise><!-- 로그인 정보가 없으면  -->
                <li class="nav-right nav-left hovereffect" id="login"><a href="login.do">로그인</a></li>
             
             </c:otherwise>
          </c:choose>
            </ul>          
        </nav>






      
   

</body>

</html>