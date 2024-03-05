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
<title>회원 목록창</title>
<script>
   function removeMember(url) {
    // 탈퇴 작업 수행하는 코드
    // ...

    // 탈퇴가 완료되었다는 알림 표시
    alert("정상적으로 탈퇴되었습니다.");
    // 페이지 리디렉션
    location.href = url;
  }
</script>
<style>
 .profile-card {
  position: relative;
  display: inline-block;
  width: 800px;
  height: 500px;
  border: 1px solid #ccc;
  overflow: hidden;
  margin: 0 auto;
}

.profile-container {
  display: flex;
  align-items: flex-start;
}

.profile-image {
  width: 400px;
  height: 100%;
  img{
    width: 100%;
    height:100% ;
  }
  object-fit: cover;
  transition: transform 0.3s ease-in-out;
}



.profile-card:hover .profile-image {
  transform: translateX(0px);
}

.profile-info {
  position: absolute;
  top: 0;
  left: 400px;
  width: 400px;
  height: 500px;
  background-color: rgba(0, 0, 0, 0.8);
  color: #fff;
  transition: transform 0.3s ease-in-out;
  text-align: center;
  display: flex;
  justify-content: center;
  align-items: center;

}

.profile-card:hover .profile-info {
  transform: translateX(0px);
}

table {
  border-collapse: separate; /* 테두리 병합 해제 */
  border-spacing: 10px; /* 원하는 간격으로 조정 */
}

.td1 {
  border: 1px solid rgb(212, 210, 210);
  border-radius: 5px; /* 원하는 값으로 조정 */
  transition: background-color 0.3s ease; /* 호버 시 변경될 속성과 시간 설정 */
}

.td1:hover {
  background-color: #f2f2f2; /* 원하는 색상으로 변경 */
  color: black;
}

.tr1 {
  text-align: center;
}

.buttons {
  margin-top: 20px;
}

.buttons button {
  padding: 10px 20px;
  background-color: #333;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin-right: 10px;
}

.buttons button:last-child {
  margin-right: 0;
}

.buttons button:hover {
  background-color: #ff0000;
  color: #fff;
  transform: scale(1.1);
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
          border:3px solid #b4b4b4;
          width:70%;
          
        }
        .rateBox1{
          padding:0 auto;
          margin:0 3px !important;
          border-top:30px solid tomato;
          border-left:0;
          border-right:0;
          width:46%;
          
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
            width: 180px;
            -webkit-user-drag: none;
            height: 180px;
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
</style>
</head>
<body>
  <h3>프로필</h3>
  <div class="profile-card">
    <div class="profile-image">
    <input type="hidden" value="${memInfo.imageFN}" name="originalFileName" />
    <c:choose>
      <c:when test="${memInfo.imageFN == null}">
        <img src="${contextPath}/resources/image/profile.png"  id="preview" />
        <br><span style="color:red; font-size:18px; font-weight: bold;">프로필사진<br> 등록이 필요합니다.</span>
      </c:when>
      <c:when test="${memInfo.imageFN != null}">
          <img src="${contextPath}/download1.do?id=${memInfo.id}&imageFN=${memInfo.imageFN}" id="preview" />
      </c:when>
    </c:choose>
    </div>
    <div class="profile-info">
      <table>
        <tr>
          <td>아이디</td>
          <td class="td1">${memInfo.id}</td>
        </tr>
        <tr>
          <td>이름</td>
          <td class="td1">${memInfo.name}</td>
        </tr>
        <tr>
          <td>이메일</td>
          <td class="td1">${memInfo.email}</td>
        </tr>
        <c:if test="${memInfo.memberSort == 'shop'}">
          <tr>
            <td>사업장 코드</td>
            <td class="td1">${memInfo.shopVO.shop_code}</td>
          </tr>
          <tr>
            <td>사업장명</td>
            <td class="td1">${memInfo.shopVO.shop_name}</td>
          </tr>
          <tr>
            <td>사업자 번호</td>
            <td class="td1">${memInfo.shopVO.shop_num}</td>
          </tr>
        </c:if>
        <tr>
          <td>전화번호</td>
          <td class="td1">${memInfo.call_num}</td>
        </tr>
        <tr>
          <td>생년월일</td>
          <td class="td1">${memInfo.birth}</td>
        </tr>
        <tr>
          <td>우편번호</td>
          <td class="td1">${memInfo.zipcode}</td>
        </tr>
        <tr>
          <td>도로명주소</td>
          <td class="td1">${memInfo.roadAddress}</td>
        </tr>
        <tr>
          <td>지번주소</td>
          <td class="td1">${memInfo.jibunAddress}</td>
        </tr>
        <tr>
          <td>상세주소</td>
          <td class="td1">${memInfo.namujiAddress}</td>         
        </tr>
        <tr>
          <td>적립금 </td>
          <td class="td1">${memInfo.buyPoint}원</td>         
        </tr>
      </table>
    </div>
    </div>
    <div class="buttons">
      <button onclick="location.href='${contextPath}/admin/myPage/modMemberForm.do?id=${memInfo.id}&memberSort=${memInfo.memberSort}'">수정</button>
      <button onclick="delOk(); ">탈퇴</button>
    </div>   
    <c:if test="${memInfo.memberSort == 'member'}">
    <fieldset class="rateBox">
      <span style="font-size: 18px; font-weight: bold; color:tomato">${memInfo.name}고객님에게 필요한 요금제입니다!</span>
    <legend><img style="width:200px" src="${contextPath}/resources/image/4G5G.jpg"/></legend>
    <div class="albumBox">
      <fieldset class="rateBox1">
        <legend><img style="width:70px; height:70px;" src="${contextPath}/resources/image/4glogo.png"/></legend>
        <div class="album">
        <div id="resultAlbumKT"></div>
        <div id="resultAlbumLGU"></div>
        <div id="resultAlbumSKT"></div>
        </div>
      </fieldset>
      <fieldset class="rateBox1">
        <legend><img style="width:70px; height:70px;" src="${contextPath}/resources/image/5glogo.png"/></legend>
        <div class="album">
          <div id="resultAlbumKT1"></div>
          <div id="resultAlbumLGU1"></div>
          <div id="resultAlbumSKT1"></div>
          </div>
        </div>
      </fieldset>
          <div id="iframeContainer"></div>
        </fieldset>
      </c:if>
      <c:if test="${memInfo.memberSort == 'shop'}">
      <jsp:include page="myGoodsList.jsp" ></jsp:include>
      </c:if>
    <script>
      $(document).ready(function() {
          
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
        function delOk(){
          if (!confirm('삭제하시면 복구할 수 없습니다. \n 정말로 삭제하시겠습니까??')) {
            return false;
        } else {
          removeMember('${contextPath}/member/removeMember.do?id=${memInfo.id}&memberSort=${memInfo.memberSort}');
        }
			}

    </script>
</body>
</html>