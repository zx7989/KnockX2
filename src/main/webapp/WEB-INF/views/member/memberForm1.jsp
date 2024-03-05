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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style>
body {
		font-family: Arial, sans-serif;
		background-color: #ffffff;
		padding: 20px;
	}
  #container1{
          background-image: url("${contextPath}/resources/image/wing2.png") ;
        background-size: contain;
        background-repeat: no-repeat;
        background-position: left 50% top 10%;
        width:100%;
        }
     
    .form-container {
      max-width: 700px;
      margin: 0 auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);

    }

    
    .form-container h2 {
      text-align: center;
      margin-bottom: 10px;
      margin-top: 0;
    }
    
    .form-group1 {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
    justify-content: flex-start;
  }
  
  .form-group1 label {
    width: 140px;
    font-weight: bold;
  }
  
  .form-group1 input[type="text"],
  .form-group1 input[type="password"],
  .form-group1 input[type="email"] {
    flex: 0.9;
    border: 1px solid #ccc;
    border-radius: 4px;
    padding:10px;
  }

  #label1 {
    width: 100px;
  }

  .form-group1 .new-join-btn, .btn2 {
    background: #583672;
    	border: none;
    	color: white;
    	padding: 10px 20px;
    	text-decoration: none;
    	display: inline-block;
    	font-size: 16px;
    	margin: 4px 2px;
    	cursor: pointer;
    	border-radius: 4px;
		width: 100px;
		margin-right: 50px;
  }
  
input:hover {
  transform: scale(1.1);
  
}

.new-join-btn:hover {
  transform: rotate(10deg);
}

.btn2:hover {
  transform: rotate(10deg);
}

i {
  font-size: 24px;
}

#id{
  flex:0.85;
}

button.id01{
  margin-left: 30px;
}

#zipcode{
  flex: 0.5;
  width: 120px;
}

#input1,#input2,#input3{
  margin:0 10px;
  width: auto;
}
#input1{
  margin-left: 0;
 }
 .callbox{
  flex-wrap: nowrap;
 }
#additionalFields1{
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  justify-content: center;
  fieldset{
    border:3px solid;
  }
  div{
    margin:10px;
  }
  div*{
    width:30%;
    
    input{
      width: 30px;
    }
  }

}
.form-group12{
  display: flex;
  justify-content: center;
}
.select {
  /* Reset Select */
  appearance: none;
  outline: 10px red;
  border: 0;
  box-shadow: none;
  /* Personalize */
  flex: 1;
  padding: 0 1em;
  color: #fff;
  background-color: var(--darkgray);
  background-image: none;
  cursor: pointer;
}
/* Remove IE arrow */
.select::-ms-expand {
  display: none;
}
/* Custom Select wrapper */
.select {
  position: relative;
  display: flex;
  width: 100px;
  border-radius: .25em;
  overflow: hidden;
  margin:0 auto;
}
/* Arrow */
.select::after {
  content: '\25BC';
  position: absolute;
  top: 0;
  right: 0;
  padding: 1em;
  background-color: #34495e;
  transition: .25s all ease;
  pointer-events: none;
}
/* Transition */
.select:hover::after {
  color: #f39c12;
}

:root {
  --background-gradient: linear-gradient(178deg, #ffff33 10%, #3333ff);
  --gray: #34495e;
  --darkgray: #2c3e50;
}
</style>
</head>
<body>
  <div class="form-container">
    <h2>회원가입<br><img src="${contextPath}/resources/image/knock_logo.png" alt="mainlogo" style="border: 2px solid #616161; border-radius: 30px;"></h2>
    <form class="new-form" method="post" action="${contextPath}/member/addMember.do" enctype="multipart/form-data">
      <div class="form-group1">
        <label for="id">
          <i class="fas fa-user"></i> <!-- 아이콘 라이브러리에서 제공하는 아이콘 클래스 -->
        </label>
        <input size="5" type="text" id="id1" name="id1" required placeholder="아이디">
        <input type="hidden" name="id"  id="id"/>
        <button id="btnOverlapped" onClick="fn_overlapped()">중복 확인</button>
      </div>
      <div class="form-group1">
        <label for="pwd"><i class="fas fa-lock"></i></label>
        <input type="password" id="pwd" name="pwd" required placeholder="비밀번호">
      </div>
      <div class="form-group1">
        <label for="confirmPwd"></label>
        <input type="password" id="confirmPwd" name="confirmPwd" required placeholder="비밀번호 확인">
      </div>
      <div class="form-group1">
        <label for="pwd"></label>
        <span id="error-message" style="color: red;"></span>
      </div>
      <div class="form-group1">
        <label for="name"><i class="fas fa-id-card"></i></label>
        <input type="text" id="name" name="name" required placeholder="이름">
      </div>
      <div class="form-group1">
        <label for="email"><i class="fas fa-envelope"></i></label>
        <input type="email" id="email" name="email" required placeholder="이메일">
      </div>
      <div class="form-group1">
        <label for="membersort"><i class="fas fa-check-circle"></i></label>
        <input type="radio" id="member" name="memberSort" value="member" required checked>
        <label id="label1" for="member">일반 회원</label>
        <input type="radio" id="shop" name="memberSort" value="shop" onclick="toggleAdditionalFields()" required>
        <label id="label1" for="shop">사업자 회원</label>
      </div>
      <div id="additionalFields1" >
        <fieldset class="form-group1">
          <legend>요금제 추천서비스 부가사항</legend>
          <div>
          <label for="m_voice">통화량</label>
            <select class="select" id="m_voice" name="m_voice">
            <option value="999999" selected>많이 써요!</option>
            <option value="300">적당히 써요~</option>
            <option value="60">적게 써요!</option></select>
          </div>
          <div>
          <label for="m_data">데이터 사용량</label>
            <select class="select" id="m_data" name="m_data">
            <option value="50000" selected>50GB 이상</option>
            <option value="30000">10GB - 50GB</option>
            <option value="7000">5GB - 10GB</option>
            <option value="1000">5GB 미만</option> </select>
            </div>
            <div>
          <label for="m_sms">문자 사용량</label>
              <select class="select" id="m_sms" name="m_sms">
                <option value="999999" selected>500건 이상</option>
                <option value="300">100건 - 500건</option>
                <option value="10">100건 미만</option> </select>
         
          </div>
          <div>
            <label for="m_dis">약정기간</label>
          <select class="select" id="m_dis" name="m_dis">
          <option value="0">무약정</option>
          <option value="12">12개월</option>
          <option value="24" selected>24개월</option>
          <option value="36">36개월</option>
        </select>
          </div>
        </fieldset>
        </div>
   
      <div id="additionalFields" style="display: none;">
        <div class="form-group1">
          <label for="shopAddress"><i class=" fas fa-tag"></i></label>
          <input type="text" id="shop_code" name="shop_code" placeholder="#사업장 코드 예:shop01">
        </div>
        <div class="form-group1">
          <label for="shopAddress"><i class="fas fa-store"></i></label>
          <input type="text" id="shop_name" name="shop_name" placeholder="사업장명">
        </div>
        <div class="form-group1">
          <label for="shopName"><i class="fas fa-hashtag"></i></label>
          <input type="text" id="shop_num" name="shop_num" placeholder="사업자번호">
        </div>
      </div>
      <div class="form-group1">
        <label for="call_num"><i class="fas fa-phone"></i></label>
     <div class="callbox">
      <select name="input1" id="input1">
        <option value="010" selected>010</option>
        <option value="011" >011</option>
        <option value="012">012</option>
        <option value="013" >013</option>
        <option value="014" >014</option>
      </select>-
        <input type="text" size="3" id="input2" placeholder="번호" maxlength="4" required>-
        <input type="text" size="3" id="input3" placeholder="번호" maxlength="4" required>
      </div>
      </div>
      <div class="form-group1">
        <label for="birth"><i class="fas fa-calendar-alt"></i></label>
        <input type="date" id="birth" name="birth" required>
      </div>
      <div class="form-group1">
        <label for="zipcode"><i class="fas fa-map-marker-alt"></i></label>
        <input type="text" id="zipcode" name="zipcode" required placeholder="우편번호">
        <button class="zip01" type="button" onclick="searchZipcode()">우편번호 찾기</button>
      </div>
      <div class="form-group1">
        <label for="roadaddress"></label>
        <input type="text" id="roadaddress" name="roadAddress" required placeholder="도로명주소">
      </div>
      <div class="form-group1">
        <label for="jibunaddress"></label>
        <input type="text" id="jibunaddress" name="jibunAddress" required placeholder="지번주소">
      </div>
      <div class="form-group1">
        <label for="namujiaddress"></label>
        <input type="text" id="namujiaddress" name="namujiAddress" required placeholder="상세주소">
      </div>
      <label for="agreeTerms"><i class="fas fa-camera"></i> 프로필 등록</label><br>
				  <img width=100 height="100" src="${contextPath}/resources/image/profile.png" id="preview"  style="border-radius: 50%;"/>
				
		  <br>
		  <input type="file" onchange="readURL(this);" value="${memInfo.imageFN}" id="i_imageFileName" name="imageFN" />
						
      <div class="form-group12">
        <label for="agreeTerms">약관 동의</label>
        <input type="checkbox" id="agreeTerms" name="agreeTerms" required>
        <label for="agreeTerms">약관에 동의합니다.</label>
      </div>
      <div class="form-group1 form-group12">
        <input type="submit" id="signupButton" class="new-join-btn" onclick="checkId(); combineInputs(event);" value="가입하기" disabled></input>
        <input type="reset" class="btn2" value="다시쓰기"></input>
        <input type="button" onclick="goBack()" class="btn2" value="돌아가기">
      </div>
    </form>
  </div>
  
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>


function combineInputs(event) {
  event.preventDefault(); // 폼 전송 기본 동작 방지

  // 세 개의 입력 값을 가져와서 call_num으로 묶기
  var input1 = document.getElementById('input1').value;
  var input2 = document.getElementById('input2').value;
  var input3 = document.getElementById('input3').value;

  var call_num = input1 + input2.replace("-", "") + input3.replace("-", "");

  // call_num 값을 숨겨진 필드(hidden field)에 설정
  var hiddenField = document.createElement('input');
  hiddenField.setAttribute('type', 'hidden');
  hiddenField.setAttribute('name', 'call_num');
  hiddenField.setAttribute('value', call_num);

  // 폼에 숨겨진 필드 추가
  var formElements = document.getElementsByClassName('new-form');
  for (var i = 0; i < formElements.length; i++) {
    formElements[i].appendChild(hiddenField);
  }

  // 폼 전송
  for (var i = 0; i < formElements.length; i++) {
    formElements[i].submit();
  }
  showSignupMessage();

  function showSignupMessage() {
  alert("회원가입이 완료되었습니다.");
}
}

    function readURL(input){
		if (input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function (e){
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
    function toggleAdditionalFields() {
  var additionalFields = document.getElementById("additionalFields");
  var additionalFields1 = document.getElementById("additionalFields1");

  if (document.getElementById("shop").checked) {
    additionalFields.style.display = "block";
    additionalFields1.style.display = "none";
  } else {
    additionalFields.style.display = "none";
    additionalFields1.style.display = "block";
  }
}
    document.addEventListener("DOMContentLoaded", function() {
    var memberRadio = document.getElementById("member");
    memberRadio.addEventListener("click", function() {
      var additionalFields = document.getElementById("additionalFields");
      var additionalFields1 = document.getElementById("additionalFields1");
      additionalFields.style.display = "none";
      additionalFields1.style.display = "block";
    });
  });
  // 

    function goBack() {
      window.history.back();
    }

  
    function fn_overlapped() {
  var id = document.getElementById("id1").value;
  if (id == '') {
    alert("ID를 입력하세요");
    return;
  }
  $.ajax({
    type: "post",
    async: false,
    url: "${contextPath}/member/overlapped.do",
    dataType: "text",
    data: { id: id },
    success: function(data, textStatus) {
      if (data == 'false') {
        alert("사용할 수 있는 ID입니다.");
        $('#id1').prop("disabled", true);
        $('#id1').val(id);
        $('#btnOverlapped').prop("disabled", true); // 중복 확인 버튼 숨김
        $('#signupButton').prop("disabled", false); // 회원 가입하기 버튼 활성화
      } else {
        alert("사용할 수 없는 ID입니다.");
        return false;
      }
    },
    error: function(data, textStatus) {
      alert("에러가 발생했습니다.");
      return false;
    },
    complete: function(data, textStatus) {
      //alert("작업을 완료했습니다");
    }
  }); //end ajax	 
  var id1Value = document.getElementById("id1").value;

// id input 요소의 value 값을 id1 input 요소의 값으로 설정합니다.
document.getElementById("id").value = id1Value;
}

  function searchZipcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      document.getElementById('zipcode').value = data.zonecode; // 우편번호 입력 필드에 값 채우기
      document.getElementById('roadaddress').value = data.roadAddress; // 도로명주소 입력 필드에 값 채우기
      document.getElementById('jibunaddress').value = data.jibunAddress; // 지번주소 입력 필드에 값 채우기
    }
  }).open();

  }

  const passwordInput = document.getElementById("pwd");
  const confirmPwdInput = document.getElementById("confirmPwd");
  const errorMessage = document.getElementById("error-message");

  confirmPwdInput.addEventListener("input", () => {
    if (passwordInput.value !== confirmPwdInput.value) {
      errorMessage.textContent = "비밀번호가 일치하지 않습니다.";
    } else {
      errorMessage.textContent = "";
    }
  });
  </script>
</body>
</html>