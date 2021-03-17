<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>회원정보수정</title>
    <link rel="stylesheet" href="${path}/resources/css/memberUpdate.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
	<script type="text/javascript" src="${path}/resources/js/jquery-1.12.4.min.js"></script>
<script>

function setThumbnail(event){
		var reader = new FileReader();
		reader.onload = function(event){
			var target = document.querySelector("div#image_container");
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
                        target.innerHTML = '';
			target.append(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}



</script>
</head>

<body>
    <!-- header -->
    <div id="header">
        <h1>회원정보수정</h1>
        <!-- <img src="../images/logo.png" id="logo"> -->
    </div>


    <!-- wrapper -->
    <div id="wrapper">

        <!-- content1-->
        <div class="content1">      
                <!-- profile pic -->
                <div class="pro_pic_area">
                    <div id="image_container"></div>
                <div class="filebox"> 
                </div>
   	                <label class="picbutton" for="pic_upload_button"><div class="picbutton">사진첨부하기</div></label>
                    <input id="pic_upload_button" type="file" accept="image/*" onchange="setThumbnail(event);" value="사진바꾸기">
                </div>

                <!-- ID(Email) -->
                <div>
                    <h3 class="join_title">
                        <label for="email">이메일(ID)</label>
                    </h3>
                    <span class="box int_email">
                        <input type="text" id="email" class="int1" maxlength="20">
                        <!-- <input type="button" class="check" value="중복체크"> -->
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
            <!-- NAME -->
            <div>
                <h3 class="join_title"><label for="name">이름</label></h3>
                <span class="box int_name">
                    <input type="text" id="name" class="int1" maxlength="20">
                    <!-- <input type="button" class="check" value="중복체크하기"> -->
                </span>
                <span class="error_next_box"></span>
            </div>


                <!-- nickNAME -->
                <div>
                    <h3 class="join_title"><label for="name">닉네임</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" class="int1" maxlength="20">
                        <input type="button" class="check" value="중복체크하기">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="mobile" class="int1" maxlength="16">
                        <input type="button" class="check" value="번호변경하기">
                    </span>
                    <span class="error_next_box"></span>
                </div>


                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="pswd1" class="int" maxlength="20">
                        <span id="alertTxt">사용불가</span>

                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="text" id="pswd2" class="int" maxlength="20">

                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- 보유 포인트 -->
                <div>
                    <h3 class="join_title"><label for="point">보유 포인트</label></h3>
                    <span class="box int_point">
                        <input type="text" id="point" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>


                <div class="btn_area">
                <button type="button" id="btnJoin">
                    <span>수정하기</span>
                </button>
             </div>
        </div>
        <!--content1-->

     


    </div>
    <!-- wrapper -->
</body>

</html>