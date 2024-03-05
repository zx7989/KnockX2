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
<title>inner</title>

</head>
<body>
  <style>
 

.slider {
  position: relative;
  height: 500px;
}
.slider__slides {
  z-index: 1;
  position: relative;
  height: 500px;
}
.slider__control {
  z-index: 2;
  position: absolute;
  top: 50%;
  left: 10%;
  width: 80px;
  height: 70px;
  margin-left: -30px;
  margin-top: -30px;
  border-radius: 50%;
  background: rgb(29, 0, 194);
  transition: background-color 0.3s;
  cursor: pointer;
  opacity: 0.5;
}
.slider__control--right {
  left: 90%;
}
.slider__control:hover {
  background-color: #2da6ff;
}
.slider__control-line {
  position: absolute;
  left: 23px;
  top: 50%;
  width: 3px;
  height: 14px;
  transform-origin: 50% 0;
  transform: rotate(-45deg);
}
.slider__control-line:nth-child(2) {
  transform: translateY(1px) rotate(-135deg);
}
.slider__control--right .slider__control-line {
  left: 37px;
  transform-origin: 1px 0;
  transform: rotate(45deg);
}
.slider__control--right .slider__control-line:nth-child(2) {
  transform: translateY(1px) rotate(135deg);
}
.slider__control-line:after {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: #e2e2e2;
  transition: background-color 0.3s;
}
.slider__control:hover .slider__control-line:after {
  background-color: #fff;
}
.slider__control.a--rotation .slider__control-line:after {
  -webkit-animation: arrowLineRotation 0.49s;
          animation: arrowLineRotation 0.49s;
}
.slider__control.a--rotation .slider__control-line:nth-child(1):after {
  -webkit-animation: arrowLineRotationRev 0.49s;
          animation: arrowLineRotationRev 0.49s;
}

@-webkit-keyframes arrowLineRotation {
  to {
    transform: rotate(180deg);
  }
}

@keyframes arrowLineRotation {
  to {
    transform: rotate(180deg);
  }
}
@-webkit-keyframes arrowLineRotationRev {
  to {
    transform: rotate(-180deg);
  }
}
@keyframes arrowLineRotationRev {
  to {
    transform: rotate(-180deg);
  }
}
.slide {
  overflow: hidden;
  position: absolute;
  left: 50%;
  top: 50%;
  width: 110vmax;
  height: 110vmax;
  transform: translate(-50%, -50%);
  border-radius: 50%;
  transition: -webkit-clip-path 0s 0.91s;
  transition: clip-path 0s 0.91s;
  transition: clip-path 0s 0.91s, -webkit-clip-path 0s 0.91s;
  -webkit-clip-path: circle(30px at 120vw 50%);
          clip-path: circle(30px at 120vw 50%);
}
.slide.s--prev {
  -webkit-clip-path: circle(30px at 30vw 50%);
          clip-path: circle(30px at 30vw 50%);
}
.slide.s--active {
  z-index: 1;
  transition: -webkit-clip-path 1.3s;
  transition: clip-path 1.3s;
  transition: clip-path 1.3s, -webkit-clip-path 1.3s;
  -webkit-clip-path: circle(120vmax at 120vw 50%);
          clip-path: circle(120vmax at 120vw 50%);
}
.slide.s--active.s--active-prev {
  -webkit-clip-path: circle(120vmax at 30vw 50%);
          clip-path: circle(120vmax at 30vw 50%);
}
.slide:nth-child(1) .slide__inner {
  background-image: url("${contextPath}/resources/image/main5_slide2.png");
}
.slide:nth-child(2) .slide__inner {
  background-image: url("${contextPath}/resources/image/main5_slide3.png");
}
.slide:nth-child(3) .slide__inner {
  background-image: url("${contextPath}/resources/image/main5_slide4.png");
}
.slide:nth-child(4) .slide__inner {
  background-image: url("${contextPath}/resources/image/main5_slide5.png");
}
.slide:nth-child(5) .slide__inner {
  background-image: url("${contextPath}/resources/image/main5_slide6.png");
}
.slide__inner {
  position: absolute;
  left: 50%;
  top: 60%;
  width: 100vw;
  height: 70vh;
  margin-left: -50vw;
  margin-top: -50vh;
  background-size: contain;
  background-position: center center;
}
@media screen and (min-width: 1800px) {
	
  }
.slide__inner:before {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: rgba(197, 197, 197, 0.3);
}
.slide__content {
  position: absolute;
  left: 18%;
  top: 300px;
  margin-left: -30px;
  margin-top: 48px;
  max-width: 480px;
  color: #353535;
}

.slide__heading {
  margin-left:150px;
  margin-bottom: 20px;
  font-size: 60px;
  line-height: 40px;
}
.slide__text {
  margin-left:170px;
  font-size: 25px;
}
.slide__text a {
  color: inherit;
}
  </style>

<div class="slider">
  <!-- slides -->
  <div class="slider__slides">
    <div class="slide s--active">
      <div class="slide__inner">
        <div class="slide__content">
          <h2 class="slide__heading">SAMSUNG<p class="slide__text">GALAXY Z-Filp 5</p></h2>
          
        </div>
      </div>
    </div>
    <div class="slide">
      <div class="slide__inner">
        <div class="slide__content">
          <h2 class="slide__heading">SAMSUNG<p class="slide__text">GALAXY FOLD 5</p></h2>
        </div>
      </div>
    </div>
    <div class="slide">
      <div class="slide__inner">
        <div class="slide__content">
          <h2 class="slide__heading">SAMSUNG<p class="slide__text">GALAXY FOLD 5</p></h2>
        </div>
      </div>
    </div>
    <div class="slide">
      <div class="slide__inner">
        <div class="slide__content">
          <h2 class="slide__heading">SAMSUNG<p class="slide__text">GALAXY S22</p></h2>
        </div>
      </div>
    </div>
    <div class="slide s--prev">
      <div class="slide__inner">
        <div class="slide__content">
          <h2 class="slide__heading">SAMSUNG<p class="slide__text">GALAXY FOLD 5</p></h2>
        </div>
      </div>
    </div>
  </div>
  <!-- slides end -->
  <div class="slider__control">
    <div class="slider__control-line"></div>
    <div class="slider__control-line"></div>
  </div>
  <div class="slider__control slider__control--right m--right">
    <div class="slider__control-line"></div>
    <div class="slider__control-line"></div>
  </div>
</div>

  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js'></script>
  <script>
   (function () {
  var $slides = document.querySelectorAll(".slide");
  var $controls = document.querySelectorAll(".slider__control");
  var numOfSlides = $slides.length;
  var slidingAT = 1300; // sync this with scss variable
  var slidingBlocked = false;

  [].slice.call($slides).forEach(function ($el, index) {
    var i = index + 1;
    $el.classList.add("slide-" + i);
    $el.dataset.slide = i;
  });

  [].slice.call($controls).forEach(function ($el) {
    $el.addEventListener("click", controlClickHandler);
  });

  function controlClickHandler() {
    if (slidingBlocked) return;
    slidingBlocked = true;

    var $control = this;
    var isRight = $control.classList.contains("m--right");
    var $curActive = document.querySelector(".slide.s--active");
    var index = +$curActive.dataset.slide;
    isRight ? index++ : index--;
    if (index < 1) index = numOfSlides;
    if (index > numOfSlides) index = 1;
    var $newActive = document.querySelector(".slide-" + index);

    $control.classList.add("a--rotation");
    $curActive.classList.remove("s--active", "s--active-prev");
    document.querySelector(".slide.s--prev").classList.remove("s--prev");

    $newActive.classList.add("s--active");
    if (!isRight) $newActive.classList.add("s--active-prev");

    var prevIndex = index - 1;
    if (prevIndex < 1) prevIndex = numOfSlides;

    document.querySelector(".slide-" + prevIndex).classList.add("s--prev");

    setTimeout(function () {
      $control.classList.remove("a--rotation");
      slidingBlocked = false;
    }, slidingAT * 0.75);
  }
})();
$(document).ready(function() {
    $('.slider__slides').carousel({
      interval: 6000
    })
  });
  </script>
</body>
</html>