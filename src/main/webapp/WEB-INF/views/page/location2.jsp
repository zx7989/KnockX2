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
    
    .location h2, h4{
       
        text-align: left;
        border-bottom:5px solid;
        margin:10px;
        padding:10px;
       
    }
    iframe{
    border:10px solid blueviolet;
    border-radius: 30px;
        }
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
    
    <div class="location">
        <h2>KnockX2 본사</h2>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2272.267392492549!2d127.37624829280196!3d36.34935992740363!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35654be135f94b1d%3A0xf622b84763572b4!2z6re466aw7Lu07ZOo7YSw7JWE7Yq47ZWZ7JuQIOuMgOyghOuzuOygkA!5e0!3m2!1sko!2skr!4v1704771494266!5m2!1sko!2skr" width="80%" height="450"  allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
</body>
</html>