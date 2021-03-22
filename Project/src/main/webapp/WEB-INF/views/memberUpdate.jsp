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
	
	//휴대폰번호 유효성 검사. 번호 11자리 
isMobile = function(){
    var phoneVal = $("#mobile").val();
    var regExp = /^\d{11}$/;
  /*  var regExp = /^\d{3}-\d{3,4}-\d{4}$/; */
    if(phoneVal.match(regExp) != null){
        alert('good')
    }else{
        alert('bad')
    }
}; 


	
	//비밀번호 유효성 검사
isPw1 = function(){
    var pwVal = $("#pswd1").val();
                             //특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
if(pwVal.match(regExp) != null){
 
  document.getElementById('alertTxt').innerHTML = "적합한 비밀번호입니다.";
}else{
	alert("영문 대 소문자, 숫자, 특수문자를 조합한 8~16자의 비밀번호를 사용하세요.")
	document.getElementById('alertTxt').innerHTML = "";
  document.getElementById('alertTxt').style.display = 'block';
}
};


//비밀번호 재확인 시 일치하는지 여부
checkPw = function() {
    var p1 = document.getElementById('pswd1').value;
    var p2 = document.getElementById('pswd2').value;
    if( p1 != p2 ) {
    	alert("비밀번호가 일치하지 않습니다")
    	document.getElementById('alertTxt1').innerHTML = "";

      return false;
    } else{
    	 document.getElementById('alertTxt1').innerHTML = "비밀번호가 일치합니다";
         document.getElementById('alertTxt1').style.display = 'block';

      return true;
    }

  }


</script>
</head>

<body>
    <!-- header -->
    <div id="header">
        <h1>회원정보수정</h1>
        <!-- <img src="../images/logo.png" id="logo"> -->
    </div>

  <form action="memberUpdate.do" method="POST" enctype="multipart/form-data">

    <!-- wrapper -->
    <div id="wrapper">
<<<<<<< HEAD

=======
<input type="hidden" name="memberEmail"  value="${user.memberNum }">
>>>>>>> 0013c97aec50c3409a8d08f0a8436ccb3b5c1880
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
                        <input type="text" name="memberEmail" id="email" class="int1" maxlength="20" value="${user.memberEmail }" readonly>
                        <!-- <input type="button" class="check" value="중복체크"> -->
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
            <!-- NAME -->
            <div>
                <h3 class="join_title"><label for="name">이름</label></h3>
                <span class="box int_name">
                    <input type="text" name="memberName" id="name" class="int1" maxlength="20" value="${user.memberName }" readonly>
                    <!-- <input type="button" class="check" value="중복체크하기"> -->
                </span>
                <span class="error_next_box"></span>
            </div>


                <!-- nickNAME -->
                <div>
                    <h3 class="join_title"><label for="name">닉네임</label></h3>
                    <span class="box int_name">
                        <input type="text" name="memberNickname" id="nickname" class="int1" maxlength="20" value="${user.memberNickname }">
                        <input type="button" class="check" value="중복체크하기">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" name="memberPhone" id="mobile" class="int1" maxlength="16" placeholder=" 하이픈 없이 입력해주세요" value="${user.memberPhone }">
                        <input type="button" class="check" value="번호변경하기">
                    </span>
                    <span class="error_next_box"></span>
                </div>


                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" name="memberPassword" id="pswd1" onchange="isPw1()" class="int" maxlength="20" value="${user.memberPassword }">
                        <span id="alertTxt"></span>

                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" id="pswd2" onchange="checkPw()" class="int" maxlength="20">
		                    <span id="alertTxt1"></span>
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- 보유 포인트 -->
                <div>
                    <h3 class="join_title"><label for="point">보유 포인트</label></h3>
                    <span class="box int_point">
                        <input type="text" name="memberPoint" id="point" class="int" maxlength="20" value="${user.memberPoint }" readonly>
                    </span>
                    <span class="error_next_box"></span>
                </div>


                <div class="btn_area">
                <button type="submit" id="btnJoin">
                    <span>수정하기</span>
                </button>
             </div>
        </div>
        <!--content1-->
    </div>
    <!-- wrapper -->
  </form>
</body>

</html>