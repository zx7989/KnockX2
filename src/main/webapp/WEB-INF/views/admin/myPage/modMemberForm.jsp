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

</style>
</head>
<body>
<div class="modcontainer1">
	<h2>${mem.name}님 회원 정보 수정</h2>
    <form class="new-form" method="post" action="${contextPath}/admin/myPage/modMember.do" enctype="multipart/form-data">
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
			<input type="text" id="id" name="id" value="${mem.id}" >
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
			<input type="memberSort" id="memberSort" name="memberSort" value="${mem.memberSort}" >
		</div>
		<div class="form-group">
			<label for="call_num">전화번호</label>
			<input type="call_num" id="call_num" name="call_num" value="${mem.call_num}">
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
			<input type="hidden" id="shop_code" name="shop_code" value="${mem.shopVO.shop_code}">

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
		  <div class="form-group">
			<label for="namujiaddress">적립금</label>
			<input type="text" id="buyPoint" name="buyPoint" value="${mem.buyPoint}">
		  </div>
		<div class="form-group">
			<button type="submit" class="btn1" onclick="finish()">수정하기</button>
			<button type="reset" class="btn2">다시쓰기</button>

		</div>
	</form>
</div>
</body>
</html>