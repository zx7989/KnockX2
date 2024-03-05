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
<title>하단 부분</title>
<style>
	p{	
		font-family: "Century Gothic", "Lato", sans-serif;
		font-size:18px;
		text-align:center;
		display: inline-block;
	}
	#footer{
		float: left;
		clear:both;
		background-color: #000000;
		width: 100%;
		color: #ffffff;
		height:152px;
		text-align: center;
		
		bottom: 0px;
		margin:0 auto;
		bottom:0px;
	}

	.footer-img{
		float:left;
	}
	.footer-wrap address{
		font-size: 0.9em;
    	line-height: normal;
    	display: block;
    	color: #ffffff;
    	margin-left: 210px;
	}
	.footer-wrap p{
		color: #ffffff;
    	font-size: 0.9em;
    	line-height: normal;
    	margin: 5px 0 0 120px;
		
	}

	.ft-ul{
		
	
    	padding-bottom: 20px;
    	display: block;
	}
	.ft-ul li{
		
		list-style-type: none;
		display: inline-block;
		font-size: 0.85em;
	}
	.ft-ul li a{
		color:#ffffff;
	}
	address a:link{
		color: #ffffff;
		text-decoration: none;
	}
	address a:visited{
		color: yellow;
		text-decoration: none;
	}
	address a:hover{
		color: aqua;
		text-decoration: none;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<footer class="footer-wrap">
		<img class="footer-img" src="${contextPath}/resources/image/headlogo1.png" width="100px" style="margin-left:100px; margin-top:10px;">
		<div class="ft-box">
			<ul class="ft-ul">
				<li><a href="https://www.pipc.go.kr/np/default/page.do?mCode=H010000000"/>개인정보처리방침 |</li>
				<li><a href="#"/>청렴행정 |</li>
				<li><a href="#"/>이메일수집거부 |</li>
				<li><a href="#"/>학교홈페이지관리규정 |</li>
				<li><a href="#"/>홈페이지 건의사항 |</li>
				<li><a href="#"/>교육행정서비스현장 |</li>
			</ul>
		
	<address>
	<p>45134 대전광역시 서구 대덕대로 99 상상중학교</p> <a href="${contextPath}/page/location.do">약도</a> | T.042-123-4567 | 입학문의 : 1644-1234
	</address>
		<p>Copyright (C) 2024 SSM All Rights Reserved.</p>
	</div>
</footer>
</div>
</body>
</html>