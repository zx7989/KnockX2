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
  --background: #eee;
  --navbar-width: 260px;
  --navbar-width-min: 80px;
  --navbar-dark-primary: #e3e3e3; /*rgb(20, 0, 133)*/
  --navbar-dark-secondary: #eee;
  --navbar-light-primary: #000;
  --navbar-light-secondary: #000;
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
  position: absolute;
  left: 0px;
  top: 0px;
  background: var(--navbar-dark-primary);
  display: flex;
  flex-direction: column;
  color: var(--navbar-light-primary);
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  overflow: hidden;
  user-select: none;
  height:100%;
}
#nav-bar hr {
  margin: 0;
  position: relative;
  left: 16px;
  width: calc(100% - 32px);
  border: none;
  border-top: solid 1px rgb(20, 0, 133);
}
#nav-bar a {
  color: black;
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
  background: rgb(20, 0, 133);
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
.nav-button span {
  transition: opacity 1s;
  font-size: 20px;
}
.nav-button .fas {
  transition: min-width 0.2s;
}
/* .nav-button:nth-of-type(1):hover {
  color: var(--navbar-dark-primary);
}
.nav-button:nth-of-type(1):hover ~ #nav-content-highlight {
  top: 16px;
} */
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
/* .nav-button:nth-of-type(5):hover {
  color: var(--navbar-dark-primary);
}
.nav-button:nth-of-type(5):hover ~ #nav-content-highlight {
  top: 232px;
} */
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
  width: 32px;
  height: 32px;
  border-radius: 50%;
  overflow: hidden;
  transform: translate(0);
  transition: 0.2s;
}
#nav-footer-avatar img {
  height: 100%;
}

#nav-footer-titlebox {
  position: relative;
  margin-left: 16px;
  width: 10px;
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
</style>
<title>관리자MENU</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	
<div id="nav-bar">
	<input id="nav-toggle" type="checkbox"/>
	<div id="nav-header"><a id="nav-title" href="${contextPath}/admin/main/adminMain.do" target="_blank">관리자 모드</a>
	  <label for="nav-toggle"><span id="nav-toggle-burger"></span></label>
	  <hr/>
	</div>
	<div id="nav-content">
	  <div class="nav-button"><i class="fas fa-palette"></i><span><h3>상품관리</h3></span></div>
	  <div class="nav-button" onclick="location.href='${contextPath}/admin/goods/goodsList.do'"><i class="fas material-symbols-outlined">smartphone</i><span>상품 전체보기</span></div>
	  <div class="nav-button" onclick="location.href='${contextPath}/admin/goods/goodsListPhone.do'"><i class="fas material-symbols-outlined">smartphone</i><span>스마트폰</span></div>
	  <div class="nav-button" onclick="location.href='${contextPath}/admin/goods/goodsListAcc.do'"><i class="fas material-symbols-outlined">headphones</i><span>액세서리</span></div>
	  <div class="nav-button" onclick="location.href='${contextPath}/admin/goods/goodsListCase.do'"><i class="fas material-symbols-outlined">smartphone</i><span>케이스 및 기타</span></div>
	  <div class="nav-button"><i class="fas material-symbols-outlined"></i><span><h3>회원관리</h3></span></div>
	  <div class="nav-button" onclick="location.href='${contextPath}/member/listMembers.do'"><i class="fas material-symbols-outlined">phone_iphone</i><span>회원</span></div></a>
	  <div class="nav-button" onclick="location.href='${contextPath}/member/listShops.do'"><i class="fas material-symbols-outlined">man</i><span>사업자</span></div></a>
	  <div class="nav-button" onclick="location.href='${contextPath}/admin/order/shopOrderList.do'"><i class="fas material-symbols-outlined">└</i><span>주문관리</span></div></a>
	  <div class="nav-button" onclick="location.href='${contextPath}/admin/review/reviewListAll.do'"><i class="fas material-symbols-outlined">└</i><span>리뷰관리</span></div></a>
	  <div class="nav-button"><i class="fas fa-palette"></i><span><h3>Other</h3></span></div>
	  <div class="nav-button"><i class="fas material-symbols-outlined">man</i><span>Admin MODE</span></div>
	  <div id="nav-content-highlight"></div>
	</div>
	<!-- <input id="nav-footer-toggle" type="checkbox"/>
	<div id="nav-footer">
	  <div id="nav-footer-heading">
		<div id="nav-footer-avatar"><img src="https://gravatar.com/avatar/4474ca42d303761c2901fa819c4f2547"/></div>
		<div id="nav-footer-titlebox"><a id="nav-footer-title" href="https://codepen.io/uahnbu/pens/public" target="_blank">uahnbu</a><span id="nav-footer-subtitle">Admin</span></div>
		<label for="nav-footer-toggle"><i class="fas fa-caret-up"></i></label>
	  </div>
	  <div id="nav-footer-content">
		<Lorem>ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</Lorem>
	  </div>
	</div> -->
  </div>
	
	</body>
</html>