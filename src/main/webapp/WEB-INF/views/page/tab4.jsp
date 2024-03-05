<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"
    %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" ></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<style>
    .main1 {
        text-align: center;
        align-items: center;
        background-color: WHITE;
    }
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
    <div class="main1">
    <h1 style="border-bottom: 2px solid;">학교장인사말</h1>
        <img src="${contextPath}/resources/image/tab1_1.png" />
</div>
<div class="main1">
    <h1 style="border-bottom: 2px solid;">학교상징</h1>
        <img src="${contextPath}/resources/image/tab1_2.png" />
</div>
	
</body>
</html>