<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!--${pageContext.request.contextPath}" 이게 web-app을 가리킨다!!!!!   -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- 그래서 path 써주고 그 아래 소스 파일 이름 지정해주면 된다 ! 이건 진경언니가 준거 !   -->
<link rel="stylesheet" href="${path}/resources/css/reviewList.css">
    <script type="text/javascript" src="${path}/resources/js/jquery-1.12.4.min.js"></script>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원관리</title>
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
            height: 65%;
            border-radius: 2%;
        }
        
        #block{
            min-height:415.550px;
        
        }

        #tableWrapper table {
            width: 100%;
            border-collapse: collapse;
            
        }

        #tableWrapper table th {
            text-align: center;
            background-color: grey;
            padding: 13px;
            background-color:#001eff;
            color:white;
        }

        #tableWrapper table td {
            text-align: center;
            padding: 7px;

        }
        #pageArea{
        margin:0 auto;
        position:relative;
        }
        
        .paging{
        margin-top:10px;
        position:absolute;
        left:45%;
        }
        
       .paging > li{
        list-style:none;
        float:left;
        padding:6px 1px;
        }
        
        .span{
        padding:6px 12px;
        border: 1px solid lightgray;
        }
        
        #info, .paging >li :hover{
        text-decoration:none;
        }

    </style>
    <script>
/* 	$(document).ready(function() {

    function fn_view(memberNum){
        
        var form = document.getElementById("tableWrapper");
        var url = "<c:url value='memberUpdate.do'/>";
        url = url + "?memberNum=" + memberNum;
        
        form.action = url;    
        form.submit(); 
    } */
    </script>
</head>

<body>
    <div class="Container">
        <div class="Content">
            <h1>회원관리</h1>
            
           <div id="tableWrapper">
           	 <div id="block">
              <table class="useInfo">
                  <tr>
                  	<th>회원번호</th>
                      <th>회원Email</th>
                      <th>회원이름</th>
                      <th>가입일</th>
                      <th>상세보기</th> 
                  </tr>
                  
                     <c:forEach var="list" items="${list}" >
                        <tr>
                        	 <td>${list.memberNum }</td>
                           <td>${list.memberEmail }</td>
                           <td>${list.memberName }</td>
                           <td>${list.memberJoindate }</td>
                          <td><button><a id="info" href="${path}/memberView.do?memberNum=${list.memberNum}">상세보기</a></button></td>
                      
                        </tr>
                     </c:forEach>
              </table>
               </div> <!-- block -->
					 <div id="pageArea">
						  <ul class="paging">
						    <c:if test="${pmem.prev}">
						    	<li><a href="memberList.do${pmem.makeQuery(pmem.startPage - 1)}">이전</a></li>
						    </c:if> 
						
						    <c:forEach begin="${pmem.startPage}" end="${pmem.endPage}" var="idx">
						    	<li><a href="memberList.do${pmem.makeQuery(idx)}"><span class="span">${idx}</span></a></li>
						    </c:forEach>
						
						    <c:if test="${pmem.next && pmem.endPage > 0}">
						    	<li><a href="memberList.do${pmem.makeQuery(pmem.endPage + 1)}">다음</a></li>
						    </c:if> 
						  </ul>
					 </div><!-- pageArea -->
     
            </div><!-- wrapper -->
        </div>
    </div>
</body>
</html>