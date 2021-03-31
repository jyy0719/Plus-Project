<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="css/1vs1inquiry.css">
    <!-- font -->
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
        integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
    <!-- themify CSS -->
    <link rel="stylesheet" type="text/css" href="icon/themify-icons/themify-icons.css">
</head>
<title>1:1 문의</title>

<body>
    <div class="container">
        <div class="row">
            <!-- 1:1 문의 타이틀 -->
            <div class="title">1:1 문의</div>
        </div>
    </div>
    <!-- 1:1 table -->
    <section>
        <div class="container-fluid">
            <div class="row mb-5">
                <div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
                    <div class="row">
                        <div class="col-12">
                            <h3 class="text-muted text-center mb-3">문의 내역 리스트</h3>
                            <table class="table bg-light text-center">
                                <thead>
                                    <tr class="text-muted">
                                        <th>회원번호</th>
                                        <th>이 메 일</th>
                                        <th> 이   름 </th>
                                        <th>가 입 일</th>
                                        <th>상세보기</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- table row -->
                                    <tr>
                                        <th>1</th>
                                        <th>심재윤</th>
                                        <th>2000만원</th>
                                        <th>2021/03/08</th>
                                        <th><button type="button" class="btn btn-primary btn-sm">메시지</button></th>
                                    </tr>
                                    <!-- table row -->
                                    <tr>
                                        <th>2</th>
                                        <th>박성훈</th>
                                        <th>3000만원</th>
                                        <th>2021/03/08</th>
                                        <th><button type="button" class="btn btn-primary btn-sm">메시지</button></th>
                                    </tr>
                                    <!-- table row -->
                                    <tr>
                                        <th>3</th>
                                        <th>니시무라 리키</th>
                                        <th>1000만원</th>
                                        <th>2021/03/08</th>
                                        <th><button type="button" class="btn btn-primary btn-sm">메시지</button></th>
                                    </tr>
                                    <!-- table row -->
                                    <tr>
                                        <th>4</th>
                                        <th>양정원</th>
                                        <th>2500만원</th>
                                        <th>2021/03/08</th>
                                        <th><button type="button" class="btn btn-primary btn-sm">메시지</button></th>
                                    </tr>
                                    <!-- table row -->
                                    <tr>
                                        <th>5</th>
                                        <th>김선우</th>
                                        <th>1500만원</th>
                                        <th>2021/03/08</th>
                                        <th><button type="button" class="btn btn-primary btn-sm">메시지</button></th>
                                    </tr>
                                    <!-- table row -->
                                    <tr>
                                        <th>6</th>
                                        <th>박종승</th>
                                        <th>3000만원</th>
                                        <th>2021/03/08</th>
                                        <th><button type="button" class="btn btn-primary btn-sm">메시지</button></th>
                                    </tr>
                                    <!-- table row -->
                                    <tr>
                                        <th>7</th>
                                        <th>이희승</th>
                                        <th>1000만원</th>
                                        <th>2021/03/08</th>
                                        <th><button type="button" class="btn btn-primary btn-sm">메시지</button></th>
                                    </tr>
                                    <!-- table row -->
                                    <tr>
                                        <th>8</th>
                                        <th>서영호</th>
                                        <th>7000만원</th>
                                        <th>2021/03/08</th>
                                        <th><button type="button" class="btn btn-primary btn-sm">메시지</button></th>
                                    </tr>
                                </tbody>
                            </table>

                            <!-- pagination -->
                            <nav>
                                <ul class="pagination justify-content-center">
                                    <li class="page-item">
                                        <a href="#" class="page-link py-2 px-3">
                                            <span>&laquo;</span>
                                        </a>
                                    </li>

                                    <!-- 페이지 정보 추가 -->
                                    <li class="page-item active">
                                        <a href="#" class="page-link py-2 px-3">1</a>
                                    </li>
                                    <li class="page-item">
                                        <a href="#" class="page-link py-2 px-3">2</a>
                                    </li>
                                    <li class="page-item">
                                        <a href="#" class="page-link py-2 px-3">3</a>
                                    </li>
                                    <li class="page-item">
                                        <a href="#" class="page-link py-2 px-3">4</a>
                                    </li>

                                    <li class="page-item">
                                        <a href="#" class="page-link py-2 px-3">
                                            <span>&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <!-- end of pagination -->
                        </div>
                        <button type="button" class="btn btn-primary">문의</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- end of table -->



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
    <script src="js/script.js"></script>
</body>

</html>