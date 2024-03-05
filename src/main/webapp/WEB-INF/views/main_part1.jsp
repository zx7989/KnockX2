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
    @charset "utf-8";

/******* Fonts Import Start **********/
@import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap");
/********* Fonts Face CSS End **********/

/******* Common Element CSS Start ******/

body {
  font-family: "Roboto", sans-serif;
  font-size: 16px;
}
.clear {
  clear: both;
}
img {
  max-width: 100%;
  border: 0px;
}
ul,
ol {
  list-style: none;
}
a {
  text-decoration: none;
  color: inherit;
  outline: none;
  transition: all 0.4s ease-in-out;
  -webkit-transition: all 0.4s ease-in-out;
}
a:focus,
a:active,
a:visited,
a:hover {
  text-decoration: none;
  outline: none;
}
a:hover {
  color: #e73700;
}
h2 {
  margin-bottom: 48px;
  padding-bottom: 16px;
  font-size: 20px;
  line-height: 28px;
  font-weight: 700;
  position: relative;
  text-transform: capitalize;
}
h3 {
  margin: 0 0 10px;
  font-size: 28px;
  line-height: 36px;
}
button {
  outline: none !important;
}
/******* Common Element CSS End *********/

/* -------- title style ------- */


.line-title::before {
  width: 100%;
  background: #f2f2f2;
}
.line-title::after {
  width: 32px;
  background: #e73700;
}

/******* Middle section CSS Start ******/
/* -------- Landing page ------- */
.game-section {
  padding: 10px;
}
.game-section .owl-stage {
  margin: 15px 0;
  display: flex;
  display: -webkit-flex;
}
.game-section .item {
  margin: 0 15px 30px;
  width: 320px;
  height: 400px;
  display: flex;
  display: -webkit-flex;
  align-items: flex-end;
  -webkit-align-items: flex-end;
  background: #343434 no-repeat center center / cover;
  border-radius: 16px;
  overflow: hidden;
  position: relative;
  transition: all 0.4s ease-in-out;
  -webkit-transition: all 0.4s ease-in-out;
  cursor: pointer;
}
.game-section .item.active {
  width: 500px;
  box-shadow: 12px 40px 40px rgba(0, 0, 0, 0.25);
  -webkit-box-shadow: 12px 40px 40px rgba(0, 0, 0, 0.25);
}
.game-section .item:after {
  content: "";
  display: block;
  position: absolute;
  height: 100%;
  width: 100%;
  left: 0;
  top: 0;
  background-image: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 1));
}
.game-section .item-desc {
  padding: 0 24px 12px;
  color: #fff;
  position: relative;
  z-index: 1;
  overflow: hidden;
  transform: translateY(calc(100% - 54px));
  -webkit-transform: translateY(calc(100% - 54px));
  transition: all 0.4s ease-in-out;
  -webkit-transition: all 0.4s ease-in-out;
}
.game-section .item.active .item-desc {
  transform: none;
  -webkit-transform: none;
}
.game-section .item-desc p {
  opacity: 0;
  -webkit-transform: translateY(32px);
  transform: translateY(32px);
  transition: all 0.4s ease-in-out 0.2s;
  -webkit-transition: all 0.4s ease-in-out 0.2s;
}
.game-section .item.active .item-desc p {
  opacity: 1;
  -webkit-transform: translateY(0);
  transform: translateY(0);
}
.game-section .owl-theme.custom-carousel .owl-dots {
  position: relative;
  z-index: 5;
}
.owl-nav{
  margin-top:-1000px;
}

/******** Middle section CSS End *******/

/***** responsive css Start ******/

@media (min-width: 992px) and (max-width: 1199px) {
  h2 {
    margin-bottom: 32px;
  }
  h3 {
    margin: 0 0 8px;
    font-size: 24px;
    line-height: 32px;
  }

  /* -------- Landing page ------- */
  .game-section {
    padding: 50px 30px;
  }
  .game-section .item {
    margin: 0 12px 60px;
    width: 260px;
    height: 360px;
  }
  .game-section .item.active {
    width: 400px;
  }
  .game-section .item-desc {
    transform: translateY(calc(100% - 46px));
    -webkit-transform: translateY(calc(100% - 46px));
  }
}

@media (min-width: 768px) and (max-width: 991px) {
  h2 {
    margin-bottom: 32px;
  }
  h3 {
    margin: 0 0 8px;
    font-size: 24px;
    line-height: 32px;
  }
  .line-title {
    width: 330px;
  }

  /* -------- Landing page ------- */
  .game-section {
    padding: 50px 30px 40px;
  }
  .game-section .item {
    margin: 0 12px 60px;
    width: 240px;
    height: 330px;
  }
  .game-section .item.active {
    width: 360px;
  }
  .game-section .item-desc {
    transform: translateY(calc(100% - 42px));
    -webkit-transform: translateY(calc(100% - 42px));
  }
}

@media (max-width: 767px) {
  body {
    font-size: 14px;
  }
  h2 {
    margin-bottom: 20px;
  }
  h3 {
    margin: 0 0 8px;
    font-size: 19px;
    line-height: 24px;
  }
  .line-title {
    width: 250px;
  }

  /* -------- Landing page ------- */
  .game-section {
    padding: 30px 15px 20px;
  }
  .game-section .item {
    margin: 0 10px 40px;
    width: 200px;
    height: 280px;
  }
  .game-section .item.active {
    width: 270px;
    box-shadow: 6px 10px 10px rgba(0, 0, 0, 0.25);
    -webkit-box-shadow: 6px 10px 10px rgba(0, 0, 0, 0.25);
  }
  .game-section .item-desc {
    padding: 0 14px 5px;
    transform: translateY(calc(100% - 42px));
    -webkit-transform: translateY(calc(100% - 42px));
  }
}

  </style>
  <section class="game-section">
    <div class="owl-carousel custom-carousel owl-theme">
      <div class="item active" style="background-image: url(${contextPath}/resources/image/phone1.png);">
        <div class="item-desc">
          <h3>티타늄으로 감싸고, AI로 빛나다</h3>
          <p>경이로운 디자인의 새로운 갤럭시 S24 Ultra를 만나보세요.<br>
            강인한 티타늄 프레임과 172.5 mm 평면 디스플레이의 견고한 결합으로 갤럭시 사상 가장 완벽에 가까운 디자인을 선보입니다.</p>
        </div>
      </div>
      <div class="item" style="background-image: url(${contextPath}/resources/image/main1-iphone15.PNG);">
        <div class="item-desc">
          <h3>속속들이 스며든 색상.<br>
            구석구석 견고한 글래스</h3>
          <p>iPhone의 혁신적인 새 디자인에는 형성 과정부터 소재 전체에 색이 스며들게 하는 공법으로 제작된 후면 글래스가 사용되었습니다.</p>
        </div>
      </div>
      <div class="item" style="background-image: url(${contextPath}/resources/image/galaxy-z-flip5-highlights.jpg);">
        <div class="item-desc">
          <h3>갤럭시 Z 플립 사상<br>
            최대 크기의 커버 스크린,<br>
            플렉스 윈도우</h3>
          <p>나를 온전히 표현할 수 있는 86.1 mm 플렉스 윈도우를 만나보세요.<br>
            새로운 플렉스 힌지를 장착한 갤럭시 Z 플립5는<br>  
            접으면 주머니에 쏙 들어가는 크기로 그립감까지 뛰어납니다.</p>
        </div>
      </div>
      <div class="item" style="background-image: url(${contextPath}/resources/image/galaxy-z-fold5.jpg);">
        <div class="item-desc">
          <h3> 
            갤럭시 Z 폴드 사상,<br>
            가장 가볍고 작은 모델</h3>
          <p>갤럭시 Z 폴드5의 커다란 화면을<br>
            주머니에 쏙 들어가는 크기로 접어보세요.<br>
            펼치고 접는 것은 물론, 다양한 각도로 구부릴 수 있는<br>
            플렉스 힌지의 놀라운 기술을 만나보세요.</p>
        </div>
      </div>
      <div class="item" style="background-image: url(${contextPath}/resources/image/iphone14pro_detail.jpg);">
        <div class="item-desc">
          <h3>전혀 색다르게 마주하는 iPhone 14</h3>
          <p>Pro 카메라 시스템,<br> 더욱 엄청나게<br> 프로답게</p>
        </div>
      </div>
      <div class="item" style="background-image: url(${contextPath}/resources/image/xiaomi-redmenote13pro.PNG);">
        <div class="item-desc">
          <h3>Xiaomi Redmi Note 13 Pro</h3>
          <p>어떻게 찍어도 아이코닉한 사진<br>
          200MP OIS 카메라 1.5K 커브드 디스플레이</p>
        </div>
      </div>
    </div>
    </div>
  </section>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js'></script>
  <script>
    $(".custom-carousel").owlCarousel({
  autoWidth: true,
  loop: true
});
$(document).ready(function () {
  $(".custom-carousel .item").click(function () {
    $(".custom-carousel .item").not($(this)).removeClass("active");
    $(this).toggleClass("active");
  });
});



  </script>
</body>
</html>