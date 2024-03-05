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
<title>회원 정보 수정창</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function searchZipcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      document.getElementById('zipcode').value = data.zonecode; // 우편번호 입력 필드에 값 채우기
      document.getElementById('roadaddress').value = data.roadAddress; // 도로명주소 입력 필드에 값 채우기
      document.getElementById('jibunaddress').value = data.jibunAddress; // 지번주소 입력 필드에 값 채우기
    }
  }).open();

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

  if (document.getElementById("shop").checked) {
    additionalFields.style.display = "block";
  } else {
    additionalFields.style.display = "none";
  }
}

function finish() {

  alert("수정이 완료되었습니다.");
}

</script>
<style>
	body {
		font-family: Arial, sans-serif;
		background-color: #ffffff;
		padding: 20px;
	}
	
	.modcontainer1 {
		width: 50%;
		background-color: #fff;
		margin: 0 auto; /* 추가된 부분 */
		padding: 20px;
		border-radius: 5px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
		display: flex;
		flex-direction: column;
		justify-content: center;
		
	}
	
	h2 {
		text-align: center;
		margin-bottom: 20px;
	}
	
	.form-group {
		display: flex;
    align-items: center;
	justify-content: center;
		margin-bottom: 20px;
	}
	
	.form-group label {
		display: block;
		font-weight: bold;
		margin-bottom: 5px;
		width: 150px;
	}
  
	.form-group input {
		width: 200px;
		padding: 10px;
		border: 1px solid #ccc;
		border-radius: 5px;

	}
	
	.btn1 {
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

	.btn2 {
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
		margin-left: 50px;
	}

	.btn1:hover {
		background-color: rgb(158, 135, 173);
    	transition: 0.5s;
	}
	
	.btn2:hover {
		background-color: rgb(158, 135, 173);
    	transition: 0.5s;
	}

	#zipcode {
		width: 110px;
	}

	.modimg1{
		border-radius: 50%;
		width:200px;
		height: 200px;
	}
	.form-group1 {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
    justify-content: center;

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
  }

</style>
<c:choose>
	<c:when test="${result=='enterFailed' && result3 == null }">
		<script>
			window.onload=function(){
				alert("이미 사용하고 있는 아이디입니다.");
			}
		</script>
	</c:when>
	<c:when test="${result3=='enter' }">
		<script>
			window.onload=function(){
				alert("카카오 ID 연동 해제되셨습니다.");
			}
		</script>
	</c:when>
</c:choose>
</head>
<body>
<div class="modcontainer1">
	<h2>회원 정보 수정</h2>
    <form class="new-form" method="post" action="${contextPath}/myPage/modMember.do" enctype="multipart/form-data">
		<div class="form-group">
			<br>
			<c:choose>
					<c:when test="${mem.imageFN == null}">
					  <img class="modimg1" src="${contextPath}/resources/image/profile.png" id="preview"/>
					  
					</c:when>
					<c:when test="${mem.imageFN != null}">
					  <img class="modimg1" src="${contextPath}/download1.do?id=
							${mem.id}&imageFN=${mem.imageFN}" id="preview" />
					</c:when>
			  </c:choose>
			<br>
		</div>
		<div class="form-group">
			<label for="name">프로필사진</label>
			<input type="file" onchange="readURL(this);" value="${mem.imageFN}" id="imageFileName" name="imageFN" />		  
		</div>
		<div class="form-group">
			<label for="name">아이디</label>
			<input type="text" id="id" name="id" value="${mem.id}" disabled>
			<input type="hidden" name="id" value="${mem.id}">
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호</label>
			<input type="password" id="pwd" name="pwd" value="${mem.pwd}">
		</div>
		<div class="form-group">
			<label for="name">이름</label>
			<input type="text" id="name" name="name" value="${mem.name}">
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="email" id="email" name="email" value="${mem.email}">
		</div>
		<div class="form-group">
			<label for="memberSort">회원 구분</label>
			<input type="memberSort" id="memberSort" name="memberSort" value="${mem.memberSort}" disabled>
			<input type="hidden" name="memberSort" value="${mem.memberSort}">
		</div>
		<div class="form-group1">
			<label for="call_num">전화번호</label>
		 <div class="callbox">
		  <select name="input1" id="input1">
			<option value="${mem.call_num.substring(0,3)}" selected>${mem.call_num.substring(0,3)}</option>
			<option value="010" >010</option>
			<option value="011" >011</option>
			<option value="012">012</option>
			<option value="013" >013</option>
			<option value="014" >014</option>
		  </select>-
			<input type="text" size="3" id="input2" value="${mem.call_num.substring(3,7)}" placeholder="번호" maxlength="4" required>-
			<input type="text" size="3" id="input3" value="${mem.call_num.substring(7)}" placeholder="번호" maxlength="4" required>
		  </div>
		  </div>
		<div class="form-group">
			<label for="birth">생년월일</label>
			<input type="date" id="birth" name="birth" value="${mem.birth}">
		</div>
		<c:if test="${mem.memberSort == 'shop'}">
		<div class="form-group">
			<label for="shopAddress">사업장명</label>
			<input type="text" id="shop_name" name="shop_name" value="${mem.shopVO.shop_name}">
		  </div>
		  <div class="form-group">
			<label for="shopName">사업자번호</label>
			<input type="text" id="shop_num" name="shop_num" value="${mem.shopVO.shop_num}">
		  </div>
		</c:if>
		<div class="form-group">
			<label for="zipcode">우편번호</label>
			<input type="text" id="zipcode" name="zipcode" value="${mem.zipcode}">
			<button class="zip01" type="button" onclick="searchZipcode()">우편번호 찾기</button>
		  </div>
		  <div class="form-group">
			<label for="roadaddress">도로명주소</label>
			<input type="text" id="roadaddress" name="roadAddress" value="${mem.roadAddress}">
		  </div>
		  <div class="form-group">
			<label for="jibunaddress">지번주소</label>
			<input type="text" id="jibunaddress" name="jibunAddress" value="${mem.jibunAddress}">
		  </div>
		  <div class="form-group">
			<label for="namujiaddress">상세주소</label>
			<input type="text" id="namujiaddress" name="namujiAddress" value="${mem.namujiAddress}">
		  </div>
		  <c:if test="${mem.kakaoid != null}">
		  <div class="form-group">
			<img style="margin:0;" src="${contextPath}/resources/image/kakaoid.png" width="100px"><span style="border-radius: 30px;background-color: rgb(87, 35, 0); color:yellow;padding:20px;">카카오 인증 회원입니다.<br>식별:ID<input style="width:100px; padding:1px; color:white;" type="text" value="${mem.kakaoid}" disabled><br><a style="color:black;border-radius: 10px; background-color: rgb(241, 241, 241); margin:5px; padding:5px;" href="${contextPath}/removeKakao.do?id=${mem.id}">연결끊기</a></span>
		  </div>
		</c:if>
		<c:if test="${mem.kakaoid == null}">
		  <div class="form-group">
			<img style="margin:0;" src="${contextPath}/resources/image/kakaoid.png" width="100px"><a href="https://kauth.kakao.com/oauth/authorize?client_id=2840b2919a36903a43e08af211aab685&redirect_uri=http://localhost:8091/auth/kakao/add&response_type=code"><span style="border-radius: 30px;background-color: rgb(87, 35, 0); color:yellow;padding:20px;">카카오 인증하기</a></span>
		  </div>
		</c:if>
		<input type="hidden" name="buyPoint" value="${mem.buyPoint}">
		<div class="form-group">
			<button type="submit" class="btn1" onclick="combineInputs(event);finish();">수정하기</button>
			<button type="reset" class="btn2">다시쓰기</button>

		</div>
	</form>
</div>
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
}
</script>
</body>
</html>