<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>


</head>
<body>
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



</body>
</html>