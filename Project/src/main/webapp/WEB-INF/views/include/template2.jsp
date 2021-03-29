<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--  공통으로 import하는 소스들  -->
  
</head>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer"/> 
</html>