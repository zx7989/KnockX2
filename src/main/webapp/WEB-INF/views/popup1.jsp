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
 

 .modal {
  position: fixed;
  z-index: 9999; /* 모달 팝업을 다른 요소들보다 위에 표시 */
  top:91%;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5); /* 배경에 어둡게 표시 */
  display: none;
  align-items: center;
  justify-content: center;
  transition: transform 1.5s ease-out;
}
.modal:hover{
transform: translateY(-80%);
transition: 1.5s ease-out;
}
.modal:not(:hover) {
  transform: translateY(0); /* 마우스가 떠날 때 모달을 원래 위치로 돌려놓습니다. */
}
.modal-content {
  background-color: rgba(0, 0, 0, 0.5);
  border-radius: 5px;
  img{
    border-radius: 30px;
    border:10px solid rgb(0, 132, 255);
    padding:10px;
  }
}
.close{
  display: flex;
  margin:0 auto;
  width: 100%;
  justify-content: center;
  font-size: 25px;
  background-color: #131313a2;
  border:0px;
  font-weight: bold;
  color:rgb(57, 176, 255);
  &:hover{
    color:red;
  }
}
.spantitle{
  display: flex;
    margin:0 auto;
    justify-content: center;
    font-size: 25px;
    width:100%;
    background-color: rgba(0, 0, 0, 0);
    color:white;
    font-weight: bold;
}
.scale1{
  transform: scale(0.8);
  height:500px;
}
</style>
</head>
<body>
  <head>
    <title>FlexBox Exercise #3 - Image carousel / Responsive </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  
  <body>
    <div id="myModal" class="modal">
      <div class="modal-content">
        <button class="close">Team Knock X 2 project [ 닫기 X ]  <input type="checkbox" id="dontShowTodayCheckbox" style="transform: scale(1.5); margin:auto 10px"> <span style="color:white;">오늘 보지 않기</span></button>
        <span class="spantitle">KnockX2에 오신 것을 환영합니다.</span>
        <p><a href="${contextPath}/page/rate.do"><img src='${contextPath}/resources/image/goods_discount.png' width="500"/></a></p>
        <div class="main3 scale1">
          <jsp:include page="main_part1.jsp" ></jsp:include>
      </div>
        <label>
         
        </label>
      </div>
    </div>
<script>
// HTML 요소를 선택합니다.
const dontShowTodayCheckbox = document.querySelector('#dontShowTodayCheckbox');
const modal = document.querySelector('#myModal');
const closeButton = document.querySelector('.close');

// 체크박스 상태가 변경될 때마다 쿠키에 저장합니다.
dontShowTodayCheckbox.addEventListener('change', function() {
  if (dontShowTodayCheckbox.checked) {
    setCookie('hideTodayModal', 'true', 1); // 1시간 동안 유효한 쿠키 설정
  } else {
    deleteCookie('hideTodayModal');
  }
});

// close 버튼 클릭 시 모달을 닫고 쿠키를 확인하여 모달을 숨깁니다.
closeButton.addEventListener('click', function() {
  modal.style.display = 'none';
  setCookie('hideTodayModal', 'true', 1); // 1시간 동안 유효한 쿠키 설정
});

// 페이지 로드 시 저장된 상태를 확인하여 모달을 숨깁니다.
window.addEventListener('load', function() {
  const hideTodayModal = getCookie('hideTodayModal');
  if (hideTodayModal) {
    modal.style.display = 'none';
    dontShowTodayCheckbox.checked = true;
  } else {
    modal.style.display = 'block';
    dontShowTodayCheckbox.checked = false;
  }
});

// 쿠키를 설정하는 함수
function setCookie(name, value, hours) {
  const date = new Date();
  date.setTime(date.getTime() + (hours * 60 * 60 * 1000));
  const expires = "expires=" + date.toUTCString();
  document.cookie = name + "=" + value + ";" + expires + ";path=/";
}

// 쿠키를 삭제하는 함수
function deleteCookie(name) {
  document.cookie = name + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
}

// 쿠키를 가져오는 함수
function getCookie(name) {
  const cookieName = name + "=";
  const decodedCookie = decodeURIComponent(document.cookie);
  const cookieArray = decodedCookie.split(';');
  for (let i = 0; i < cookieArray.length; i++) {
    let cookie = cookieArray[i];
    while (cookie.charAt(0) === ' ') {
      cookie = cookie.substring(1);
    }
    if (cookie.indexOf(cookieName) === 0) {
      return cookie.substring(cookieName.length, cookie.length);
    }
  }
  return "";
}



</script>
</body>
</html>

