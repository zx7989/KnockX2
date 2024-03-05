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
<title>헤더</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
	@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css');
</style>
</head>
<style>
	@import url(https://fonts.googleapis.com/css?family=Cabin+Condensed);


svg{font-weight:bold;max-width:600px; position: absolute; left:0; top: 30px;}
@font-face {
  font-family: 'Material Icons';
  font-style: normal;
  font-weight: 400;
  src: url(https://example.com/MaterialIcons-Regular.eot); /* For IE6-8 */
  src: local('Material Icons'),
    local('MaterialIcons-Regular'),
    url(https://example.com/MaterialIcons-Regular.woff2) format('woff2'),
    url(https://example.com/MaterialIcons-Regular.woff) format('woff'),
    url(https://example.com/MaterialIcons-Regular.ttf) format('truetype');
}
p{
	margin:0 !important;
}
.material-icons {
  font-family: 'Material Icons';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;  /* Preferred icon size */
  display: inline-block;
  line-height: 1;
  text-transform: none;
  letter-spacing: normal;
  word-wrap: normal;
  white-space: nowrap;
  direction: ltr;

  /* Support for all WebKit browsers. */
  -webkit-font-smoothing: antialiased;
  /* Support for Safari and Chrome. */
  text-rendering: optimizeLegibility;

  /* Support for Firefox. */
  -moz-osx-font-smoothing: grayscale;

  /* Support for IE. */
  font-feature-settings: 'liga';
}
	body {
		font-family: 'Noto Sans KR', sans-serif ;
	   background-repeat: repeat-x ;
	   padding: 0 auto;
	   margin:0 auto;
	  li{
		list-style: none;
	  }
   }
   
   a {
	   text-decoration: none;
	   color: inherit;
   }
   
   .et-hero-tabs,
   .et-slide {
		
	   display: flex;
	   flex-direction: column;
	   align-items: center;
	   height: 250px;
	   position: relative;
   /* 	background: #eee; */
	   text-align: center;
	   margin:0 auto;
	   img{
		margin:3px;
		margin-top:20px;
	   }
	   
	   
	   h3 {
		   font-size: 1rem;
		   letter-spacing: 0.3rem;
		   opacity: 0.6;
	   }
   }
   
   ul.ulcls1 {
	position: absolute;
	right:20px;
	top:30px;
	margin:0;
	li{
		list-style: none;
		display: inline-block;
		margin:15px !important;
	}
	a{
		color:rgb(56, 56, 56);
		font-size: 18px;
		font-family: 'Noto Sans KR', sans-serif;
   }
   }
   ul.ulcls1 li *:hover{
	color:rgb(0, 132, 255);
	transition: 0.5s ease-out;
   }
  
   .et-hero-tabs-container {
	   display: flex;
	   flex-direction: row;
	   position: absolute;
	   top: 180px;
	   width: 100%;
	   height:70px !important;
	  	margin: 0 auto;
		padding:0 auto;
	   height: 80px;
	   border-top:0.5px solid rgb(194, 194, 194) ; 
	   border-bottom:0.5px solid rgb(190, 190, 190); 
	   box-shadow: 10 10 50px rgba(202, 35, 35, 0.1);
	   background: #ffffff;
	   z-index: 10;
	   &--top {
		   position: fixed;
		   top: 1000px;
	   }
	   

}
   

   .et-hero-tab {
	   display: flex;
	   justify-content: center;
	   align-items: center;
	   flex: 1;
	   color: #505050;
	   letter-spacing: 0.1rem;
	   transition: all 0.5s ease;
	   font-size: 1.3rem;
	   font-weight:bolder !important;
	
	    
		
	   &:hover {
		   color: white;
		   background: rgb(17, 17, 17);
		   transition: all 0.5s ease;
		   border-radius: 5px;
}
   }
.menu01:hover{
		
			background-color: #f3f3f3af !important;
	
		}
   .menu01{
	li:hover{
		background-color: #e9e9e9;
		color:white;
	}
   }
   .et-hero-tab-slider {
	   position: absolute;
	   bottom: 0;
	   width: 0;
	   height: 6px;
	   background: #66b1f1;
	   transition: left 0.3s ease;
   }
   
   .title11 a{
	   color:#616161;
   }
   
   .mainimg1 * {
	   width:100%;
	   background: black;
	   background-repeat: repeat-x;
	   float:center;
	   clear:both;
   }
  .logomain a:hover{
	color:red;
   
   
}

  
.none:after {content: ""; display: block; clear: both; }

   </style>
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
   <body>
	
	   <!-- Hero -->
   <section class="et-hero-tabs">
	<a class="logomain" href="${contextPath}/mainfront.do">
	<svg viewbox="0 0 100 20">
		<defs>
		  <linearGradient id="gradient">
			<stop color="#000"/>
		  </linearGradient>
		  <pattern id="wave" x="0" y="-0.5" width="100%" height="100%" patternUnits="userSpaceOnUse">
			<path id="wavePath" d="M-40 9 Q-30 7 -20 9 T0 9 T20 9 T40 9 T60 9 T80 9 T100 9 T120 9 V20 H-40z" mask="url(#mask)" fill="url(#gradient)"> 
			  <animateTransform
				  attributeName="transform"
				  begin="0s"
				  dur="1.5s"
				  type="translate"
				  from="0,0"
				  to="40,0"
				  repeatCount="indefinite" />
			</path>
		  </pattern>
		</defs>
		<text text-anchor="middle" x="50" y="10" font-size="13" fill="white" fill-opacity="0.1">KnockX2</text>
		<text text-anchor="middle" x="50" y="14" font-size="10" fill="url(#wave)"  fill-opacity="1">KnockX2</text>
	  </svg></a>
	<a class="logomain" href="${contextPath}/main.do">
	
	<img src="${contextPath}/resources/image/knock_logo.png" alt="mainlogo">
	<br>
	<div> <ul class="ulcls1">
		<c:choose>
			<c:when test="${isLogOn==true and member != null }">
				<c:if test="${member.memberSort == 'member'}">
					</c:if>
				<c:if test="${kakaoLog == null && kakaoLog2 == null}">
				<li><a style="color:rgb(78, 78, 78);" href="${contextPath}/member/logout.do" >
					<span style="font-size: 45px;"class="material-symbols-outlined">
						<img src="${contextPath}/download1.do?id=${member.id}&imageFN=${member.imageFN}"  style="border:3px solid; border-radius: 50%; margin:0; width:40px; height: 40px;" id="preview"  />logout
						</span><p>(${member.name})님 로그아웃</p>
				 </a></li>
				</c:if>
				<c:if test="${kakaoLog != null && kakaoLog2 == null}">
				<li style="position:relative;"><a style="color:rgb(78, 78, 78);" href="${contextPath}/member/logout.do" >
					<span style="font-size: 45px;"class="material-symbols-outlined">
						<img src="${contextPath}/download1.do?id=${member.id}&imageFN=${member.imageFN}"  style="border:3px solid; border-radius: 50%; margin:0; width:40px; height: 40px;" id="preview"  />logout
						</span><p>(${member.name})님 로그아웃</p><span style="position: absolute;  left:20px; top:80px;"><span style="padding:5px !important;border-radius: 30px;background-color: rgb(87, 35, 0); color:yellow;padding:3px;">카카오 인증</span><img style="margin:0;" src="${contextPath}/resources/image/kakaoid.png" width="40px"></span>
				 </a></li>
				</c:if>
				<c:if test="${kakaoLog != null && kakaoLog2 != null}">
					
					<li style="position:relative;"><a style="color:rgb(78, 78, 78);" href="https://kauth.kakao.com/oauth/logout?client_id=2840b2919a36903a43e08af211aab685&logout_redirect_uri=http://localhost:8091/member/logout.do" >
						<span style="font-size: 45px;"class="material-symbols-outlined">
							<img src="${contextPath}/download1.do?id=${member.id}&imageFN=${member.imageFN}"  style="border:3px solid; border-radius: 50%; margin:0; width:40px; height: 40px;" id="preview"  />logout
							</span><p>(${member.name})님 카카오 로그아웃</p><span style="position: absolute; text-wrap: nowrap; left:-30px; top:80px;"><span style="padding:5px !important;border-radius: 30px;background-color: rgb(87, 35, 0); color:yellow;padding:3px;">카카오ID로 로그인하셨습니다.</span><img style="margin:0;" src="${contextPath}/resources/image/kakaoid.png" width="40px"></span>
					 </a></li>
					</c:if>
				<input type="hidden" value="${member.id}" name="id" />
			</c:when>
			
			<c:otherwise>
				<li><a href="${contextPath}/member/loginForm.do">
					<span style="font-size: 40px;"class="material-symbols-outlined">
					login
					</span><p>로그인</p></a></li>
				<li><a href="${contextPath}/member/memberForm.do">
					<span style="font-size: 40px;"class="material-symbols-outlined">
						Key
						</span><p>회원가입</p></a></li>
			</c:otherwise>
		</c:choose>
		<c:if test="${member.memberSort == 'member' }">
			<li class="no_line"><a
				href="${contextPath }/cart/myCartList.do?id=${member.id}&memberSort=${member.memberSort}"><span style="font-size: 40px;"class="material-symbols-outlined">
					shopping_cart
			   </span><p>장바구니</p></a></li>
		</c:if>
		<c:if test="${isLogOn==true and loginMode != 'admin' }">
		 <li class="no_line"><a
			 href="${contextPath }/myPage/myPageMainForm.do?id=${member.id}&memberSort=${member.memberSort}"><span style="font-size: 40px;"class="material-symbols-outlined">
				man
			</span><p>마이페이지</p></a></li>
	 </c:if>
		<c:if test="${isLogOn==true and loginMode == 'admin' }">
		 <li class="no_line"><a
			 href="${contextPath}/admin/main/adminMainFront.do">
			 <span style="font-size: 40px;"class="material-symbols-outlined">
				Groups
				</span><p>관리자페이지</p></a></li>	
		</c:if>
		<li><a href="${contextPath}/board/qna.do">
			<span style="font-size: 40px;"class="material-symbols-outlined">
					support_agent
				</span><p>고객센터</p></a></li>
				<c:if test="${isLogOn==true and loginMode == 'admin' }">
				<br>
				<li class="no_line"><a  style="color:red;  padding:5px; font-weight: bold;"
					href="${contextPath}/main.do">[현재 관리자모드입니다.]</a></li></c:if>
		
	</ul>
	<input type="hidden" value="${member.id}" name="id"></div>

<div class="et-hero-tabs-container">
	
	<a class="et-hero-tab menutab1" href="${contextPath}/goods/listGoods.do">휴대폰 구매</a>

	<a class="et-hero-tab menutab2" href="${contextPath}/page/rate.do">요금제 추천</a>
	
	<a class="et-hero-tab menutab3" href="${contextPath}/shop/listShop.do">Smart MALL</a>
	
	<a class="et-hero-tab menutab4" href="${contextPath}/page/location.do">제휴 센터</a>

	<a class="et-hero-tab menutab5" href="${contextPath}/board/listArticles.do">커뮤니티</a>
	<div class="drop01">
		
		<ul class="menu01">
			<li class="">상성</li>
			<li class="">애플</li>
			<li class="">기타</li>
		</ul>
		<ul class="menu01">
			<li class="">　</li>
			<li class=""><a href="${contextPath}/page/rate.do" style="font-size: 20px;">요금제 API 추천 서비스</a></li>
			<c:if test="${member.memberSort == 'member'}">
			<li class=""><a href="${contextPath}/page/myRate.do?id=${member.id}" style="font-size: 20px;">내가 필요한 요금제</a></li>
		</c:if>
		</ul>
		<ul class="menu01">
			<li class=""><a href="${contextPath}/shop/listShop.do" style="margin-top: 30px; font-size: 25px;"><span style="font-size: 100px;" class="material-symbols-outlined">
				touch_app
				</span><br>스마트몰 접속</a></li>
		</ul>
		<ul class="menu01">
			<li class=""><a href="${contextPath}/page/location2.do">KnockX2본사</a></li>
			<li class=""><a href="${contextPath}/page/location3.do">삼성 A/S CENTER</a></li>
			<li class=""><a href="${contextPath}/page/location4.do">애플 A/S CENTER</a></li>
			<li class=""><a href="${contextPath}/page/location.do">판매 대리점</a></li>
		</ul>
		<ul class="menu01">
			<li class=""><a href="${contextPath}/board/listAdminArticles.do">공지사항</a></li>
			<li class=""><a href="${contextPath}/board/listArticles.do">회원게시판</a> | <a href="${contextPath}/board/listShopArticles.do">사업자게시판</a></li>
			<li class=""><a href="${contextPath}/board/listSamsungArticles.do">삼성게시판</a> | <a href="${contextPath}/board/listAppleArticles.do">애플게시판</a></li>
		</ul>
		
		
		
		</div>
	<span class="et-hero-tab-slider"></span>
	
</div>
</section>
<style>
	 .drop01 { display: none; padding: 10px 0; border: 0px solid #ccc; border-radius: 0 0 20px 20px;
			position: absolute; top:70px; left:1px;
			background-color: white; width:99.7%;  margin:0 auto; text-align: center;
			ul{
			display: inline-block; width:20%; justify-content: center;
			margin: 0 auto !important;
				padding:0 0px;
				border-right:1px solid rgba(185, 185, 185, 0.424);
			}
			ul li{
				margin: 15px 10px !important;
				padding:0 10px !important;
				font-size: 19px;
				color:rgb(0, 0, 0) !important;
				
				
			}
			ul li *:hover{
				color:rgb(0, 70, 199);
				transition: 0.6s ease-out;
			}
			
		}
	  
.et-hero-tabs-container:hover .drop01 {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  animation-name: fadeIn;
  animation-duration: 0.8s;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(5px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.et-hero-tabs-container:not(:hover) .drop01 {

  flex-direction: row;
  flex-wrap: nowrap;
  animation-name: fadeOut;
  animation-duration: 0.8s;
}

@keyframes fadeOut {
  from {
	display: flex;
    opacity: 1;
    transform: translateY(0);
  }
  to {
	display: none;
    opacity: 0;
    transform: translateY(5px);
  }
}
</style>
<script>

</script>

	   
 
	   <c:if test="${main1 == 'main' }">
	   <style>
   
	body {
	   background: url("${contextPath}/resources/image/mainbar4.png");
	   background-repeat: repeat-x;
   }
   </style>
			   <div class="mainimg1">
	   <img src="${contextPath}/resources/image/main2.png">
	   </div>
			   </c:if>
	   
	   
	   <br>
	 
	  
	
</body>


</html>