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
    <title>Document</title>
    <script>
    </script>
    <style>
        .Container {
            margin: 0;
            width: 1140px;
        }

        .Content {
            padding: 40px 60px;
            height: 100vh;
        }

        #point {
            font-weight: bold;
            font-size: 33px;
        }

        #currentPoint {
            display: flex;
            border: 1px solid rgba(189, 186, 186, 0.829);
            width: 85%;
            margin-bottom: 4%;
            border-radius: 2%;
        }

        #nowPoint {
            font-size: 22px;
            padding: 7px;
        }

        #currentPoint button {
            float: right;
        }

        #currentPoint table {
            border-spacing: 40px;
        }

        #chargeBtn input {
            display: inline-block;
            padding: 18px 26px;
            color: #999;
            background-color: #eee;
            border: 0;
            cursor: pointer;
            border-radius: 5px;
            margin-left: 52%;
        }

        #chargeBtn {
            text-align: center;
            margin: auto;
            float: right;
            font-weight: bold;
        }

        #chargeBtn input {
            font-size: 20px;
            font-weight: bold;
        }

        #tableWrapper {
            border: 1px solid rgba(189, 186, 186, 0.829);
            width: 85%;
            height: 60%;
            border-radius: 2%;
        }

        #tableWrapper table {
            width: 100%;
            border-collapse: collapse;
        }

        #tableWrapper table td {
            text-align: center;
            padding: 7px;

        }

        #tableWrapper table th {
            background-color: grey;
            padding: 13px;
        }
    </style>
</head>

<body>
    <div class="Container">
        <div class="Content">
            <h1>회원관리</h1>
            <!-- <div id="currentPoint">
                <table>
                    <tr>
                        <th id="nowPoint">나의 현재 포인트</th>
                        <th id="point"> ${currentMemberPoint} 원</th>
                    </tr>
                </table>
                <div id="chargeBtn">
                    <input type="button" value="포인트충전" id="showPopup" />
                </div>
            </div> -->
            <div id="tableWrapper">
                <table class="useInfo">
                    <tr>
                        <th>회원Email</th>
                        <th>회원이름</th>
                        <th>가입일</th>
                        <th>상세보기</th> 
                    </tr>
                    
 <%--                <c:if test="${empty paymentList }">
                    <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                       <tr><td colspan="4" lowspan="2" align="center" style="font-size:20px; font-weight:bold;">포인트 이용내역이 없습니다.</td></tr>
                    </c:if> --%>
                    
             <%--        <c:if test="${memberList != null || paymentList != ''}"> --%>
                       <c:forEach var="ml" items="${memberList }" >
                          <tr>
                             <td>${ml.memberEmail }</td>
                             <td>${ml.memberName }</td>
                             <td>${ml.memberJoindate }</td>
                             <td>상세보기</td>
                          </tr>
                       </c:forEach>
              <%--       </c:if>  --%>
                </table>
            </div>
        </div>
    </div>
</body>
</html>