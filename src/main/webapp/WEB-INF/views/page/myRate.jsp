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
       
        .album {
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
            z-index: 99;
            a {
                font-size: 13px;
                border: 2px solid rgb(187, 187, 187);
                padding: 3px;
                border-radius: 15px;
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
            
            margin: 5px;
            justify-content: space-between;

        }
        #resultAlbumKT1 div,#resultAlbumLGU1 div,#resultAlbumSKT1 div {
            display: flex;
            flex-direction: column;
            
            margin: 5px;
            justify-content: space-between;

        }
        .rateBox{
          padding:0 auto;
          margin:0 auto !important;
          border:3px solid #0035e4;
          border-radius: 50px;
          border-top: 50px solid rgb(74, 71, 255);
          border-bottom: 50px solid rgb(74, 71, 255);
        }
        .rateBox1{
          padding:0 auto;
          margin:0 3px !important;
          border-top:30px solid tomato;
          border-left:0;
          border-right:0;
          width:40%;
          
        }
        .albumBox{
          display: flex;
          justify-content: center;
          
          padding:0 auto;
          margin:0 auto;
          -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;  
    box-sizing: border-box; 
        }
        .album-item {
            word-break: keep-all;
            position: relative;
            border:1px solid #61616157;
            width: 90%;
            -webkit-user-drag: none;
            height: 270px;
            user-select: none;
            font-size: 12px;
            border-radius: 20px;
            white-space: nowrap;
            overflow: hidden;
            display: inline-block;
            transition: all 0.2s ease-out;
            transform: scale(1.0);
            padding:10px;
            background-color: white;
            h3{
                margin:0;
            }
        }
        .album-item:hover {
            transform: scale(1.05);
            background-color: #ffeded;
        }
        .recom1{
    position:absolute; right:10px; top:5px;
    border-left: 7px solid transparent;
  border-right: 7px solid transparent;
  border-bottom: 10px solid red;
    color:white;
    background-color: rgb(0, 68, 255);
    border-radius: 15px 15px 0px 0px;
    padding:2px;
    font-size: 12px;
   
}
#inputForm{
                            width:80%;
                            margin:15px auto;
                            border:30px solid rgba(0, 142, 236, 0.979);
                            border-radius: 150px;
                            background-color: rgba(255, 255, 255, 0.89);
                            box-shadow: 10px 10px 30px rgb(59, 59, 59);
                            transform: scale(0.9);
                            padding:10px;
                            
                            .field01{
                                border:0px;
                                border-top:20px solid rgb(199, 199, 199);
                                border-radius: 50px 50px;
                                position: relative;
                                .legend01{
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

                        #result {
            font-size: 36px;
            background-color: tomato;
            color:white;
            white-space: nowrap;
            overflow: hidden;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
  <style>
		@media screen and (min-width: 1800px) {
		
		#inputForm{
			width: 1600px;
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
    <!-- <img style="width:700px;" src='${contextPath}/resources/image/5G.jpg'/> -->
<div id="result"></div>

    <form id="inputForm">
        <fieldset class="field01">
            <legend class="legend01">
                </span>회원 요금제 맞춤 서비스 <span style="font-size: 40px;"class="material-symbols-outlined">
                    rocket_launch
                    </span></legend>
            

<fieldset class="rateBox">
  <span style="font-size: 18px; font-weight: bold; color:tomato">고객님에게 필요한 요금제입니다!</span>
<legend><img style="width:300px" src="${contextPath}/resources/image/4G5G.jpg"/></legend>
<div class="albumBox">
  <fieldset class="rateBox1">
    <legend><img style="border-radius: 20px; width:70px; height:70px;" src="${contextPath}/resources/image/4glogo.png"/></legend>
    <div class="album">
    <div id="resultAlbumKT"></div>
    <div id="resultAlbumLGU"></div>
    <div id="resultAlbumSKT"></div>
    </div>
  </fieldset>
  <fieldset class="rateBox1">
    <legend><img style="border-radius: 20px; width:70px; height:70px;" src="${contextPath}/resources/image/5glogo.png"/></legend>
    <div class="album">

      <div id="resultAlbumKT1"></div>
      <div id="resultAlbumLGU1"></div>
      <div id="resultAlbumSKT1"></div>
      </div>
    </div>
  </fieldset>
      <div id="iframeContainer"></div>
    </fieldset>
    </form>

<script>

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
      showResult();



            let authkey = "c7d354f723";
            let voice = "${rateInfo.m_voice}"
            let data = "${rateInfo.m_data}"
            let sms = "${rateInfo.m_sms}"
            let age = "${age}"
            let type = "3";
            let dis = "${rateInfo.m_dis}"

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
                            albumItem.append("<p><strong style='font-size:17px;'>" + vPlanName + "</strong> </p>");
                        albumItem.append("<p><strong>음성통화:</strong> " + vPlanDisplayVoice + "</p>");
                        albumItem.append("<p><strong>데이터:</strong> " + vPlanDisplayData + "</p>");
                        albumItem.append("<p><strong>문자:</strong> " + vPlanDisplaySms + "</p>");
                            albumItem.append("<p><strong style='color:red; font-weight:bold;'>" + dis +"개월 총 "+ totalPrice + "원</strong></p>");
    albumItem.append("<p><strong style='color:red; font-weight:bold; font-size:18px;'><span style='font-size:20px'>월</span>" + vPlanAddName + "</strong></p>");
                      
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

             type = "6";

             url = "http://api.smartchoice.or.kr/api/openAPI.xml?authkey=" + authkey + "&voice=" + voice + "&data=" + data + "&sms=" + sms + "&age=" + age + "&type=" + type + "&dis=" + dis;

            $.ajax({
                type: "GET",
                url: url,
                dataType: "xml",
                success: function(response) {
                    let xmlDoc = response;
                    let $xml = $(xmlDoc);
                    let planList = $xml.find("items item");
                    let resultAlbumKT = $("#resultAlbumKT1");
                    let resultAlbumLGU = $("#resultAlbumLGU1");
                    let resultAlbumSKT = $("#resultAlbumSKT1");
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
                            albumItem.append("<p><strong style='font-size:17px;'>" + vPlanName + "</strong> </p>");
                        albumItem.append("<p><strong>음성통화:</strong> " + vPlanDisplayVoice + "</p>");
                        albumItem.append("<p><strong>데이터:</strong> " + vPlanDisplayData + "</p>");
                        albumItem.append("<p><strong>문자:</strong> " + vPlanDisplaySms + "</p>");
                            albumItem.append("<p><strong style='color:red; font-weight:bold;'>" + dis +"개월 총 "+ totalPrice + "원</strong></p>");
    albumItem.append("<p><strong style='color:red; font-weight:bold; font-size:18px;'><span style='font-size:20px'>월</span>" + vPlanAddName + "</strong></p>");
                      
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

                },
                error: function (e) {
                    alert(e.responseText);
                }
            });
        });
    
</script>
</body>
</html>
