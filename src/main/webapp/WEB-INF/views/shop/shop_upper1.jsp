<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>

<!doctype html>
<html lang="en">
<head>
<title>Carousel 07</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style>
  @import url('https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i');

@import url('https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i');
@import url("https://fonts.googleapis.com/css?family=Luckiest+Guy&display=swap");



.title03{
  background-color: rgba(0, 151, 211, 0.575);
  background-image: url("${contextPath}/resources/image/phone2.png");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: left 70% top 90px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding:30px !important;
  border-radius: 100px 0 30px 0;
  margin:0;
  color:rgb(255, 255, 255) !important;
  box-shadow: 1px 1px 10px black;
  text-wrap: nowrap;
}
.title02 {
  font-size: 2em;
  color: white;
  text-shadow: 0 0.1em 20px black, 0.05em -0.03em 0 black, 0.05em 0.005em 0 black, 0em 0.08em 0 black, 0.05em 0.08em 0 black, 0px -0.03em 0 black, -0.03em -0.03em 0 black, -0.03em 0.08em 0 black, -0.03em 0 0 black;
}
.title02 span {
  transform: scale(0.9);
  display: inline-block;
}
.title02 span:first-child {
  -webkit-animation: bop 1s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards infinite alternate;
          animation: bop 1s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards infinite alternate;
}
.title02 span:last-child {
  -webkit-animation: bopB 1s 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards infinite alternate;
          animation: bopB 1s 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards infinite alternate;
}

@-webkit-keyframes bop {
  0% {
    transform: scale(0.9);
  }
  50%, 100% {
    transform: scale(1);
  }
}

@keyframes bop {
  0% {
    transform: scale(0.9);
  }
  50%, 100% {
    transform: scale(1);
  }
}
@-webkit-keyframes bopB {
  0% {
    transform: scale(0.9);
  }
  80%, 100% {
    transform: scale(1) rotateZ(-3deg);
  }
}
@keyframes bopB {
  0% {
    transform: scale(0.9);
  }
  80%, 100% {
    transform: scale(1) rotateZ(-3deg);
  }
}

.shopTitle01{
  position: relative;
    display: flex;
    flex-direction: row;
    text-align: center;
    justify-content: center;
    padding: 0 auto;
    background-color: blueviolet;
    width: 100%;
    height: 100%;
    color:white;
    
    h2{
      border:3px solid rgb(255, 255, 255);
      background-color: rgb(0, 151, 0);
      padding:1px 20px;
      border-radius: 30px 0;
      color:rgb(255, 255, 255)
    }
    img{
      padding:5px;
      border-radius: 30px;
      border:3px double rgb(255, 255, 255);
    }
}
.shopName1{
  position: relative;
  left:120px;
 text-align: center;
 display: flex;
 flex-direction: column;
 font-size: 80px !important;
 justify-content: center;
 margin:0 16% 0 10%;
 font-size: 2em;
  color: white;
  text-wrap: nowrap;
  text-shadow: 0 0.1em 20px black, 0.05em -0.03em 0 black, 0.05em 0.005em 0 black, 0em 0.08em 0 black, 0.05em 0.08em 0 black, 0px -0.03em 0 black, -0.03em -0.03em 0 black, -0.03em 0.08em 0 black, -0.03em 0 0 black;
}
.shopMainBtn1{
  margin:0 auto;
  border: 3px solid rgb(255, 255, 255);
  font-size: 30px;
  font-weight: 400;
}
.shopMainBtn1:hover{
  background-color: white;
  color:rgb(51, 51, 51)
}
.custom-button {
  display: inline-block;
  padding: 5px 24px;
  border-radius: 20px;
  background-color: #4b66ff;
  color: white;
  text-align: center;
  text-decoration: none;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.custom-button:hover {
  background-color: #45a049;
  font-weight: 800;
}

.custom-button:active {
  background-color: #3e8e41;
  font-weight: 800;
}

.custom-button:focus {
  outline: none;
}
.sbm{
font-size: 15px;
margin:0 auto;
font-weight: bold;

a {
  position: relative;
  padding: 10px 20px;
  display: block;
  text-decoration: none;
  text-transform: uppercase;
  width: 200px;
  overflow: hidden;
  border-radius: 40px;
}

a span {
  position: relative;
  color: #fff;
  font-size: 20px;
  font-family: Arial;
  padding:5px;
border-bottom:3px solid;
  letter-spacing: 8px;
  z-index: 1;
}

a .liquid {
  position: absolute;
  top: -80px;
  left: 0;
  width: 230px;
  height: 220px;
  background: #4973ff;
  box-shadow: inset 0 0 50px rgba(0, 0, 0, .5);
  transition: .5s;
}

a .liquid::after,
a .liquid::before {
  content: '';
  width: 200%;
  height: 200%;
  position: absolute;
  top: 0;
  left: 50%;
  transform: translate(-50%, -75%);
  background: #000;
}

a .liquid::before {
  border: 2px solid rgb(153, 0, 255);
  border-radius: 45%;
  background: rgb(192, 33, 255);
  animation: animate 5s linear infinite;
}

a .liquid::after {
  
  border-radius: 40%;
  background: rgba(20, 20, 20, 0.5);
  animation: animate 10s linear infinite;
}

a:hover .liquid{
  top: -120px;
}


}
@keyframes animate {
  0% {
    transform: translate(-50%, -75%) rotate(0deg);
  }
  100% {
    transform: translate(-50%, -75%) rotate(360deg);
  }
}
</style>
</head>
<body>
  <head>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  
  <body>
  <div class="shopTitle01">
    <c:choose>
      <c:when test="${shopInfo.imageFN == null}">
        <img  src="${contextPath}/resources/image/profile.png" id="preview"  />
        
      </c:when>
      <c:when test="${shopInfo.imageFN != null}">
        <img src="${contextPath}/download1.do?id=${shopInfo.id}&imageFN=${shopInfo.imageFN}" id="preview"  />
      </c:when>
    </c:choose>
    <h1 class="shopName1">SMART STORE
      <c:if test="${loginMode == 'shop' || loginMode == 'admin'}">
      <div class="sbm"><a href="${contextPath}/goods/addGoodsForm.do">
      <span>상품등록</span>
      <div class="liquid"></div>
    </a></div>
  </c:if>
</h1><h1 class="title02 title03"><span style="font-size: 60px;">${shopInfo.shopVO.shop_name}</span><span>welcome</span></h1>
  
  </div>
  </body>

<script>

</script>
</body>
</html>

