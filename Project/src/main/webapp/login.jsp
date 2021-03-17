<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/login.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script>
        window.Kakao.init("9ce759cfc8b480d36084d93d5b5d195f")

        function kakaoLogin(){
            window.Kakao.Auth.login({
                scope:'profile, account_email',
                success: function(authObj) {
                    console.log(authObj);
                 window.Kakao.API.request({
                    url:'/v2/user/me',
                    success: res => {
                        const kakao_account = res.kakao_account;
                        console.log(kakao_account);
                    }

                 });
                    
                    
                }
            })
        }

    </script>
</head>

<body>
    <!-- 사실상 헤더가 없어요  -->
    <header></header>
    <!-- 본문 너비 정하는 용으로 wrapper 아이디 설정 -->
    <div id="wrapper">
        <!-- navi bar가 사실상 저희 헤더입니다 -->
       

        <!-- 본문영역시작 -->
        <section>
            <div class="main-container">
                <div class="main-wrap">
                <header>
 
                    <div class="logo-wrap">
                        <img src="${path}/resources/img/images/logo.png">
                    </div>
                </header>
           <form action="login.jsp" method="post">
                <section class="login-input-section-wrap">
                    <div class="login-input-wrap" data-validate = "Valid email is: a@b.c">	
                        <input name="memberEmail" value="${UserVO.MemberEmail}" placeholder=" 이메일을 입력해주세요" type="text"></input>
                    </div>
                    <div class="login-input-wrap password-wrap">	
                        <input name="memberPassword" value="${UserVO.MemberPassword }" placeholder=" 비밀번호를 입력해주세요" type="password"></input>
                    </div>
                    <div class="login-stay-sign-in">
                       
                        <label><input type="checkbox" class="remember_me"> <span>Remember me</span></label>
                    </div>
                    <div class="login-button-wrap">
                        <input class="loginbutton" type="submit" value="로그인">
                    </div>
                </section>
           </form>
                <section class="Easy-sign-in-wrap">
                    <!-- <div class="hr-1"></div> -->
                    <!-- <h4>SNS로그인</h4> -->
                    <ul class="sign-button-list">
                        <li><button class="kakao-login"><a href="javascript:kakaoLogin();"><img src="${path}/resources/img/images/kakao.png"></a></button></li>
                        <li><button class="naver-login"><img src="${path}/resources/img/images/naver.PNG"></button></li>
                    </ul>
                    <div class="hr-2"></div>
                   <!--   <ul class="sign-button-list">
                       <a href="#"><li><button class="join-member"><span class="join-member">가입하기</span></button></li></a> 
                    </ul>
                    -->
                    <span><a href="#" id="find-id">아이디 / 비밀번호 찾기</a></span>
                        <p>같이하실래요? <a href="#" class=joinMsg">가입하기</a></p><br/>
                </section>
                
                </div>
            </div>
        </section>
        


        


    </div> <!-- id="wrapper" -->

</body>
</html>