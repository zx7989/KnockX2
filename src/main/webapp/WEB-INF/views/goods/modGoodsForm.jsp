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
<title>메인</title>
<style>

</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script>
  
	
	
	function backToList(obj){
		obj.action = "${contextPath}/myPage/myGoodsList.do?shop_code=${shop_code}";
		obj.submit();
	}
</script>
<style>

    .goodsAddContainer{
      margin:0 auto;
        display: flex;
        justify-content: center;
        padding:10px;
        width:1600px;
    }
.goodsTop1{
  display: flex;
  flex-direction: column;
    width:400px;
    text-align: center;
    padding:10px auto;
    justify-content: flex-start;
    height: max-content;
    *{
      margin:3px;
      margin-bottom: 0;
    }
}
.sub_title01{
  font-size: 21px;
}

    .btn-upload {
  width: 150px;
  height: 30px;
  background: #fff;
  border: 1px solid #4d4d4d;
  border-radius: 10px;
  font-weight: 500;
  cursor: pointer;
  margin:10px auto;
}
.btn-upload:hover {
  background: #4d4d4d;
  color: #fff;
}

input[type="file"]{
  display: none;
}
.noImg1{
    border:2px solid #616161;
    width: 370px;
    
}

.gradient-border {
  content: "";
  z-index: -1;
  width: calc(100% + var(--border-width) * 2);
  height: calc(100% + var(--border-width) * 2);
  background: linear-gradient(60deg, #5f86f2, #a65ff2, #f25fd0, #f25f61, #f2cb5f, #abf25f, #5ff281, #5ff2f0);
  background-size: 300% 300%;
  background-position: 0 50%;
  animation: moveGradient 4s alternate infinite;
}

@keyframes moveGradient {
  50% {
    background-position: 100% 50%;
  }
}
.noSubImg1{
    width: 200px;
   
}
.box1{
  margin:0 auto;
  padding:0;
--border-size: 2px;
  --border-angle: 0turn;
  background-image: conic-gradient(from var(--border-angle), rgb(240, 240, 240), rgb(134, 134, 134) 50%, #213), conic-gradient(from var(--border-angle), transparent 20%, #08f, #f03);
  background-size: calc(100% - (var(--border-size) * 2)) calc(100% - (var(--border-size) * 2)), cover;
  background-position: center center;
  background-repeat: no-repeat;
  -webkit-animation: bg-spin 5s linear infinite;
          animation: bg-spin 5s linear infinite;
          width: fit-content;
          height: fit-content;
   
}@property --border-angle {
  syntax: "<angle>";
  inherits: true;
  initial-value: 0turn;
  }

.goodsInner1{
  flex-direction: column;
  padding:10px;
  width:1200px;
  
}
.col-md-6{
  display: flex;
  flex-direction: row;
  margin:20px;
  padding:10px;
  border-bottom: 1px solid rgb(12, 22, 158);
}
.col-md-12 *{
  width:98%;
  margin:0;
}
input{
  width:80px;
  padding:2px;
  border-radius: 10px;
}
.input-group {
    position: relative;
    mix-blend-mode: lighten;
  }
  .input-group__label {
    position: absolute;
    left: 2em;
    top: -1em;
    background: #000000;
  }
.input-group__label {
  padding: 0 0.5em;
  margin-bottom: 0.5em;
  text-transform: uppercase;
  font-size: 16px;
  letter-spacing: 0.1em;
  color: #ccd;
  color: rgba(250, 250, 250, 0.973);
  border: 2px solid white;
  border-radius: 3px;
  cursor: pointer;
}
.input-group__input {
  color: #f8f8f8;
  font-size: 16px;
  width: 200px;
  padding: 5px 0px 5px 20px;
  margin:10px;
  border: 0.25em solid transparent;
  background-image: linear-gradient(#000000, #000000), linear-gradient(120deg, #f09 0%, #0ff 50%, #9f0 100%);
  background-origin: border-box;
  background-clip: padding-box, border-box;
  border-radius: 1.8em;
  background-size: 200% 100%;
  transition: background-position 0.8s ease-out;
  option{
    background-color: #000000;
  }
}
.input-group__input:hover {
  background-position: 100% 0;
}
.input-group__input:focus {
  outline: 2px dashed #ad2b89;
  outline-offset: 0.5em;
}
.title01{
  text-align: left;
  padding-left:100px;
  padding-bottom: 20px;
  border-bottom: 3px solid;
}
.sub_title02{
  text-align: left;
  padding-left: 5px;
  font-size: 25px;
  width:200px;
  border-left:10px solid rgb(0, 116, 211);
}
.md-7{
  width:190px;
  height: 300px;
  display: flex;
  flex-direction: column;
  padding:10px 30px 10px 30px;
  margin:0 auto;
  justify-content: center;

}
select {
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
select::-ms-expand {
  display: none;
}
/* Custom Select wrapper */
.select {
  position: relative;
  display: flex;
  width: 10em;
  height: 5em;
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
.goodsAddContainer * .material-symbols-outlined{
  display: flex;
  flex-direction: column;
  justify-content: center;
  font-size: 30px;
  color:rgb(2, 0, 141);
}
.btnbox1{
  margin:0 auto;
  display: flex;
  flex-direction: row;
  justify-content: center;
  * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}



a {
  position: relative;
  margin:5px;
  padding: 10px 20px;
  display: block;
  text-decoration: none;
  text-transform: uppercase;
  width: 200px;
  overflow: hidden;
  border-radius: 40px;
}
a span {
  position: absolute;
  top:13%;
  left: 40%;
  color: #fff;
  font-size: 20px;
  z-index: 4;
}

a .liquid {
  position: absolute;
  top: -70px;
  left: 0;
  width: 200px;
  height: 200px;
  background: #4973ff;
  box-shadow: inset 0 0 50px rgba(0, 0, 0, .5);
  transition: .5s;
}

a .liquid::after,
a .liquid::before {
  content: '';
  width: 200%;
  height: 200%;
  position: absolute;
  top: 0;
  left: 50%;
  transform: translate(-50%, -75%);
  background: #000;
}

a .liquid::before {
  
  border-radius: 45%;
  background: rgba(20, 20, 20, 1);
  animation: animate 5s linear infinite;
}

a .liquid::after {
  
  border-radius: 40%;
  background: rgba(20, 20, 20, .5);
  animation: animate 10s linear infinite;
}

a:hover .liquid{
  top: -120px;
}


}
.goods_name{
  width:410px;
}
@keyframes animate {
  0% {
    transform: translate(-50%, -75%) rotate(0deg);
  }
  100% {
    transform: translate(-50%, -75%) rotate(360deg);
  }
}
#currency {
  position: absolute;
  top:20px;
  right: 35px;
  color:white;
}
#exampleNames {
  display: none;
  position: absolute;
  top:50px;
  left:10px;
  z-index:99999;
  background-color: #000;
  border-radius: 10px;
  width:95%;
  color: white;
  p:hover{
    background-color: rgb(230, 209, 20);
    
  }
}

.ment01{
  text-align: left;
  font-size: 15px;
  li{
    list-style: circle;
  }
}

@-webkit-keyframes bg-spin {
  to {
    --border-angle: 1turn;
  }
}
@keyframes bg-spin {
  to {
    --border-angle: 1turn;
  }
}

</style>
<c:choose>
	<c:when test="${result=='enterFailed' }">
		<script>
		</script>
	</c:when>
</c:choose>
</head>
<body>
    <!DOCTYPE html>
    <html>
    <head>
    <title>상품 등록 페이지</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body> 
      <img width=100% src="${contextPath}/resources/image/make01.png">
      <h1 class="title01">상품수정</h1>
        <div class="goodsAddContainer">
	<form  class="goodsAddContainer" name="goodsForm" action="${contextPath}/goods/modGoods.do" method="post" enctype="multipart/form-data">
        
            <div class="goodsTop1">
              <span class="sub_title01">상품 대표이미지</span>
                <label for="goods_img1">
                  <div class="gradient-border"><img class="noImg1" src="${contextPath}/download2.do?goods_code=${goods.goods_code}&goods_img1=${goods.goods_img1}" id="preview"/></div>
                  <div class="btn-upload">파일 업로드하기
                  <input type="file" id="goods_img1" onchange="readURL(this);" name="goods_img1">
                </div><input type="hidden" id="fileSelected1" name="fileSelected1" value="false">

                </label>
                <span class="sub_title01">상품 추가 이미지</span>
                <label for="goods_img2">
                  <div class="box1"><img class="noSubImg1" src="${contextPath}/download20.do?goods_code=${goods.goods_code}&goods_img2=${goods.goods_img2}" id="preview1" /></div>
                  <div class="btn-upload">파일 업로드하기
                  <input type="file" id="goods_img2" onchange="readURL1(this);" name="goods_img2">
                </div><input type="hidden" id="fileSelected2" name="fileSelected2" value="false">

                </label>
              </div>
              <div class="goodsInner1">
                <h3 class="sub_title02">기본 정보</h3>
              <div class="col-md-6 "><span class="material-symbols-outlined" style="font-size: 30px;">
                barcode_scanner
                </span>
                <div class="input-group">
                  <label class="input-group__label" for="myInput">상품 코드</label>
                  <input type="text" id="myInput" class="input-group__input" value="${goods.goods_code}" disabled>
                  <input type="hidden" id="goods_code" name="goods_code" value="${goods.goods_code}" >
                </div>　
                <span class="material-symbols-outlined" style="font-size: 30px;">
                  qr_code
                  </span>
                <div class="input-group">
                  <label class="input-group__label" for="myInput">상점 코드</label>
                  <input type="text" value="${goods.shop_code}" id="myInput" class="input-group__input" name="shop_code" disabled>
                  <input type="hidden" value="${goods.shop_code}" id="myInput" class="input-group__input" name="shop_code">
                  
                </div>
                
              </div>
              <div class="col-md-6"><span class="material-symbols-outlined" style="font-size: 30px;">
                sort
                </span>
              <div class="input-group">
                <label class="input-group__label" for="myInput">상품 종류</label>
                <select id="myInput" class="input-group__input" name="goods_sort">
                  <option  value="${goods.goods_sort}" selected>${goods.goods_sort}</option>
                  <option  value="phone">스마트폰</option>
                  <option value="case">케이스</option>
                  <option value="acc" >악세서리</option>
                </select>
              </div>　　　<span class="material-symbols-outlined" style="font-size: 30px;">
                category
                </span>
              <div class="input-group">
                <label class="input-group__label" for="myInput">상품 브랜드</label>
                <select id="myInput" class="input-group__input" name="goods_type" >
                  <option value="${goods.goods_type}" selected>${goods.goods_type}</option>
                  <option value="apple">Apple</option>
                  <option value="samsung">Samsung</option>
                  <option value="other" >기타</option>
                </select>
              </div><span class="material-symbols-outlined" style="font-size: 30px;">
                language_gb_english
                </span>
              <div class="input-group">
                <label class="input-group__label" for="myInput">스마트폰 용량</label>
                <select id="myInput" class="input-group__input" name="goods_volume">
                  <option value="${goods.goods_volume}">${goods.goods_volume}</option>
                  <option value="128GB">128GB</option>
                  <option value="256GB">256GB</option>
                  <option value="512GB">512GB</option>
                  <option value="1TB">1TB</option>
                  <option value="용량없음">용량없음</option>
                </select>
              </div>
              </div>
              <div class="col-md-6">
                <span class="material-symbols-outlined" style="font-size: 30px;">
                  title
                  </span>
                <div class="input-group">
                  <label class="input-group__label"  for="myInput2">상품 이름</label>
                  <input  type="text"id="myInput2" class="input-group__input goods_name" name="goods_name" value="${goods.goods_name}">
                  <div id="exampleNames">
                    <p>Galaxy S24 Ultra</p>
                    <p>Galaxy Z Fold 5</p>
                    <p>Galaxy Note 20 Ultra</p>
                    <p>Galaxy S21 Plus</p>
                    <p>Galaxy A52s</p>
                    <p>iPhone 15 Pro Max</p>
                    <p>iPhone 15 Mini</p>
                    <p>iPhone 15 Pro</p>
                    <p>iPhone 15</p>
                    <p>iPhone 15 Pro Max</p>
                  </div>
                  </div>　　　　 <span class="material-symbols-outlined" style="font-size: 30px;">
                 price_check
                  </span>
                <div class="input-group">
                  <label class="input-group__label" for="myInput1">가격</label>
                  <input type="text" id="myInput1" class="input-group__input" name="goods_price1" value="${goods.goods_price}">
                  <input type="hidden" id="goods_price" class="input-group__input" name="goods_price" value="${goods.goods_price}">
                  <span id="currency">원</span>
                  
                </div>
              </div>
             <h5 class="ment01"><ul>
              <li>스마트폰 상품등록 시 꼭 색상을 선택하여 주세요.</li>
              <li>상품이름은 예시처럼 입력해주세요.</li>
              <li>상품등록은 해당 샵코드를 기준으로 작성됩니다.</li>
              <li>KnockX2의 Smart한 서비스를 경험해보세요.</li>
              <li>상품상세페이지 등록시 이미지 파일은 5개까지 가능합니다.</li>
            </ul></h5>
            <h3 class="sub_title02">상품 상세페이지</h3>
            <div class="row">
              <div class="col-md-12">
            
                <div>
                  <textarea id="editorTxt" width=100% rows="30" maxlength="4000" name="goods_content1" placeholder="내용을 입력하세요">${goods.goods_content}"</textarea>
                  
                  <input type="hidden" id="anotherTextarea" name="goods_content" />
                </div>
                
              </div>
            </div>
            <div class="row">
             
          </div>
          
            </div>
            <div class="md-7">
              <span class="sub_title01"><span class="material-symbols-outlined">
                palette
                </span>상품 색상 옵션</span>
              <label for="goods_color1">상품 색상 1</label>
              <select id="color" class="select" name="goods_color1" required>
                <option value="${goods.goodsColorVO.goods_color1}" selected>${goods.goodsColorVO.goods_color1}</option>
                <option value="null" >없음</option>
                <option value="black">블랙</option>
              </select>
              <label for="goods_color2">상품 색상 2</label>
              <select id="goods_color2" class="select" name="goods_color2">
                <option value="${goods.goodsColorVO.goods_color2}" selected>${goods.goodsColorVO.goods_color2}</option>
                <option value="null" >없음</option>
                <option value="white">화이트</option>
              </select>
              <label for="goods_color3">상품 색상 3</label>
              <select id="goods_color3" class="select" name="goods_color3">
                <option value="${goods.goodsColorVO.goods_color3}" selected>${goods.goodsColorVO.goods_color3}</option>
                <option value="null" >없음</option>
                <option value="silver">실버</option>
              </select>
              <label for="goods_color4">상품 색상 4</label>
              <select id="goods_color4" class="select" name="goods_color4">
                <option value="${goods.goodsColorVO.goods_color4}" selected>${goods.goodsColorVO.goods_color4}</option>
                <option value="null" >없음</option>
                  <option value="gold">골드</option>
              </select>
              <label for="goods_color5">상품 색상 5</label>
              <select id="goods_color5"  class="select" name="goods_color5">
                <option value="${goods.goodsColorVO.goods_color5}" selected>${goods.goodsColorVO.goods_color5}</option>
                <option value="null" >없음</option>
                <option value="silver">실버</option>
                <option value="space-gray">스페이스 그레이</option>
                <option value="blue">블루</option>
                <option value="gray">그레이</option>
                <option value="rose">로즈</option>
                <option value="midnight-black">미드나잇 블랙</option>
                <option value="white">화이트</option>
                <option value="gold">골드</option>
                <option value="black">블랙</option>
              </select>
          </div>
        
      </div>
          <div class="btnbox1">
              <a><button type="submit" onclick="getEditorContent()" ><span>수정</span><div class="liquid"></div></button>

              <a href="#" onclick="backToList(document.forms[0]); return false;">

                <input type="button" value="목록">
                <span>목록</span>
                <div class="liquid"></div>
              </a>
              
              
        </div>
      </form>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
 
</style>
    <script>
 $(document).ready(function() {
  $('#myInput2').on('focus', function() {
    $('#exampleNames').show();
  });

  $(document).on('click', '#exampleNames p', function() {
    var exampleName = $(this).text(); // 예시 이름 가져오기
    $('#myInput2').val(exampleName); // 상품 이름 입력 필드의 값으로 설정
    $('#exampleNames').hide(); // 예시 이름들 숨김
  });

  $(document).on('click', function(e) {
    if (!$(e.target).closest('#myInput2, #exampleNames').length) {
      $('#exampleNames').hide();
    }
  });
  
});





      $('#myInput1').on('input', function(e){
  var input = this.value.replace(/[^0-9]/g, ''); // 숫자가 아닌 문자 제거
  var number = parseInt(input, 10); // 문자열을 숫자로 변환
  if (isNaN(number)) { // 숫자가 아니면 입력을 비움
    this.value = '';
    $('#hiddenInput').val(''); // hidden input도 비움
  } else {
    // 숫자를 3자리마다 콤마가 들어가는 문자열로 변환
    this.value = number.toLocaleString('ko-KR');
    $('#goods_price').val(number); // hidden input에 숫자만 저장
  }
});


    function readURL(input){
      if (input.files && input.files[0]){
        var file = input.files[0];
  
        // 이미지 파일인지 확인
        if (file.type.match('image.*')) {
          var reader = new FileReader();
          reader.onload = function (e){
            $('#preview.noImg1').attr('src', e.target.result);
          }
          reader.readAsDataURL(file);

// 파일을 선택했으므로 hidden input 값을 업데이트
$('#fileSelected1').val('true');
} else {
console.log('이미지 파일을 선택해주세요.');
}
} else {
console.log('파일을 선택하지 않았습니다.');
// 파일을 선택하지 않았으므로 hidden input 값을 업데이트
$('#fileSelected1').val('false');
}
    }
    function readURL1(input){
      if (input.files && input.files[0]){
        var file = input.files[0];
  
        // 이미지 파일인지 확인
        if (file.type.match('image.*')) {
          var reader = new FileReader();
          reader.onload = function (e){
            $('#preview1.noSubImg1').attr('src', e.target.result);
          }
          reader.readAsDataURL(file);

// 파일을 선택했으므로 hidden input 값을 업데이트
$('#fileSelected2').val('true');
} else {
console.log('이미지 파일을 선택해주세요.');
}
} else {
console.log('파일을 선택하지 않았습니다.');
// 파일을 선택하지 않았으므로 hidden input 값을 업데이트
$('#fileSelected2').val('false');
}
    }
        $("#file").on('change',function(){
  var fileName = $("#file").val();
  $(".upload-name").val(fileName);
});
        let oEditors = [];
        
        function smartEditor() {
          console.log("Naver SmartEditor");
          nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "editorTxt",
            sSkinURI: "/smarteditor/SmartEditor2Skin.html",
            fCreator: "createSEditor2"
          });
        }
        
        $(document).ready(function() {
          smartEditor();
        });
        
        function getEditorContent() {
          oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
          var content = oEditors.getById["editorTxt"].getIR();
          document.getElementById("anotherTextarea").value = content;
        }

        function finish() {

alert("수정이 완료되었습니다.");
}
      </script>
    
</body>
</html>