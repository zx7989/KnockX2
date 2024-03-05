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
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>스마트초이스 API 호출</title>
    <style>
        body{
            background-color: rgba(60, 0, 172, 0.007);
           
        }
        #container1{
          background-image: url("${contextPath}/resources/image/back01.png") ;
        background-size: cover;
        background-repeat: no-repeat;
        background-position: left 50% top 0;
        }
        #header{
          background-image: url("${contextPath}/resources/image/back01.png") ;
        background-size: cover;
        background-repeat: no-repeat;
        background-position: left 50% top 200px;
        }
        #footer{
          background-image: url("${contextPath}/resources/image/back01.png") ;
        background-size: cover;
        background-repeat: no-repeat;
        background-position: left 50% top 0;
        .footer{
          background-image: url("${contextPath}/resources/image/back01.png") ;

        }
        margin:0;
        }
        iframe{
          background-color: white;
        }
        .tab {
            display: none;
        }
        .tab.active {
            display: block;
        }
        .albumOut{
            margin:0 auto;
            background: url("${contextPath}/resources/image/wing1.png") ;
            background-size: contain;
            background-position: left 50% top 100px;
            background-repeat: no-repeat;
            width:100%;
            text-align: center;
            align-content: center;
            z-index: 0;
        }
        .album {
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
            z-index: 1;
            a {
                font-size: 17px;
                border: 2px solid rgb(187, 187, 187);
                padding: 3px;
                border-radius: 30px;
                margin: 0 15px;
            }
            a:hover {
                background-color: rgb(0, 0, 124);
                color: white;
                font-weight: bold;
            }
            .album-item p{
                margin:20px;
            }
           
        }
        #resultAlbumKT div,#resultAlbumLGU div,#resultAlbumSKT div {
            display: flex;
            flex-direction: column;
            
            margin: 10px;
            justify-content: space-between;

        }
      
        .album-item {
            word-break: keep-all;
            box-shadow: 0 2px 30px rgba(0, 0, 0, 0.5);
            position: relative;
            width: 350px;
            -webkit-user-drag: none;
            height: 300px;
            user-select: none;
            border-radius: 40px;
            white-space: nowrap;
            overflow: hidden;
            display: inline-block;
            transition: all 0.2s ease-out;
            transform: scale(1.0);
            padding:10px;
            background-color: white;
            h3{
                margin-top:15px;
                margin-bottom:0;
            }
        }
        .album-item:hover {
            transform: scale(1.05);
            background-color: #ffeded;
        }
        .input-group {
            padding:10px;
    margin: 0px;
    margin-top:0px;
    border-bottom:0.5px solid #2c3e50;
}
.input-groups {
    margin-bottom: 10px;
    flex-direction: column;
    clear: both;
}


label {
    display: block;
    font-weight: bold;
}

input[type="range"]
 {
    width: 70%;
    -webkit-appearance: none;
  height: 10px;
  border-radius: 5px;
  background: #7bc4ff;
  outline: none;
  padding:3px;
  display: inline;
}


input[type="range"]::-webkit-slider-thumb {
    -webkit-appearance: none;
          appearance: none;
  width: 25px;
  height: 25px;
  border-radius: 50%;
  background: #00d9ff;
  border:8px solid rgb(87, 87, 87);
  cursor: pointer;
  -webkit-transition: background 0.15s ease-in-out;
  transition: background 0.15s ease-in-out;

  

}
input[type="range"]::-webkit-slider-thumb:hover {
    -webkit-appearance: none;
          appearance: none;
  width: 25px;
  height: 25px;
  border-radius: 50%;
  background: #ff0000;
  border:8px solid rgb(87, 87, 87);
  cursor: pointer;
  -webkit-transition: background 0.15s ease-in-out;
  transition: background 0.15s ease-in-out;

  

}


.input-group input[type="text"] {
    display: inline;
    width: 180px;
    padding: 7px;
    font-size: 17px;
    border-radius: 10px;
  font-size:20px;
    border: 1px solid #ccc;

}
input[type="text"] {
  width: 100%;
  border: 2px solid #aaa;
  outline: none;
  padding: 8px;
  box-sizing: border-box;
  transition: 0.3s;
  color:#616161;
  font-weight: bold;
}

input[type="text"]:focus {
  border-color: dodgerBlue;
  box-shadow: 0 0 8px 0 dodgerBlue;
}

.inputWithIcon input[type="text"] {
  padding-left: 60px;
}

.inputWithIcon {
    float:right;
  position: relative;
  top:-25px;
  right:50px;
  height:19px;
}


    .inputWithIcon .inputIconBg {
        position: absolute;
        top: 50%;
        right: 10px;
        font-size: 18px;
        font-weight: bold;
        color: #999;
    }

.inputWithIcon i {
  position: absolute;
  left: 2px;
  top: 3px;
  padding-top:2px;
  height:100%;
  font-size:25px;
  color: #aaa;
  transition: 0.3s;
}

.inputWithIcon input[type="text"]:focus + i {
  color: dodgerBlue;
}

.inputWithIcon.inputIconBg i {
  background-color: #aaa;
  color: #fff;
  padding: 9px 4px;
  border-radius: 4px 0 0 4px;
}

.inputWithIcon.inputIconBg input[type="text"]:focus + i {
  color: #fff;
  background-color: dodgerBlue;
}

                        #inputForm{
                            width:1300px;
                            margin:15px auto;
                            border:30px solid rgba(0, 142, 236, 0.979);
                            border-radius: 150px;
                            background-color: rgba(255, 245, 245, 0.89);
                            box-shadow: 10px 10px 30px rgb(59, 59, 59);
                            transform: scale(0.9);
                            padding:5px;
                            
                            fieldset{
                                border:0px;
                                border-top:20px solid rgb(199, 199, 199);
                                border-radius: 50px 50px;
                                position: relative;
                                legend{
                                    padding:10px 300px;
                                    background-color: #3b3b3b;
                                    color:rgb(255, 255, 255);
                                    font-size: 40px;
                                    font-weight: bold;
                                    box-shadow: 3px 3px 3px black;
                                    border-radius: 20px;
                                }
                            }
                        }
        .radio-groups{
            display: inline;
            margin:20px;
            padding:0 auto;
            text-align: center;
            
            img{
                width:130px;
                height:30px;
                margin:10px;

            }
        } .radio-group input[type="radio"] {
        display: none;
    }
   
        .radio-group{
            
            display: inline-block;
            margin:10px;
            width:200px;
            border:2px solid rgb(182, 182, 182);
            background-color: rgb(255, 255, 255);
            list-style: none;
            border-radius: 30px 0;
            box-shadow: 1px 1px 10px #1379ff;
            font-size: 25px;
            font-style: italic;
            overflow: hidden;
            label{
                display: flex;
        align-items: center;
        justify-content: center;
                height:70px;
                padding:auto 0;
            }
            
           

        }
        
.custom-btn {
  width: 130px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-weight: bold;
  font-size: 20px;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
  margin:10px;
}
.btn-3 {
  background: rgb(0,172,238);
background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(2,126,251,1) 100%);
  width: 130px;
  height: 40px;
  line-height: 42px;
  padding: 0;
  border: none;
  
}
.btn-3 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
}
.btn-3:before,
.btn-3:after {
  position: absolute;
  content: "";
  right: 0;
  top: 0;
   background: rgba(2,126,251,1);
  transition: all 0.3s ease;
}
.btn-3:before {
  height: 0%;
  width: 2px;
}
.btn-3:after {
  width: 0%;
  height: 2px;
}
.btn-3:hover{
   background: transparent;
  box-shadow: none;
  background-color: black;
}
.btn-3:hover:before {
  height: 100%;
}
.btn-3:hover:after {
  width: 100%;
}
.btn-3 span:hover{
   color: rgba(2,126,251,1);
}
.btn-3 span:before,
.btn-3 span:after {
  position: absolute;
  content: "";
  left: 0;
  bottom: 0;
   background: rgba(2,126,251,1);
  transition: all 0.3s ease;
}
.btn-3 span:before {
  width: 2px;
  height: 0%;
}
.btn-3 span:after {
  width: 0%;
  height: 2px;
}
.btn-3 span:hover:before {
  height: 100%;
}
.btn-3 span:hover:after {
  width: 100%;
}
.input-group button{
    clear: both;
    margin:20px 10px;
    height: 40px;;
    font-size: 15px;
    font-weight: bold;
    border-radius: 10px;
    background-color: rgb(255, 255, 255);
    color:rgb(26, 26, 26);
    border: 3px solid;
}
.input-group button:hover{
    background-color: black;
    color:white;
    border: 3px solid rgb(248, 248, 248);

}
.input-group label {
    
    display: block;
    margin-bottom: 5px;
    margin:10px;
    margin-left:100px;
    margin-bottom:30px;
    font-size: 30px;
    width:200px;
    padding:3px;
    background-color: rgb(0, 110, 255);
    color:rgb(248, 248, 248);
    border: 1px solid rgb(255, 255, 255);
    border-radius: 20px 0;
    
} #result {
            font-size: 36px;
            background-color: #4538ff;
            color:white;
            white-space: nowrap;
            overflow: hidden;
        }
.recom1{
    position:absolute; right:20px; top:20px;
    border-left: 7px solid transparent;
  border-right: 7px solid transparent;
  border-bottom: 10px solid red;
    color:white;
    background-color: rgb(0, 68, 255);
    border-radius: 15px 15px 0px 0px;
    padding:2px;
    font-size: 17px;
   
}
.swbox1{
    width:250px;
    position: absolute; right:100px; top:100px;
    display: flex;
    font-size: 18px;
}
#switch{
    top:15px;
    width: 75px;
    height: 40px;
}

.toggle{
    position: absolute; right:0;
    border: 3px solid #444249;
    border-radius: 20px;
    -webkit-transition: border-color .6s  ease-out;
    transition: border-color .6s  ease-out;
    box-sizing: border-box;

}

.toggle.toggle-on{
    border-color: rgba(137, 194, 217);
    -webkit-transition: all .5s .15s ease-out;
    transition: all .5s .15s ease-out;
}

.toggle-button{
    position: absolute;
    top: 4px;
    width: 28px;
    bottom: 4px;
    right: 39px;
    background-color: #444249;
    border-radius: 19px; 
    cursor: pointer;
    -webkit-transition: all .3s .1s, width .1s, top .1s, bottom .1s;
    transition: all .3s .1s, width .1s, top .1s, bottom .1s;
}

.toggle-on .toggle-button{
    top: 3px;
    width: 65px;
    bottom: 3px;
    right: 3px;
    border-radius: 23px;
    background-color: #55a4ff;
    -webkit-transition: all .2s .1s, right .1s;
    transition: all .2s .1s, right .1s;
}


.toggle-text-on{
    position: absolute;
    top: -3px;
    bottom: 0;
    left: 0;
    right: 0;
    line-height: 36px;
    text-align: center;
    font-family: 'Quicksand', sans-serif;
    font-size: 18px;
    font-weight: bold;
    cursor: pointer;
    -webkit-user-select: none; /* Chrome/Safari */    
    -moz-user-select: none; /* Firefox */
    -ms-user-select: none; /* IE10+ */


    color: rgba(0,0,0,0);
}

.toggle-on .toggle-text-on{
    color: #00415a;
    -webkit-transition: color .3s .15s ;
    transition: color .3s .15s ;
}

.toggle-text-off{
    position: absolute;
    top: 0;
    bottom: 0;
    right: 6px;
    line-height: 36px;
    text-align: center;
    font-family: 'Quicksand', sans-serif;
    font-size: 16px;
    font-weight: bold;
    -webkit-user-select: none; /* Chrome/Safari */        
    -moz-user-select: none; /* Firefox */
    -ms-user-select: none; /* IE10+ */

    cursor: pointer;

    color: #444249;
}

.toggle-on .toggle-text-off{
    color: rgba(0,0,0,0);
}

/* used for streak effect */
.glow-comp{
    position: absolute;
    opacity: 0;
    top: 10px;
    bottom: 10px;
    left: 10px;
    right: 10px;
    border-radius: 6px;
    background-color: rgba(75, 122, 141, .1);
    box-shadow: 0 0 12px rgba(75, 122, 141, .2);
    -webkit-transition: opacity 4.5s 1s;
    transition: opacity 4.5s 1s;
}

.toggle-on .glow-comp{
    opacity: 1;
    -webkit-transition: opacity 1s;
    transition: opacity 1s;
}
.modal {
  position: fixed;
  z-index: 9999; /* 모달 팝업을 다른 요소들보다 위에 표시 */
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5); /* 배경에 어둡게 표시 */
  display: none;
  align-items: center;
  justify-content: center;
}

.modal-content {
  background-color: #ffffff;
  border-radius: 5px;
  img{
    padding: 10px;;
    border-radius: 20px;
    border:5px solid rgb(0, 153, 255);
    width:40%;
    height: 40%;
  }
}
.close{
  display: flex;
  margin:0 auto;
  width: 100%;
  justify-content: center;
  font-size: 25px;
  background-color: #131313d3;
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
    font-size: 20px;
    width:100%;
    background-color: rgb(255, 255, 255);
    color:rgb(39, 39, 39);
    font-weight: bold;
}
    </style>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
    <style>
		@media screen and (min-width: 1800px) {
		
		#inputForm{
			width: 1300px;
            margin:0 auto;
		}
        #container1{
			width: 100%
		}
	}
    @media screen and (max-width: 1300px) {
		
		#inputForm{
			width: 1100px;
            margin:0 auto;
		}
	}
    
	</style>
    <c:if test="${ mode == 'rate'}">
		<style>
		@media screen and (min-width: 1800px) {
		
		
	}
	</style>
	
	</c:if>
    <div id="myModal" class="modal">
        <div class="modal-content">
          <span class="close">닫기 &times;</span>
          <span class="spantitle">KnockX2 요금제 추천 서비스<br>나에게 필요한 요금제를 추천해드립니다.</span>
          <p><img src='${contextPath}/resources/image/rate_discount.png'/>
          <img src='${contextPath}/resources/image/rate_discount1.png'/></p>
          <label>
            <input type="checkbox" id="dontShowTodayCheckbox"> 오늘 보지 않기
           
          </label>
        </div>
      </div>
    <div class="albumOut">
    <form id="inputForm">
        <fieldset>
            <legend>
                </span>요금제 추천 <span style="font-size: 40px;"class="material-symbols-outlined">
                    rocket_launch
                    </span></legend>
                    
            <div class="radio-groups">
                <img src='${contextPath}/resources/image/kt_logo.svg'/> 
                    <img style="margin:5px" src='${contextPath}/resources/image/uplus_logo.svg'/> 
                    <img src='${contextPath}/resources/image/skt_logo.svg'/><br>
                <div class="radio-group">
                    <input type="radio" id="type1" name="type" value="3" checked onclick="changeBackgroundColor('type1')">
                    <label for="type1">LTE</label>
                </div>
                <div class="radio-group">
                    <input type="radio" id="type2" name="type" value="6" onclick="changeBackgroundColor('type2')"/>
                    <label for="type2">5G</label>
                </div>
                <div class="swbox1"><h3>선택약정할인 25%</h3><div class='toggle' id='switch'>
                    <div class='toggle-text-off'>OFF</div>
                    <div class='glow-comp'></div>
                    <div class='toggle-button'></div>
                    <div class='toggle-text-on'>ON</div>
            </div></div>
        </div>
            <div class="input-groups">
                <div class="input-group">
                    <div style="display: flex;">
                <label for="voice">음성통화</label><h3>(단위:분)</h3>
                </div>
                <input type="range" id="voice" name="voice" min="0" step="10" max="800"  value="100">
                <div class="inputWithIcon inputIconBg">
                <input type="text" id="voiceValue" name="voiceValue" maxlength="3" max="800" value="100">
                <div class="inputIconBg">분</div>
                <i class="fa fa-phone fa-lg fa-fw" aria-hidden="true"></i>
                </div>
            </div>
            <div class="input-group ">
                    <div style="display: flex;">
                <label for="data">데이터</label><h3>(단위:GB)</h3>
                </div>
                <input type="range" id="data" name="data" min="0" step="10" max="1000" value="300">
                <div class="inputWithIcon inputIconBg">
                <input type="text" id="dataValue" name="dataValue" maxlength="3" value="300">
                <div class="inputIconBg">GB</div>
                <i class="fa fa-wifi fa-lg fa-fw" aria-hidden="true"></i>
                    </div>
            </div>
                <div class="input-group">
                    <div style="display: flex; ">
                <label for="sms">문자</label><h3>(단위:건)</h3>
                </div>
                <input type="range" id="sms" name="sms" min="0" step="10" max="1000" value="50">
                <div class="inputWithIcon inputIconBg">
                <input type="text" id="smsValue" name="smsValue" value="50">
                <div class="inputIconBg">건</div>
                <i class="fa fa-coment fa-lg fa-fw" aria-hidden="true"><span style="font-size: 25px;"class="material-symbols-outlined">
                    sms
                    </span></i>
                        </div>
            </div>
            <div class="input-group">
                <div style="display: flex;">
                <label for="age">나이</label><button type="button" id="ageButton" >청소년</button>
                <button type="button" id="ageButton1">성인</button>
                <button type="button" id="ageButton2">실버[65세 이상]</button>
            </div>
                <input type="range" id="age" name="age" min="0" max="100" value="20">
                <div class="inputWithIcon inputIconBg">
                <input type="text" id="ageValue" name="ageValue" value="20">
                <div class="inputIconBg">세</div>
                <i class="fa fa-age fa-lg fa-fw" aria-hidden="true"><span style="font-size: 25px;"class="material-symbols-outlined">
                    Emoji_People
                    </span></i>
                        </div>
            </div>
            <div class="input-group">
                <div style="display: flex;">
                <label for="dis">약정기간</label>
                <button type="button" id="disButton" >무약정</button>
                <button type="button" id="disButton1">12개월</button>
                <button type="button" id="disButton2">24개월</button>
                <button type="button" id="disButton3">36개월</button>
            </div>
                <input type="range" id="dis" name="dis" min="0" max="36" step="6" value="24">
               
                <div class="inputWithIcon inputIconBg">
                <input type="text" id="disValue" name="disValue" value="24">
                <div class="inputIconBg">개월</div>
                <i class="fa fa-distance fa-lg fa-fw" aria-hidden="true"><span style="font-size: 25px;"class="material-symbols-outlined">
                    calendar_month
                    </span></i>
                        </div>
            </div>
        </div>
            <input type="submit" class="resultAll custom-btn btn-3" value="요금제 확인">
            <input type="reset" class="resultAll custom-btn btn-3" value="되돌리기">
    </fieldset> 
    </form>
</div>
<div id="result"></div>
    <div class="album">
        <div id="resultAlbumKT"></div>
        <div id="resultAlbumLGU"></div>
        <div id="resultAlbumSKT"></div>
        </div>
        <div id="iframeContainer"></div>

<script>
 const closeModalBtn = document.querySelector(".close");
const modal = document.querySelector(".modal");
const dontShowTodayCheckbox = document.getElementById("dontShowTodayCheckbox");

// 쿠키를 읽어서 오늘 보지 않기가 체크되어 있는지 확인
const cookieValue = getCookie("dontShowTodayCheckbox");
if (cookieValue === "true") {
  modal.style.display = "none"; // 오늘 보지 않기가 체크되어 있으면 모달을 숨김
} else {
  modal.style.display = "block"; // 오늘 보지 않기가 체크되어 있지 않으면 모달을 보여줌
}

// "×" 버튼 클릭 시 모달 닫기
closeModalBtn.addEventListener("click", function() {
  modal.style.display = "none";
  setDontShowTodayCookie();
});

function closeModal(event) {
  // 클릭한 요소가 모달 창 아이디인 경우에만 모달을 닫지 않습니다.
  if (event.target.id === "myModal") {
    modal.style.display = "none";
    setDontShowTodayCookie();
  }
}

// 모달 바깥 부분 클릭 이벤트를 등록합니다.
modal.addEventListener("click", closeModal);

// 모달을 닫을 때 오늘 보지 않기 쿠키 처리
function setDontShowTodayCookie() {
  if (dontShowTodayCheckbox.checked) {
    setCookie("dontShowTodayCheckbox", "true", 1); // 쿠키 만료일을 1일로 설정
  } else {
    setCookie("dontShowTodayCheckbox", "false", 1);
  }
}

// 쿠키 설정 함수
function setCookie(cookieName, cookieValue, expirationDays) {
  const date = new Date();
  date.setTime(date.getTime() + (expirationDays * 60 * 60 * 1000));
  const expires = "expires=" + date.toUTCString();
  document.cookie = cookieName + "=" + cookieValue + ";" + expires + ";path=/";
}

// 쿠키 가져오기 함수
function getCookie(cookieName) {
  const name = cookieName + "=";
  const decodedCookie = decodeURIComponent(document.cookie);
  const cookieArray = decodedCookie.split(";");
  for (let i = 0; i < cookieArray.length; i++) {
    let cookie = cookieArray[i];
    while (cookie.charAt(0) === " ") {
      cookie = cookie.substring(1);
    }
    if (cookie.indexOf(name) === 0) {
      return cookie.substring(name.length, cookie.length);
    }
  }
  return "";
}


    document.addEventListener("DOMContentLoaded", function() {
        var radio = document.getElementById("type1");
        var div = radio.parentNode;
        div.style.backgroundColor = "#47c5ff";
        div.style.color = "white";
        div.style.transform = "scale(1.15)"
        var radio = document.getElementById("type2");
        var div = radio.parentNode;
        div.style.backgroundColor = "white";
        div.style.color = "#47c5ff";
        div.style.transform = "scale(1.0)"
        div.style.opacity = "0.5"
    });
     var previousRadioId = "type1"
    function changeBackgroundColor(radioId) {
        var radio = document.getElementById(radioId);
        var div = radio.parentNode;
        var previousDiv = document.getElementById(previousRadioId).parentNode;
        
        if (radio.checked) {
            div.style.backgroundColor = "#47c5ff";
            div.style.color = "white";
            div.style.transform = "scale(1.15)"
            div.style.opacity = "1.0"
            previousDiv.style.backgroundColor = "rgba(248, 248, 248,0.9)";
            previousDiv.style.color = "#47c5ff";
            previousDiv.style.transform = "scale(1)"
            previousDiv.style.opacity = "0.5"
            previousRadioId = radioId;
        } 
    }
// 나이 버튼
document.getElementById("ageButton").addEventListener("click", function() {
  document.getElementById("age").value = "0";
  document.getElementById("ageValue").value = "0";
});

document.getElementById("ageButton1").addEventListener("click", function() {
  document.getElementById("age").value = "20";
  document.getElementById("ageValue").value = "20";
});

document.getElementById("ageButton2").addEventListener("click", function() {
  document.getElementById("age").value = "65";
  document.getElementById("ageValue").value = "65";
});

// 약정 버튼
document.getElementById("disButton").addEventListener("click", function() {
  document.getElementById("dis").value = "0";
  document.getElementById("disValue").value = "0";
});

document.getElementById("disButton1").addEventListener("click", function() {
  document.getElementById("dis").value = "12";
  document.getElementById("disValue").value = "12";
});

document.getElementById("disButton2").addEventListener("click", function() {
  document.getElementById("dis").value = "24";
  document.getElementById("disValue").value = "24";
});

document.getElementById("disButton3").addEventListener("click", function() {
  document.getElementById("dis").value = "36";
  document.getElementById("disValue").value = "36";
});

    const rangeInputs = document.querySelectorAll('input[type="range"]');
const textInputs = document.querySelectorAll('input[type="text"]');

rangeInputs.forEach((rangeInput, index) => {
    rangeInput.addEventListener('input', function() {
        textInputs[index].value = this.value;
    });
});

function showResult() {
            var text = "${member.name}고객님에게 필요한 요금제입니다.    .    .";
            var resultDiv = document.getElementById("result");
            resultDiv.innerHTML = "";

            for (var i = 0; i < text.length; i++) {
                setTimeout(function(index) {
                    resultDiv.innerHTML += text[index];
                }, i * 100, i);
            }
        }
    $(document).ready(function() {
        $(".album").hide();
$('.toggle').click(function(e){
  e.preventDefault(); // The flicker is a codepen thing
  $(this).toggleClass('toggle-on');
  
});
        $("#inputForm").submit(function(event) {
            $(".album").css({ opacity: 0.05 }); 

            $(".album").fadeOut(1000);



            event.preventDefault();
            showResult();
            let authkey = "c7d354f723";
            let voice = $("#voice").val();
            let data = $("#data").val();
            let sms = $("#sms").val();
            let age = $("#age").val();
            let type = $("input[name='type']:checked").val();
            let dis = $("#dis").val();

            let url = "http://api.smartchoice.or.kr/api/openAPI.xml?authkey=" + authkey + "&voice=" + voice + "&data=" + data + "&sms=" + sms + "&age=" + age + "&type=" + type + "&dis=" + dis;

            $.ajax({
                type: "GET",
                url: url,
                dataType: "xml",
                success: function(response) {
                    let xmlDoc = response;
                    let $xml = $(xmlDoc);
                    let planList = $xml.find("items item");

                    let resultAlbumKT = $("#resultAlbumKT");
                    let resultAlbumLGU = $("#resultAlbumLGU");
                    let resultAlbumSKT = $("#resultAlbumSKT");

                    resultAlbumKT.empty(); // 기존 KT 앨범 내용 삭제
                    resultAlbumLGU.empty(); // 기존 LGU+ 앨범 내용 삭제
                    resultAlbumSKT.empty(); // 기존 SKT 앨범 내용 삭제
                    
                    let minAddName = Number.MAX_SAFE_INTEGER;
                     let recommendedAlbum;

                    planList.each(function() {
                        let vTel = $(this).find("v_tel").text();
                        let vPlanName = $(this).find("v_plan_name").text();
                        let vPlanDisplayVoice = $(this).find("v_plan_display_voice").text();
                        let vPlanDisplayData = $(this).find("v_plan_display_data").text();
                        let vPlanPrice = $(this).find("v_plan_price").text();
                        let vPlanAddName = $(this).find("v_add_name").text();
                        let numericValue = parseInt(vPlanAddName.replace(/[^0-9]/g, ""));
                        let originalPrice = vPlanAddName; // 원래 가격
                        let discountedPrice = (numericValue * 0.75).toLocaleString(); // 25% 할인된 가격 계산
                        let totalPrice = (numericValue*0.75 * dis).toLocaleString(); // 25% 할인된 가격 계산
                        let vPlanDisplaySms = $(this).find("v_plan_display_sms").text();
                        let ktLink = "https://search.kt.com/?c=OLEAC00AC01&q="+vPlanName; // KT 요금제 링크
                        let lguLink = "https://www.lguplus.com/search/result?searchWord=요금제&category=indv&collection=per_mo_plan_group"; // LGU+ 요금제 링크
                        let sktLink = "https://www.tworld.co.kr/web/search/total-search?&query="+vPlanName; // SKT 요금제 링크
                        if (vPlanName.includes("표준") || vPlanName.includes("PPS")) {
        return; // 해당 조건에 해당하는 vPlanName은 건너뜁니다.
    }
                        let albumItem = $("<div>").addClass("album-item");
                            if (vTel === "KT") {
                            albumItem.append("<h3>" + "<img src='${contextPath}/resources/image/kt_logo.svg'/>" + "</h3>");
                            }else if (vTel === "SKT") {
                            albumItem.append("<h3>" + "<img src='${contextPath}/resources/image/skt_logo.svg'/>" + "</h3>");
                        } else if (vTel.includes("LGU+")) {
                            albumItem.append("<h3>" + "<img src='${contextPath}/resources/image/uplus_logo.svg'/>" + "</h3>");
                        }
                            albumItem.append("<p><strong style='font-size:20px;'>" + vPlanName + "</strong> </p>");
                        albumItem.append("<p><strong>음성통화:</strong> " + vPlanDisplayVoice + "</p>");
                        albumItem.append("<p><strong>데이터:</strong> " + vPlanDisplayData + "</p>");
                        albumItem.append("<p><strong>문자:</strong> " + vPlanDisplaySms + "</p>");
                        if ($('#switch').hasClass('toggle-on')) {
                            albumItem.append("<p><strong style='color:blue; font-weight:bold;text-decoration:line-through ;'>요금제 정가: " + vPlanAddName + "</strong></p>");
                            albumItem.append("<p><strong style='color:red; font-weight:bold;'>" + dis +"개월 총 "+ totalPrice + "원[할인포함]</strong></p>");
    albumItem.append("<p><strong style='color:red; font-weight:bold; font-size:30px;'><span style='font-size:20px'>선택약정 할인가: 월</span>" + discountedPrice + "원</strong></p>");
} else {
                            albumItem.append("<p><strong style='color:red; font-weight:bold;'>" + dis +"개월 총 "+ totalPrice + "원</strong></p>");
    albumItem.append("<p><strong style='color:red; font-weight:bold; font-size:30px;'><span style='font-size:20px'>월</span>" + vPlanAddName + "</strong></p>");
}
                      
                            if (vTel === "KT"  && !vPlanName.includes("표준")) {
                            albumItem.append('<a href="' + ktLink + ' " target="_blank">KT 요금제 바로가기</a>');
                            resultAlbumKT.append(albumItem);
                        } else if (vTel === "SKT" && !vPlanName.includes("PPS")) {
                            albumItem.append('<a href="' + sktLink + '" target="_blank">SKT 요금제 바로가기</a>' );
                            resultAlbumSKT.append(albumItem);
                        } else if (vTel.includes("LGU+")&& !vPlanName.includes("표준")) {
                            albumItem.append('<a href="' + lguLink + '" target="_blank">LGU+ 요금제 바로가기</a>');
                            resultAlbumLGU.append(albumItem);
                        }
                        if (parseInt(vPlanAddName) < minAddName) {
                minAddName = parseInt(vPlanAddName);
                recommendedAlbums = [albumItem]; // 새로운 최소 추가 금액 앨범 배열로 초기화
            } else if (parseInt(vPlanAddName) === minAddName) {
                recommendedAlbums.push(albumItem); // 최소 추가 금액 앨범을 배열에 추가
            }
                    
                    });
                    recommendedAlbums.forEach(function(album) {
            album.append("<p class='recom1'><strong>가성비</strong></p>");
        });
                    $(".album").slideDown(1500, function() {
  $(this).css("transition", "opacity 0.2s"); // 앨범에 트랜지션 효과 적용
  $(this).css({ opacity: 1, marginTop: "0" }); // 앨범이 내려오면서 동시에 나타나는 효과 적용
});
$(".album a").click(function(event) {
    event.preventDefault();
    let iframeUrl = $(this).attr("href");
    $("#iframeContainer").slideUp(1000).html('<iframe src="' + iframeUrl + '" width="100%" height="800px"></iframe>').slideDown(1000);
});
                },
                error: function (e) {
                    alert(e.responseText);
                }
            });
        });
       
    });
    
</script>
</body>
</html>
