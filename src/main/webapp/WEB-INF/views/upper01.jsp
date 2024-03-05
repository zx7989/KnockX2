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

</head>
<body>
  <style>
    .upper02{
      background-color: rgba(45, 206, 255, 0.76);
      width:300px;
      text-align: right;
      border-radius: 10px;
      justify-content: flex-end;
      margin-left: auto;
      padding:10px;
      
    }
  </style>
 
<div class="upper02">
  <span>휴대폰 구매 / 메인</span>
</div>

  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js'></script>
  <script>
  

  </script>
</body>
</html>