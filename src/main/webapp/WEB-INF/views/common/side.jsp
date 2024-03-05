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
<style>
	.no-underline{
		text-decoration: none;
	}

	:root {
  --background: #ffffff;
  --navbar-width: 250px;
  --navbar-width-min: 80px;
  --navbar-dark-primary: rgba(78, 78, 78);
  --navbar-dark-secondary: #666666;
  --navbar-light-primary: #f5f6fa;
  --navbar-light-secondary: #d8d8d8;
}

html, body {
  background: var(--background);
}

#nav-toggle:checked ~ #nav-header {
  width: calc(var(--navbar-width-min) - 16px);
}
#nav-toggle:checked ~ #nav-content, #nav-toggle:checked ~ #nav-footer {
  width: var(--navbar-width-min);
}
#nav-toggle:checked ~ #nav-header #nav-title {
  opacity: 0;
  pointer-events: none;
  transition: opacity 0.1s;
}
#nav-toggle:checked ~ #nav-header label[for=nav-toggle] {
  left: calc(50% - 8px);
  transform: translate(-50%);
}
#nav-toggle:checked ~ #nav-header #nav-toggle-burger {
  background: var(--navbar-light-primary);
}
#nav-toggle:checked ~ #nav-header #nav-toggle-burger:before, #nav-toggle:checked ~ #nav-header #nav-toggle-burger::after {
  width: 16px;
  background: var(--navbar-light-secondary);
  transform: translate(0, 0) rotate(0deg);
}
#nav-toggle:checked ~ #nav-content .nav-button span {
  opacity: 0;
  transition: opacity 0.1s;
}
#nav-toggle:checked ~ #nav-content .nav-button .fas {
  min-width: calc(100% - 16px);
}
#nav-toggle:checked ~ #nav-footer #nav-footer-avatar {
  margin-left: 0;
  left: 50%;
  transform: translate(-50%);
}
#nav-toggle:checked ~ #nav-footer #nav-footer-titlebox, #nav-toggle:checked ~ #nav-footer label[for=nav-footer-toggle] {
  opacity: 0;
  transition: opacity 0.1s;
  pointer-events: none;
}

#nav-bar {
  z-index: 0;
  position: absolute;
  left: 10px;
  top: 20px;
  background: var(--navbar-dark-primary);
  border-radius: 16px;
  display: flex;
  flex-direction: column;
  height:80%;
  max-height: 800px;
  color: var(--navbar-light-primary);
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  overflow: hidden;
  user-select: none;
}
#nav-bar hr {
  margin: 0;
  position: relative;
  left: 16px;
  width: calc(100% - 32px);
  border: none;
  border-top: solid 1px var(--navbar-dark-secondary);
}
#nav-bar a {
  color: inherit;
  text-decoration: inherit;
}
#nav-bar input[type=checkbox] {
  display: none;
}

#nav-header {
  position: relative;
  width: var(--navbar-width);
  left: 16px;
  width: calc(var(--navbar-width) - 16px);
  min-height: 80px;
  background: var(--navbar-dark-primary);
  padding-left:20px;
  border-radius: 16px;
  z-index: 2;
  display: flex;
  align-items: center;
  transition: width 0.2s;
}
#nav-header hr {
  position: absolute;
  bottom: 0;
}

#nav-title {
  font-size: 1.5rem;
  transition: opacity 1s;
}

label[for=nav-toggle] {
  position: absolute;
  right: 0;
  width: 3rem;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
}

#nav-toggle-burger {
  position: relative;
  width: 16px;
  height: 2px;
  background: var(--navbar-dark-primary);
  border-radius: 99px;
  transition: background 0.2s;
}
#nav-toggle-burger:before, #nav-toggle-burger:after {
  content: "";
  position: absolute;
  top: -6px;
  width: 10px;
  height: 2px;
  background: var(--navbar-light-primary);
  border-radius: 99px;
  transform: translate(2px, 8px) rotate(30deg);
  transition: 0.2s;
}
#nav-toggle-burger:after {
  top: 6px;
  transform: translate(2px, -8px) rotate(-30deg);
}

#nav-content {
  margin: -16px 0;
  padding: 16px 0;
  position: relative;
  flex: 1;
  width: var(--navbar-width);
  background: var(--navbar-dark-primary);
  box-shadow: 0 0 0 16px var(--navbar-dark-primary);
  direction: rtl;
  overflow-x: hidden;
  transition: width 0.2s;
}
#nav-content::-webkit-scrollbar {
  width: 8px;
  height: 8px;
}
#nav-content::-webkit-scrollbar-thumb {
  border-radius: 99px;
  background-color: #D62929;
}
#nav-content::-webkit-scrollbar-button {
  height: 16px;
}

#nav-content-highlight {
  position: absolute;
  left: 16px;
  top: -70px;
  width: calc(100% - 16px);
  height: 54px;
  background: var(--background);
  background-attachment: fixed;
  border-radius: 16px 0 0 16px;
  transition: top 0.2s;
}
#nav-content-highlight:before, #nav-content-highlight:after {
  content: "";
  position: absolute;
  right: 0;
  bottom: 100%;
  width: 32px;
  height: 32px;
  border-radius: 50%;
  box-shadow: 16px 16px var(--background);
}
#nav-content-highlight:after {
  top: 100%;
  box-shadow: 16px -16px var(--background);
}

.nav-button {
  position: relative;
  margin-left: 16px;
  height: 54px;
  display: flex;
  align-items: center;
  color: var(--navbar-light-secondary);
  direction: ltr;
  cursor: pointer;
  z-index: 1;
  transition: color 0.2s;
}
.nav-button1 {
  position: relative;
  margin-left: 16px;
  height: 54px;
  display: flex;
  align-items: center;
  color: var(--navbar-light-secondary);
  direction: ltr;
  cursor: pointer;
  z-index: 1;
  transition: color 0.2s;
}
.nav-button span {
  transition: opacity 1s;
  font-size: 20px;
}
.nav-button .fas {
  transition: min-width 0.2s;
}
.nav-button:nth-of-type(1):hover {
  color: var(--navbar-dark-primary);
}
.nav-button:nth-of-type(1):hover ~ #nav-content-highlight {
  top: 16px;
}
.nav-button:nth-of-type(2):hover {
  color: var(--navbar-dark-primary);
}
.nav-button:nth-of-type(2):hover ~ #nav-content-highlight {
  top: 70px;
}
.nav-button:nth-of-type(3):hover {
  color: var(--navbar-dark-primary);
}
.nav-button:nth-of-type(3):hover ~ #nav-content-highlight {
  top: 124px;
}
.nav-button:nth-of-type(4):hover {
  color: var(--navbar-dark-primary);
}
.nav-button:nth-of-type(4):hover ~ #nav-content-highlight {
  top: 178px;
}
.nav-button:nth-of-type(5):hover {
  color: var(--navbar-dark-primary);
}
.nav-button:nth-of-type(5):hover ~ #nav-content-highlight {
  top: 232px;
}
.nav-button:nth-of-type(6):hover {
  color: var(--navbar-dark-primary);
}
.nav-button:nth-of-type(6):hover ~ #nav-content-highlight {
  top: 286px;
}
.nav-button:nth-of-type(7):hover {
  color: var(--navbar-dark-primary);
}
.nav-button:nth-of-type(7):hover ~ #nav-content-highlight {
  top: 340px;
}
.nav-button:nth-of-type(8):hover {
  color: var(--navbar-dark-primary);
}
.nav-button:nth-of-type(8):hover ~ #nav-content-highlight {
  top: 394px;
}
.nav-button:nth-of-type(9):hover {
  color: var(--navbar-dark-primary);
}
.nav-button:nth-of-type(9):hover ~ #nav-content-highlight {
  top: 448px;
}
.nav-button:nth-of-type(10):hover {
  color: var(--navbar-dark-primary);
}
.nav-button:nth-of-type(10):hover ~ #nav-content-highlight {
  top: 502px;
}
.nav-button:nth-of-type(11):hover {
  color: var(--navbar-dark-primary);
}
.nav-button:nth-of-type(11):hover ~ #nav-content-highlight {
  top: 556px;
}
.nav-button:nth-of-type(12):hover {
  color: var(--navbar-dark-primary);
}
.nav-button:nth-of-type(12):hover ~ #nav-content-highlight {
  top: 610px;
}

#nav-bar .fas {
  min-width: 3rem;
  text-align: center;
}

#nav-footer {
  position: relative;
  width: var(--navbar-width);
  height: 54px;
  background: var(--navbar-dark-secondary);
  border-radius: 16px;
  display: flex;
  flex-direction: column;
  z-index: 2;
  transition: width 0.2s, height 0.2s;
}

#nav-footer-heading {
  position: relative;
  width: 100%;
  height: 54px;
  display: flex;
  align-items: center;
}

#nav-footer-avatar {
  position: relative;
  margin: 11px 0 11px 16px;
  left: 0;
  width: 60px;
  height: 100%;
  border-radius: 30%;
  overflow: hidden;
  transform: translate(0);
  transition: 0.2s;
}
#nav-footer-avatar img {
  height: 100%;
  width:100%;
}

#nav-footer-titlebox {
  position: relative;
  margin-left: 5px;
  font-size:15px;
  display: flex;
  flex-direction: column;
  transition: opacity 1s;
}

#nav-footer-subtitle {
  color: var(--navbar-light-secondary);
  font-size: 0.6rem;
}

#nav-toggle:not(:checked) ~ #nav-footer-toggle:checked + #nav-footer {
  height: 30%;
  min-height: 54px;
}
#nav-toggle:not(:checked) ~ #nav-footer-toggle:checked + #nav-footer label[for=nav-footer-toggle] {
  transform: rotate(180deg);
}

label[for=nav-footer-toggle] {
  position: absolute;
  right: 0;
  width: 3rem;
  height: 100%;
  display: flex;
  align-items: center;
  cursor: pointer;
  transition: transform 0.2s, opacity 0.2s;
}

#nav-footer-content {
  margin: 0 16px 16px 16px;
  border-top: solid 1px var(--navbar-light-secondary);
  padding: 16px 0;
  color: var(--navbar-light-secondary);
  font-size: 0.8rem;
  overflow: auto;
}
#nav-footer-content::-webkit-scrollbar {
  width: 8px;
  height: 8px;
}
#nav-footer-content::-webkit-scrollbar-thumb {
  border-radius: 99px;
  background-color: #D62929;
}
.material-symbols-outlined{
  margin:0 5px;
}
</style>
<title>MENU</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
  
  <div id="nav-bar">
  <input id="nav-toggle" type="checkbox"/>

  <c:choose>
  <c:when test="${ sideMode == 'page'}">
	<div id="nav-header"><a id="nav-title" href="https://codepen.io" target="_blank">Menu</a>
	  <label for="nav-toggle"><span id="nav-toggle-burger"></span></label>
	  <hr/>
	</div>
	<div id="nav-content">
	  <div class="nav-button"><i class="fas fa-palette"></i><span><h3>SAMSUNG</h3></span></div>
	  <div class="nav-button"><i class="fas material-symbols-outlined">smartphone</i><span>Galuxy Series</span></div>
	  <div class="nav-button"><i class="fas material-symbols-outlined">smartphone</i><span>Galuxy Z</span></div>
	  <div class="nav-button"><i class="fas material-symbols-outlined">smartphone</i><span>Galuxy S</span></div>
	  <div class="nav-button"><i class="fas material-symbols-outlined">iOS</i><span><h3>Apple</h3></span></div>
	  <div class="nav-button"><i class="fas material-symbols-outlined">phone_iphone</i><span>i Phone</span></div>
	  <div class="nav-button"><i class="fas material-symbols-outlined">smartphone</i><span>Galuxy Z</span></div>
	  <div class="nav-button"><i class="fas material-symbols-outlined">smartphone</i><span>Galuxy S</span></div>
	  <div class="nav-button"><i class="fas fa-palette"></i><span><h3>Other</h3></span></div>
	  <div class="nav-button"><i class="fas material-symbols-outlined">smartphone</i><span>Other Phone</span></div>
	  <div id="nav-content-highlight"></div>
	</div>
</c:when>
  <c:when test="${ sideMode == 'listArticles'}">
    <div id="nav-header"><a id="nav-title" href="https://codepen.io" target="_blank">Menu</a>
      <label for="nav-toggle"><span id="nav-toggle-burger"></span></label>
      <hr/>
    </div>
    <div id="nav-content">
      <div class="nav-button"><i class="fas material-symbols-outlined"style="font-size: 40px !important; margin-right:10px;">check_circle</i><span><h3><a href="${contextPath}/board/listAdminArticles.do">공지사항</a></h3></span></div>
      <div class="nav-button"><i class="fas material-symbols-outlined">man</i><span><a href="${contextPath}/board/listArticles.do">회원 게시판</a></span></div>
      <div class="nav-button"><i class="fas material-symbols-outlined">man</i><span><a href="${contextPath}/board/listShopArticles.do">사업자 게시판</a></span></div>
      <div class="nav-button"><i class="fas material-symbols-outlined">man</i><span ><a href="${contextPath}/board/listSamsungArticles.do">삼성 게시판</a></span></div>
      <div class="nav-button"><i class="fas material-symbols-outlined">ios</i><span><a href="${contextPath}/board/listAppleArticles.do">애플 게시판</a></span></div>
      <!-- <div class="nav-button"><i class="fas material-symbols-outlined">man</i><span>Galuxy Z</span></div>
      <div class="nav-button"><i class="fas material-symbols-outlined">man</i><span>Galuxy S</span></div> -->
      <div class="nav-button"><i class="fas material-symbols-outlined" style="font-size: 40px !important; margin-right:10px;">support_agent</i><span><h3><a href="${contextPath}/board/qna.do">고객센터</a></h3></span></div>
      <div class="nav-button"><i class="fas material-symbols-outlined">phone</i><span>042-123-4567</span></div>
      <div id="nav-content-highlight"></div>
    </div>
  </c:when>
  <c:when test="${ sideMode == 'shop'}">
      <div id="nav-header"><a id="nav-title" href="#" target="_blank">Menu</a>
        <label for="nav-toggle"><span id="nav-toggle-burger"></span></label>
        <hr/>
      </div>
      <div id="nav-content">
        <div class="nav-button"><i class="fas fa-palette"></i><span><h3>SMART STORE</h3></span></div>
        <div class="nav-button"><a href="${contextPath}/shop/listShop.do"><i class="fas material-symbols-outlined">storefront</i><span>전체목록</span></div></a> 
        <div class="nav-button"><a href="${contextPath}/shop/listNewShop.do"><i class="fas material-symbols-outlined">storefront</i><span>신규업체</span></div></a>
        <div class="nav-button"><a href="${contextPath}/shop/shopRank.do"><i class="fas material-symbols-outlined">thumb_up</i><span>[랭킹]파워스토어</span></div></a> 
        <div id="nav-content-highlight"></div>
      </div>
    </c:when>
    <c:when test="${ sideMode == 'shop01'}">
   <div id="nav-header"><a id="nav-title" href="#" target="_blank">Menu</a>
        <label for="nav-toggle"><span id="nav-toggle-burger"></span></label>
        <hr/>
      </div>
      <div id="nav-content">
        <div class="nav-button"><i class="fas"></i><span><h3>SMART STORE</h3></span></div>
        <div class="nav-button"><a href="${contextPath}/shop/shopMain.do?shop_code=${shopInfo.shopVO.shop_code}"><i class="material-symbols-outlined">storefront</i><span>전체상품</span></div></a> 
        <div class="nav-button"><a href="${contextPath}/shop/shopPhonesList.do?shop_code=${shopInfo.shopVO.shop_code}"><i class="material-symbols-outlined">smartphone</i><span>스마트폰</span></div></a> 
        <div class="nav-button"><a href="${contextPath}/shop/shopAccsList.do?shop_code=${shopInfo.shopVO.shop_code}"><i class="material-symbols-outlined">media_output</i><span>악세서리</span></div></a> 
        <div class="nav-button"><a href="${contextPath}/shop/shopCasesList.do?shop_code=${shopInfo.shopVO.shop_code}"><i class="material-symbols-outlined">work</i><span>케이스</span></div></a> 
        <div class="nav-button"><a href="${contextPath}/shop/listShop.do"><i class="material-symbols-outlined">storefront</i><span>신규업체</span></div></a> 
        <div class="nav-button"><a href="${contextPath}/shop/listShop.do"><i class="material-symbols-outlined">thumb_up</i><span>[랭킹]파워스토어</span></div></a> 
        <div id="nav-content-highlight"></div>
      </div>
    </c:when>
    <c:when test="${ sideMode == 'myPage'}">
      <div id="nav-header"><a id="nav-title" href="#" target="_blank">Menu</a>
           <label for="nav-toggle"><span id="nav-toggle-burger"></span></label>
           <hr/>
         </div>
         <div id="nav-content">
           <div class="nav-button"><i class="fas fa-palette"></i><span><h3>회원</h3></span></div>
           <div class="nav-button"><a href="${contextPath }/myPage/myPageMainForm.do?id=${member.id}&memberSort=${member.memberSort}"><i class="fas material-symbols-outlined">storefront</i><span>내 정보관리</span></div></a> 
          <div class="nav-button"><a href="${contextPath}/myPage/myOrderList.do?id=${member.id}&memberSort=${member.memberSort}"><i class="fas material-symbols-outlined">storefront</i><span>내가 구매한 상품</span></div></a> 
          <div class="nav-button"><a href="${contextPath}/myPage/modMemberForm.do?id=${member.id}&memberSort=${member.memberSort}"><i class="fas material-symbols-outlined">storefront</i><span>내 정보수정</span></div></a> 
          <div class="nav-button"><a href="${contextPath }/cart/myCartList.do?id=${member.id}&memberSort=${member.memberSort}"><i class="fas material-symbols-outlined">shopping_cart</i><span>내 장바구니</span></div></a> 
          <c:if test="${kakaoLog != null}">
            <div class="nav-button1" style="position: absolute; bottom:50px; left:10px;">
            <img style="margin:0;" src="${contextPath}/resources/image/kakaoid.png" width="50px"><span style="border-radius: 30px;background-color: rgb(87, 35, 0); color:yellow;padding:5px;font-size: 13px;">카카오인증회원<br>식별:ID<input style="width:80px; padding:1px; color:white;" type="text" value="${member.kakaoid}" disabled><br><a style="color:black;border-radius: 10px; background-color: rgb(241, 241, 241); margin:5px; padding:5px;" href="${contextPath}/removeKakao.do?id=${mem.id}">연동끊기</a></span>
            </div>
          </c:if>
          <c:if test="${kakaoLog == null}">
            <div class="nav-button1" style="position: absolute; bottom:50px; left:10px;">
            <img style="margin:0;" src="${contextPath}/resources/image/kakaoid.png" width="50px"><a href="https://kauth.kakao.com/oauth/authorize?client_id=2840b2919a36903a43e08af211aab685&redirect_uri=http://localhost:8091/auth/kakao/add&response_type=code"><span style="border-radius: 30px;background-color: rgb(87, 35, 0); color:yellow;padding:5px;">카카오 인증하기</a></span>
            </div>
          </c:if>
          <div id="nav-content-highlight"></div>
         </div>
       </c:when>
       <c:when test="${ sideMode == 'myShopPage'}">
      <div id="nav-header"><a id="nav-title" href="#" target="_blank">Menu</a>
           <label for="nav-toggle"><span id="nav-toggle-burger"></span></label>
           <hr/>
         </div>
         <div id="nav-content">
          <div class="nav-button"><i class="fas fa-palette"></i><span><h3>사업자</h3></span></div>
          <div class="nav-button"><a href="${contextPath }/myPage/myPageMainForm.do?id=${member.id}&memberSort=${member.memberSort}"><i class="fas material-symbols-outlined">storefront</i><span>나의 정보관리</span></div></a> 
          <div class="nav-button"><a href="${contextPath}/myPage/modMemberForm.do?id=${member.id}&memberSort=${member.memberSort}"><i class="fas material-symbols-outlined">storefront</i><span>나의 정보수정</span></div></a> 
          <div class="nav-button"><a href="${contextPath}/myPage/myGoodsList.do?shop_code=${shop.shop_code}"><i class="fas material-symbols-outlined">storefront</i><span>나의 상품관리</span></div></a> 
          <div class="nav-button"><a href="${contextPath}/myPage/myShopOrderList.do?id=${member.id}&memberSort=${member.memberSort}&shop_code=${shop.shop_code}"><i class="fas material-symbols-outlined">storefront</i><span>고객 주문관리</span></div></a> 
          <div id="nav-content-highlight"></div>
          <c:if test="${kakaoLog != null}">
            <div class="nav-button1" style="position: absolute; bottom:50px; left:10px;">
            <img style="margin:0;" src="${contextPath}/resources/image/kakaoid.png" width="50px"><span style="border-radius: 30px;background-color: rgb(87, 35, 0); color:yellow;padding:5px;font-size: 13px;">카카오인증회원<br>식별:ID<input style="width:80px; padding:1px; color:white;" type="text" value="${member.kakaoid}" disabled><br><a style="color:black;border-radius: 10px; background-color: rgb(241, 241, 241); margin:5px; padding:5px;" href="${contextPath}/removeKakao.do?id=${mem.id}">연동끊기</a></span>
            </div>
          </c:if>
          <c:if test="${kakaoLog == null}">
            <div class="nav-button1" style="position: absolute; bottom:50px; left:10px;">
            <img style="margin:0;" src="${contextPath}/resources/image/kakaoid.png" width="50px"><a href="https://kauth.kakao.com/oauth/authorize?client_id=2840b2919a36903a43e08af211aab685&redirect_uri=http://localhost:8091/auth/kakao/add&response_type=code"><span style="border-radius: 30px;background-color: rgb(87, 35, 0); color:yellow;padding:5px;">카카오 인증하기</a></span>
            </div>
          </c:if>
        </div>
       </c:when>
  </c:choose>
  <input id="nav-footer-toggle" type="checkbox"/>
  <div id="nav-footer">
    <div id="nav-footer-heading">
    <div id="nav-footer-avatar">
      <c:choose>
        <c:when test="${member.id != null}">
          <img src="${contextPath}/download1.do?id=${member.id}&imageFN=${member.imageFN}" id="preview"  /></div>
          <div id="nav-footer-titlebox"><a id="nav-footer-title" href="#" target="_blank">${member.name}님 어서오세요.</a></span></div>
          <label for="nav-footer-toggle"><i class="fas fa-caret-up"></i></label>
          </div>
          <div id="nav-footer-content">
          <Lorem>아이디:${member.id}<br>이름:${member.name}<br>생일:${member.birth}<br>가입일:${member.joinDate}</Lorem>
          </div>
      </c:when>
        <c:otherwise>
          <i class=" material-symbols-outlined" style="padding:15px 0;">man</i></div>
          <div id="nav-footer-titlebox"><a id="nav-footer-title" href="#" target="_blank">로그인 해주세요!</a></span></div>
          <label for="nav-footer-toggle"><i class="fas fa-caret-up"></i></label>
          </div>
          <div id="nav-footer-content">
          <Lorem>회원가입이 필요합니다.</Lorem>
          </div>
        </c:otherwise>
    </c:choose>
     
  </div>
  </div>
	
	</body>
</html>