<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>

   
</head>
<body>
 <script type="text/javascript" src="${path}resources/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			alert("로그아웃 되었습니다.");
		location.href = "main.do" ;
		});
	</script>
	<%
		session.invalidate();
	%>


</body>
</html>