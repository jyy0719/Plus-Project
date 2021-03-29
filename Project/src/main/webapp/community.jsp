<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!--${pageContext.request.contextPath}" 이게 web-app을 가리킨다!!!!!   -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- 그래서 path 써주고 그 아래 소스 파일 이름 지정해주면 된다 ! 이건 진경언니가 준거 !   -->
<link rel="stylesheet" href="${path}/resources/css/reviewList.css">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title>커뮤니티 게시판</title>
    <style>
        .communityContainer{
            margin: 0;
            width: 1140px;
        }
        .inlineContent{
            width: 85%;
            margin: auto;
            padding: 3% 0 5% 0;
        
        }

        .contentBox{
            border: 1px solid rgba(0, 0, 0, 0.171);
            padding-bottom: 5%;
            border-radius: 5px;
            
        }
        .userInfo{
            display: flex;
            /* background-color: tomato; */
        }
        .userComment{
            display: flex;
        }

        /*프로필사진 나오는 곳*/
        #userPic{
            width: 45px; 
            height: 45px;  
            border-radius: 50%;  
            margin:20px 20px 50px 30px ;
            box-shadow: 1px 1px 1px  #8299d879;
        }

        #commentUserPic{
            width: 20px; 
            height: 20px;  
            border-radius: 50%;  
            margin:20px 10px 5px 30px ;
            box-shadow: 1px 1px 1px  #8299d879;
        }
        /*인증사진 위치 및 내용*/
        #certificationPic{
            /* text-align: center; */
            padding-left: 4%;
            width: 70%;
            height: 30%;
            overflow: hidden;
        }

        #certificationContent{
            margin: 4% 10% 2% 4%;
        }

        /*닉네임*/
        #boardNickname{
            font-size: 22px;
            font-weight: 700;
        }
        #commentNickname{
            font-weight: 700;
            margin-right: 30px;
        }

        /*댓글*/
        #commentBox{
            margin:20px 20px 20px 30px ;
            width: 85%;
        }

        #textArea{
            resize: none; font-size: 15px;
            margin-right: 2%;
            border-radius: 2%;
        }
        #writeComment{
            display: flex;
        }

        #submitCommBtn input{
            display: inline-block;
            padding: 10px 20px;
            color: #999;
            /* vertical-align: middle; */
            background-color: #fdfdfd;
            border: 0;
            cursor: pointer;
            border-radius: 5px;
            border : 1px solid #eee;
        }
        
    </style>
</head>
<body>
    <div class="communityContainer">
        <div class="inlineContent">
            <h1>커뮤니티 게시판</h1>
            <div class="contentBox">
                <div class="userInfo">
                    <img src="${path}/resources/img/하이킹.PNG"  id="userPic">
                    <p id="boardNickname">초록모자</p>
                </div>
                <div class="certification">
                    <div id="certificationPic"><img src="${path}/resources/img/한강.PNG"  style=" height: 70%;" ></div>
                    <p id="certificationContent">와 오늘은 진짜 찐 공부했네요 진짜 생애 태어나서 처음으로 22시간 공부했습니다. 인증이요!!!! 다른분들도 22시간 도전해보세요 몸과정신은 힘들지만 짜릿하네요❤</p>

                    <div id="commentBox">
                        <hr><br>
                    <form action="#" method="post">
                        <div id="writeComment">
                            <textarea name="" cols="80" rows="1" id="textArea" placeholder="댓글을 입력해보세요!"></textarea><br>
                            <div id="submitCommBtn"> <input type="submit" value="등록하기"></div>
                        </div>
                    </form>
                    </div>
                    <div class="userComment">
                        <img src="${path}/resources/img/하이킹.PNG"  id="commentUserPic"> <!--사진 안넣으면 지우기-->
                        <p id="commentNickname" value="">왕감자고구마</p>
                        <p>오늘도 열심히 하셨네요 ? 저는 오늘은 쉽니다...</p>
                    </div>
                    
                </div>
            </div>
        </div>
    </div> <!--communityContainer end-->
</body>
</html>