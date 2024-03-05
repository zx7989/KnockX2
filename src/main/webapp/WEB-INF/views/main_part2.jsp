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




.main_slider11 {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
    display: flex;
    display: -webkit-flex;
    justify-content: center;
  -webkit-justify-content: center;
    align-items: center;
  -webkit-align-items: center;
}



.carousel {
    width: 100%;
    height: 100%;
    display: flex;
    max-height: 550px;   
    overflow: hidden;
  position: relative;
}

.carousel-item {
  visibility:visible;
    display: flex;
    width: 100%;
    height: 100%;
    align-items: center;
    justify-content: flex-end;
      -webkit-align-items: center;
    -webkit-justify-content: flex-end;
    position: relative;
    background-color: #fff;
    flex-shrink: 0;
   -webkit-flex-shrink: 0;
    position: absolute;
    z-index: 0;
  transition: 0.6s all linear;
}

.carousel-item__info {
  height: 100%;
  display: flex;
  justify-content: center;
  flex-direction: column;
  background-color: rgb(171, 235, 255);
    display: -webkit-flex;
    border-top-right-radius: 200px;
  -webkit-justify-content: center;
  -webkit-flex-direction: column;
  
  order: 1;
  left: 0;
  margin: auto;
  padding: 0 40px;
  width: 70%;

}

.carousel-item__image {
    width: 120%;
    height: 100%;
    order: 2;
    align-self: flex-end;
    flex-basis: 60%;
  
      -webkit-order: 2;
    -webkit-align-self: flex-end;
    -webkit-flex-basis: 60%;
  
    background-position: center;
    background-repeat: no-repeat;
    background-size: contain;
   position:relative;
  transform: translateX(100%);
  transition: 0.6s all ease-in-out;
}

.carousel-item__subtitle {
    font-family: 'Open Sans', sans-serif;
    letter-spacing: 3px;
    font-size: 25px;
    text-transform: uppercase;
    margin: 0;
    color: #7E7E7E;    
    font-weight: 700;
    transform: translateY(25%);
    opacity: 0;
    visibility: hidden;
    transition: 0.4s all ease-in-out;
}

.carousel-item__title {
    margin: 15px 0 0 0;
    font-family: 'Playfair Display', serif;
    font-size: 44px;
    line-height: 45px;
    letter-spacing: 3px;
    font-weight: 700;
    color: #2C2C2C;
    transform: translateY(25%);
    opacity: 0;
    visibility: hidden;
    transition: 0.6s all ease-in-out;
}

.carousel-item__description {
    transform: translateY(25%);
    opacity: 0;
    visibility: hidden;
    transition: 0.6s all ease-in-out;
    margin-top: 35px;
    font-family: 'Open Sans', sans-serif;
    font-size: 13px;
    font-weight: 800;
    color: #7e7e7e;
    line-height: 22px;
    margin-bottom: 35px;
}

.carousel-item--1 .carousel-item__image{
  background-image: url('${contextPath}/resources/image/main5_slide3.png');
}


.carousel-item--2 .carousel-item__image{
  background-image: url('${contextPath}/resources/image/main2-galaxy24.PNG');
}

.carousel-item--3 .carousel-item__image{
  background-image: url('${contextPath}/resources/image/phone4.jpg');
}

.carousel-item--4 .carousel-item__image{
  background-image: url('${contextPath}/resources/image/phone5.jpg');
}

.carousel-item--5 .carousel-item__image{
  background-image: url('${contextPath}/resources/image/phone2.png');
}




.carousel-item__container{

}

.carousel-item__btn {
    width: 35%;
    color: #2C2C2C;
    font-family: 'Open Sans', sans-serif;
    letter-spacing: 3px;
    font-size: 11px;
    text-transform: uppercase;
    margin: 0;
    width: 35%;
    font-weight: 700;
  text-decoration: none;
      transform: translateY(25%);
    opacity: 0;
    visibility: hidden;
    transition: 0.6s all ease-in-out;
}

.carousel__nav {
    position: absolute;
    right: 0;
    z-index: 2;
    background-color: #fff;
  bottom: 0;
}

.carousel__icon {
    display: inline-block;
    vertical-align: middle;
    width: 16px;
  fill: #5d5d5d;
}

.carousel__arrow {
    cursor: pointer;
    display: inline-block;
    padding: 11px 15px;
    position: relative;
}

.carousel__arrow:nth-child(1):after {
    content:'';
    right: -3px;
    position: absolute;
    width: 1px;
    background-color: #ffa5a5;
    height: 14px;
    top: 50%;
    margin-top: -7px;
}

.active{
   z-index: 1;
  display: flex;
  visibility:visible;
}

.active .carousel-item__subtitle, .active .carousel-item__title, .active .carousel-item__description,.active .carousel-item__btn{
    transform: translateY(0);
    opacity: 1;
  transition: 0.6s all ease-in-out;
    visibility: visible;
}



.active .carousel-item__image{ 
transition: 0.6s all ease-in-out;
transform: translateX(0);
}



</style>
</head>
<body>
  <head>
    <title>FlexBox Exercise #3 - Image carousel / Responsive </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  
  <body>
    <div class="main_slider11">
  <div class="carousel">
    <div class="carousel__nav">
     <span id="moveLeft" class="carousel__arrow">
          <svg class="carousel__icon" width="24" height="24" viewBox="0 0 24 24">
      <path d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z"></path>
  </svg>
      </span>
      <span id="moveRight" class="carousel__arrow" >
        <svg class="carousel__icon"  width="24" height="24" viewBox="0 0 24 24">
    <path d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z"></path>
  </svg>    
      </span>
    </div>
    <div class="carousel-item carousel-item--1">
      <div class="carousel-item__image"></div>
      <div class="carousel-item__info">
        <div class="carousel-item__container">
          <h2 class="carousel-item__subtitle">삼성 시그니처 갤럭시 S24 출시 </h2>
          <h1 class="carousel-item__title">삼성 시그니처 갤럭시 S24 출시</h1>
          <br>
          <p class="carousel-item__description">KNOCKX2에서 만나보세요</p>
          <br>
          <a href="#" class="carousel-item__btn">상세정보 보기</a>
          </div>
      </div>
    </div>
    <div class="carousel-item carousel-item--2">
      <div class="carousel-item__image"></div>
      <div class="carousel-item__info">
        <div class="carousel-item__container">
          <h2 class="carousel-item__subtitle">Galaxy AI<img src="${contextPath}/resources/image/ai-removebg-preview.png" style="height:24px">is here</h2>
          <h1 class="carousel-item__title">갤럭시 S24 Series</h1>
          <br>
          <p class="carousel-item__description">갤럭시 AI 시대에 오신 것을 환영합니다.<br>
            이제 우리는 갤럭시 S24 Ultra와 함께 더 자유롭게 상상하고 표현할 수 있습니다.<br>
            놀라운 작업 능률과 더 큰 가능성을 손 안에서 펼쳐보세요.</p>
          <br>
          <a href="#" class="carousel-item__btn">상세정보 보기</a>
          </div>
      </div>
    </div>
      <div class="carousel-item carousel-item--3">
      <div class="carousel-item__image"></div>
      <div class="carousel-item__info">
        <div class="carousel-item__container">
          <h2 class="carousel-item__subtitle">나의 폰이 나의 세계를 어디까지 펼쳐줄 수 있을까?</h2>
          <h1 class="carousel-item__title">갤럭시 Z 플립 5</h1>
          <br>
          <p class="carousel-item__description">한층 더 멋져진 플렉스 윈도우는 One UI로 커스텀까지 가능해졌으니까.<br>
            엣지있는 앵글로 셀피를 찍을 수 있는 카메라에, 배터리는 더 길어졌으니까.<br>
            일상에도 주머니에도 완벽한 핏. 갤럭시 Z 플립5를 만나보세요.</p>
          <br>
          <a href="#" class="carousel-item__btn">상세정보 보기</a>
          </div>
      </div>
    </div>
    
     <div class="carousel-item carousel-item--4">
      <div class="carousel-item__image"></div>
      <div class="carousel-item__info">
        <div class="carousel-item__container">
          <h2 class="carousel-item__subtitle">갤럭시 Z 폴드 사상, 가장 가볍고 작은 모델</h2>
          <h1 class="carousel-item__title">갤럭시 Z 폴드 5</h1>
          <br>
          <p class="carousel-item__description">갤럭시 Z 폴드5의 커다란 화면을
            주머니에 쏙 들어가는 크기로 접어보세요.<br>
            펼치고 접는 것은 물론, 다양한 각도로 구부릴 수 있는
            플렉스 힌지의 놀라운 기술을 만나보세요.</p>
          <br>
          <a href="#" class="carousel-item__btn">상세정보 보기</a>
          </div>
      </div>
    </div>
    
   <div class="carousel-item carousel-item--5">
      <div class="carousel-item__image"></div>
      <div class="carousel-item__info">
        <div class="carousel-item__container">
          <h2 class="carousel-item__subtitle">티타늄.초강력.초경량.초프로. </h2>
          <h1 class="carousel-item__title">아이폰 15 Pro</h1>
          <br>
          <p class="carousel-item__description">아이폰 사상 가장 긴 광학 줌 초점 거리를 자랑하는 iPhone 15 Pro Max.
            <br>저 멀리 내다보다.</p>
          <br>
          <a href="#" class="carousel-item__btn">상세정보 보기</a>
          </div>
      </div>
    </div>
    
  </div>
</div>
  </body>

<script>
$(function(){
  $('.carousel-item').eq(0).addClass('active');
  var total = $('.carousel-item').length;
  var current = 0;
  $('#moveRight').on('click', function(){
    var next=current;
    current= current+1;
    setSlide(next, current);
  });
  $('#moveLeft').on('click', function(){
    var prev=current;
    current = current- 1;
    setSlide(prev, current);
  });
  function setSlide(prev, next){
    var slide= current;
    if(next>total-1){
     slide=0;
      current=0;
    }
    if(next<0){
      slide=total - 1;
      current=total - 1;
    }
           $('.carousel-item').eq(prev).removeClass('active');
           $('.carousel-item').eq(slide).addClass('active');
      setTimeout(function(){

      },800);
    

    
    console.log('current '+current);
    console.log('prev '+prev);
  }
});
$(function(){
  $('.carousel-item').eq(0).addClass('active');
  var total = $('.carousel-item').length;
  var current = 0;

  // 5초마다 슬라이드 이동
  setInterval(function(){
    $('#moveRight').click();
  }, 5000);

  $('#moveRight').on('click', function(){
    var next=current;
    current= current+1;
    setSlide(next, current);
  });

  $('#moveLeft').on('click', function(){
    var prev=current;
    current = current- 1;
    setSlide(prev, current);
  });

  function setSlide(prev, next){
    var slide= current;
    if(next>total-1){
     slide=0;
      current=0;
    }
    if(next<0){
      slide=total - 1;
      current=total - 1;
    }
           $('.carousel-item').eq(prev).removeClass('active');
           $('.carousel-item').eq(slide).addClass('active');
      setTimeout(function(){

      },800);
    

    
    console.log('current '+current);
    console.log('prev '+prev);
  }
});
</script>
</body>
</html>

