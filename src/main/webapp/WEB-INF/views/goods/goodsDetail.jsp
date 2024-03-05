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
<title>상품 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />

<style>
.goodsBox{
  display: flex;
  flex-direction: column;
  padding:10px;
}
.goodsImgBox{
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 50%;
}
.goodsImg1{
  text-align: center;
  width:80%;
  max-width: 470px;
  height: 550px;
  padding: 10px;
  margin:20px auto;
  background-color: #9fccff;
  img{
    width:100%;
    height: 100%;
  }
}
.goodsImg2{
  border: 2px solid #616161;
  width:200px;
  height: 250px;
  margin:10px auto;
  img{
    width:100%;
    height: 100%;
  }
}
.thumbnails img {
  width: 110px;
}
.goodsContentBox{
  display: flex;
  flex-direction: column;
}

.zoom {
  padding:5px;
  img{
  border:1px solid #cfcfcf;
}
}

img.data-zoom {
  border: 4px solid black;
}

.mainphoto img[src] {
  border: 3px solid #000;
}
.goodsBoxInner1{
  display: flex;
  justify-content: center;
  padding:0px;
}
.goodsColorBox{
  display: flex;
  padding:auto 0;
  
}
.colorName01{
        color:rgb(12, 12, 12) !important;
        font-size: 13px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding:3px;
        span{
          margin:0 auto;
        }
    }
  .option01{
    border-bottom: 3px solid;
  }
  .colorOption input[type="radio"] {
    display: none;
  }
.colorOption{
  border-top: 3px solid tomato;
  margin:5px;
}
  .colorOption input[type="radio"]:checked + .colorName01 span {
    border: 3px solid #e70000;
    transform: scale(1.2); /* 선택 시 확대되도록 스케일 조정 */
    background-color: rgba(0, 0, 0, 0.87); /* 선택 시 배경색 추가 */

  }
  .colorOption input[type="radio"]:checked  + .colorName01 {
  border-bottom: 15px solid tomato;
  padding:10px;
  e{
  color:rgb(255, 255, 255);
  font-size: 18px;
  font-size: bold;
}
 
  background-color: rgb(0, 37, 158);
 
}
.contentInner{
  background: #fff;
  font-size: 24px;
  line-height: 30px;
  font-weight: bold;
  padding: 0px;
  border-radius: 80px;
  box-shadow:
	  inset #d6d6d6 0 0 0 3px, 
    inset rgb(65, 125, 255) 0 0 0 1px, 
    inset #ffffff 0 0 0 10px, 
    inset rgb(110, 110, 110) 0 0 0 13px;
    display: flex;
    flex-direction: column;
  max-height: 1000px;
  overflow-y: scroll;
}
.reviewBox{
  display: flex;
  flex-direction: column;

}
.review01{
  display: flex;
  justify-content: flex-start;
  flex-wrap: nowrap;
  height: 200px;
 

  } .editor {
    border:1px solid #c7c7c7;
    border-radius: 20px;
    width:1000px;   overflow-y: scroll;
    *{
      width: 98%;
    
    }
 
  } 
  .reviewBtn{
    width:15%;
    margin:10px;
    font-size: 30px;
    background-color: #258bff;
    border-radius: 20px;
    border:0;
    color:white;
    font-weight: bold;
    &:hover{
    background-color: #258bff8a;
    }
  }
  .rating {
  unicode-bidi: bidi-override;
  direction: rtl;
  text-align: center;
  margin:10px;
  padding:5px;
  border-radius: 10px;
}

.rating select {
  width:200px;
  padding:0 5px;
  font-size: 24px;
  color:tomato;
  border-radius: 10px;
  font-weight: bold;
}

.rating option {
  padding: 0;
  font-size: 24px;
  cursor: pointer;
  color:#ffc107;
  border:1px solid;
  
}

.rating option:before {
  content: '★';
}

.rating option:checked:before {
  content: '★★★★★';
}
.reviewTab{
  width: 100%;
}
.reviewTab, .reviewTab td{
  border:1px solid #cacaca;
  border-collapse: collapse;
}
.reviewContent{
  max-width: 1000px;
  max-height:300px;
  overflow-y: scroll;
  
}
.reviewTabTitle{
  font-weight: bold;
}
</style>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

</head>
<body> 
  <div class="goodsBox">
    <div style="text-align: right; border-bottom:5px solid rgb(110, 110, 110);">
      <img src="${contextPath}/resources/image/pay1.png" width="350px">
    </div>
    <div class="goodsBoxInner1">
      <div class="goodsImgBox">
  <div class="goodsImg1">
    <a href="#" class="main-image">
  <c:choose>
		<c:when test="${goodsInfo.goods_img1 == null}">
		  <img  src="${contextPath}/resources/image/noImg1.jpg" data-zoom="" id="preview" />
		  
		</c:when>
		<c:when test="${goodsInfo.goods_img1 != null}">
		  <img src="${contextPath}/download2.do?goods_code=
				${goodsInfo.goods_code}&goods_img1=${goodsInfo.goods_img1}" data-zoom="" id="preview"/>
		</c:when>
  </c:choose>
</a>
      </div>
            <div class="thumbnails">
              <a href="#" class="zoom">
                <c:choose>
                  <c:when test="${goodsInfo.goods_img1 == null}">
                    <img  src="${contextPath}/resources/image/noImg1.jpg" data-zoom="" id="preview" />
                    
                  </c:when>
                  <c:when test="${goodsInfo.goods_img1 != null}">
                    <img src="${contextPath}/download2.do?goods_code=${goodsInfo.goods_code}&goods_img1=${goodsInfo.goods_img1}" data-zoom="" id="preview"/>
                  </c:when>
                </c:choose>
              </a>
            
                <a href="#" class="zoom first">
                  <c:choose>
                    <c:when test="${goodsInfo.goods_img2 == null}">
                      <img  src="${contextPath}/resources/image/noImg1.jpg" id="preview" />
                      
                    </c:when>
                    <c:when test="${goodsInfo.goods_img2 != null}">
                      <img src="${contextPath}/download20.do?goods_code=${goodsInfo.goods_code}&goods_img2=${goodsInfo.goods_img2}" id="preview"/>
                    </c:when>
                  </c:choose>
              </a>
          </div>
    </div>
    <style>
      .product-content{
    padding: 10px;
    width: 45%;
    text-align: left;
    display: flex;
    flex-direction: column;
}
.product-title{
    font-size: 3rem;
    text-transform: capitalize;
    font-weight: 700;
    position: relative;
    color: #12263a;
    margin: 1rem 0;
}
.product-title::after{
    content: "";
    position: absolute;
    left: 0;
    bottom: 0;
    height: 4px;
    width: 80px;
    background: #12263a;
}
.product-link{
    text-decoration: none;
    text-transform: uppercase;
    font-weight: 400;
    font-size: 0.9rem;
    width:200px;
    display: inline-block;
    margin-bottom: 0.5rem;
    background: #256eff;
    color: #fff;
    padding: 0 0.3rem;
    transition: all 0.5s ease;
}
.product-link:hover{
    opacity: 0.8;
}
.product-rating{
    color: #ffc107;
}
.product-rating span{
    font-weight: 600;
    color: #252525;
}
.product-price{
    margin: 1rem 0;
    font-size: 20px;
    font-weight: 700;
}
.product-price span{
    font-weight: 400;
}
.last-price span{
    color: #f64749;
    text-decoration: line-through;
}
.new-price span{
    color: #256eff;
    font-size: 25px;
}
.product-detail h2{
    text-transform: capitalize;
    color: #12263a;
    padding-bottom: 0.6rem;
}
.product-detail p{
    font-size: 0.9rem;
    padding: 0.3rem;
    opacity: 0.8;
}
.product-detail ul{
    margin: 1rem 0;
    font-size: 0.9rem;
    padding:0;
}
.product-detail ul li{
    margin: 0;
    list-style: none;
    background: url(https://fadzrinmadu.github.io/hosted-assets/product-detail-page-design-with-image-slider-html-css-and-javascript/checked.png) left center no-repeat;
    background-size: 18px;
    padding-left: 1.7rem;
    margin: 0.4rem 0;
    font-weight: bold;
    opacity: 0.9;
    font-size: 18px;
}
.product-detail ul li span{
    font-weight: 500;
    
}
.purchase-info{
    margin: 1.5rem 0;
}
.purchase-info input,
.purchase-info .btn{
    border: 1.5px solid #ddd;
    border-radius: 25px;
    text-align: center;
    padding: 0.45rem 0.8rem;
    outline: 0;
    margin-right: 0.2rem;
    margin-bottom: 1rem;
}
.purchase-info input{
    width: 60px;
}
.purchase-info .btn{
    cursor: pointer;
    color: #fff;
}
.purchase-info .btn:first-of-type{
    background: #256eff;
}
.purchase-info .btn:last-of-type{
    background: blueviolet;
}
.purchase-info .btn{
    background: #f64749
}
.purchase-info .btn:hover{
    opacity: 0.9;
}
.social-links{
    display: flex;
    align-items: center;
}
.social-links a{
    display: flex;
    align-items: center;
    justify-content: center;
    width: 32px;
    height: 32px;
    color: #000;
    border: 1px solid #000;
    margin: 0 0.2rem;
    border-radius: 50%;
    text-decoration: none;
    font-size: 0.8rem;
    transition: all 0.5s ease;
}
.social-links a:hover{
    background: #000;
    border-color: transparent;
    color: #fff;
}

    </style>
     <!-- card right -->
     <c:choose>
      <c:when test="${result=='enterFailed' }">
        <script>
          window.onload=function(){
            alert("일반회원 페이지입니다. 회원으로 다시 로그인해주세요.");
          }
        </script>
      </c:when>
    </c:choose>  
     <div class = "product-content">
      <form name="order" method="post" action="${contextPath}/order/orderForm.do">
        <input type="hidden" name="goods_code" value="${goodsInfo.goods_code}">
        <input type="hidden" name="id" value="${member.id}">
        <h2 class = "product-title">${goodsInfo.goods_name}</h2>
      <a href = "#" class = "product-link">${shopInfo.shopVO.shop_name} 스토어 상품</a>
      <div class = "product-rating">
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class = "fa fa-star-half"></i>
        <span>4.7(21)</span>
      </div>

      <div class = "product-price">
        <p class = "last-price">Old Price: <span><fmt:formatNumber type="number"  value="${goodsInfo.goods_price}" />원</span><br><i style="font-size: 15px; font-style: normal;">(오픈기념 전품목 10% 할인)</i></p>
        <p class = "new-price">Sale Price: <span><fmt:formatNumber type="number"  value="${goodsInfo.goods_price*0.9}" />원</span></p>
      </div>

      <div class = "product-detail">
        
        <ul>
          <li class="option01">
            <div class="goodsColorBox">
            <e style="margin:auto 10px;">Color</e>
            <c:if test="${goodsInfo.goodsColorVO.goods_color1 == 'black'}">
              <label class="colorOption">
                <input type="radio" name="goods_color" value="black" checked>
                <span class="colorName01">
                  <e>Black</e>
                  <span style="background-color: black; border-radius: 50%; border:3px solid rgb(71, 145, 255); width: 30px; height: 30px; display: inline-block;"></span>
                </span>
              </label>
            </c:if>
            <c:if test="${goodsInfo.goodsColorVO.goods_color2 == 'white'}">
              <label class="colorOption">
                <input type="radio" name="goods_color" value="white">
                <span class="colorName01">
                  <e>White</e>
                  <span style="background-color: white; border-radius: 50%; border:3px solid rgb(71, 145, 255); width: 30px; height: 30px; display: inline-block;"></span>
                </span>
              </label>
            </c:if>
            <c:if test="${goodsInfo.goodsColorVO.goods_color3 == 'silver'}">
              <label class="colorOption">
                <input type="radio" name="goods_color" value="silver">
                <span class="colorName01">
                  <e>Silver</e>
                  <span style="background-color: silver; border-radius: 50%; border:3px solid rgb(71, 145, 255); width: 30px; height: 30px; display: inline-block;"></span>
                </span>
              </label>
            </c:if>
            <c:if test="${goodsInfo.goodsColorVO.goods_color4 == 'gold'}">
              <label class="colorOption">
                <input type="radio" name="goods_color" value="gold">
                <span class="colorName01">
                  <e> Gold</e>
                  <span style="background-color: gold; border-radius: 50%; border:3px solid rgb(71, 145, 255); width: 30px; height: 30px; display: inline-block;"></span>
                </span>
              </label>
            </c:if>
            <c:if test="${goodsInfo.goodsColorVO.goods_color5 != 'null'}">
              <label class="colorOption">
                <input type="radio" name="goods_color" value="${goodsInfo.goodsColorVO.goods_color5}">
                <span class="colorName01">
                  <e>  ${goodsInfo.goodsColorVO.goods_color5}</e>
                  <span style="background: linear-gradient(to right, red, green, blue); border-radius: 50%; border:3px solid rgb(71, 145, 255); width: 30px; height: 30px; display: inline-block;"></span>
                </span>
              </label>
            </c:if>
          </div>
        </li>
          <li style="margin: 20px 0;">Volume : <span style="border:5px solid rgb(207, 207, 207); border-radius: 15px; padding:10px;">${goodsInfo.goods_volume}</span></li>
          <li>Brand : <span>${goodsInfo.goods_type}</span></li>
          <li>Category : <span>${goodsInfo.goods_sort}</span></li>
          <li>상품등록일 : <span>${goodsInfo.goods_create_date}</span></li>
        </ul>
      </div>
      <div class = "purchase-info">
      <c:if test="${member.memberSort == 'member' || member.memberSort == 'admin'}">
        <input type = "number" name="goods_qty" min = "0" value = "1">
        <button type = "button" id="cartBtn" onclick="submitCartForm();" class = "btn">
          Add to Cart <i class = "fas fa-shopping-cart"></i>
        </button>
      
        <button type = "submit" class = "btn" >구매하기</button>
      </c:if>
        <c:if test="${member.memberSort == 'admin' || shop.shop_code == goodsInfo.shop_code}">
        <button type = "button" class = "btn" ><a href="${contextPath}/goods/modGoodsForm.do?goods_code=${goodsInfo.goods_code}">수정하기</a></button>
      </c:if>  
    </div>
        </form>
        <form name="cart" action="${contextPath}/cart/addInCart.do" method="post">
          <input type="hidden" name="id" value="${member.id}">
          <input type="hidden" name="goods_code" value="${goodsInfo.goods_code}">
      </form>
      <p>knockX2는 판매대리인으로서 일정 수수료를 제공받습니다.</p>
      <p>knockX2 X ${shopInfo.shopVO.shop_name}과 제휴관계로 상품판매의 책임은 knockX2에게 청구할 수 있습니다.</p>
      <div class = "social-links">
          <p>Share At: </p>
          <a href = "#">
            <i class = "fab fa-facebook-f"></i>
          </a>
          <a href = "#">
            <i class = "fab fa-twitter"></i>
          </a>
          <a href = "#">
            <i class = "fab fa-instagram"></i>
          </a>
          <a href = "#">
            <i class = "fab fa-whatsapp"></i>
          </a>
          <a href = "#">
            <i class = "fab fa-pinterest"></i>
          </a></div>
      </div>
    </div>
    <div class="goodsContentBox">
      <h1 style="text-align: left; border-bottom: 5px solid; margin:10px; width:30%; color:#004797">상품 설명</h1>
      <div class="contentInner">
      ${goodsInfo.goods_content}
      </div>
     </div>

     
     <div class="reviewBox">
      <h1 style="text-align: left; border-bottom: 5px solid; margin:10px; width:30%; color:#004797">상품 리뷰</h1>
      <c:if test="${member.memberSort == 'member'}">
      <form name="review" method="post" action="${contextPath}/review/addReview.do">
      <div class="review01">
      <div style="padding:10px 20px; display: flex; flex-direction: column; justify-content: flex-start;"><h1 style="color:#313131">(${member.id})님</h1>
        <div class="rating">
          <select id="star-rating" name="rating">
            <option value="1" selected>별점 평가</option>
            <option value="1">★</option>
            <option value="2">★★</option>
            <option value="3">★★★</option>
            <option value="4">★★★★</option>
            <option value="5">★★★★★</option>
          </select>
        </div>
      </div>
      <input type="hidden" name="id" value="${member.id}">
      <div class="editor"><textarea id="editorTxt"  maxlength="4000" name="content1" placeholder="내용을 입력하세요"></textarea>
		  <input type="hidden" id="anotherTextarea" name="content" />
		  <input type="hidden" name="goods_code" value="${goodsInfo.goods_code}" /></div>
      <button class="reviewBtn" type="submit" onclick="getEditorContent();">작성</button>
    </div>
  </form>
</c:if>
<c:choose>
  <c:when test="${reviewList[0] == null}">
  <h1>등록된 리뷰가 없습니다.</h1>
</c:when>
<c:when test="${reviewList[0] != null}">
  <table class="reviewTab">
    <tr class="reviewTabTitle">
      <td width="20%">별점</td>
      <td width="50%">내용</td>
      <td width="10%">작성자</td>
      <td width="20%">작성날짜</td>
    </tr>
  <c:forEach var="rev" items="${reviewList}">
   
      <tr style="max-height: 100px !important;table-layout:fixed;">
        <td style="color:#ffc107">
          <c:choose>
            <c:when test="${rev.rating == 1}">
              <span><i class="fa fa-star"></i></span>
            </c:when>
            <c:when test="${rev.rating == 2}">
              <span><i class="fa fa-star"></i><i class="fa fa-star"></i></span>
            </c:when>
            <c:when test="${rev.rating == 3}">
              <span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span>
            </c:when>
            <c:when test="${rev.rating == 4}">
              <span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span>
            </c:when>
            <c:when test="${rev.rating == 5}">
              <span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span>
            </c:when>
          </c:choose>
        </td>
        <td ><div class="reviewContent">${rev.content}</div></td>
        <td style="color:#e90000">**${rev.id.substring(3)}</td>
        <td>${rev.writedate}</td>
      </tr>
     
</c:forEach>
</table> 
</c:when>
</c:choose>
  </div>


     </div>
</div>


  
  
<style>
 
</style>
<link rel="stylesheet" type="text/css" href="https://codepen.io/imgix/pen/d06269809bb83c85326ebbbf7e81241b.css">
<link rel="stylesheet" type="text/css" href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/164071/drift-basic.css">
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/164071/Drift.min.js"></script>
   <!-- jQuery -->
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

    <script>
     function submitCartForm() {
  // 선택된 radio 버튼 요소 가져오기
  var selectedColor = document.querySelector('input[name="goods_color"]:checked');

  // 선택된 radio 버튼의 값 가져오기
  var colorValue = selectedColor.value;

  // 가져온 값 확인을 위해 콘솔에 출력
  console.log(colorValue);

  // 가져온 값(선택된 goods_color)을 form에 hidden input으로 추가하여 넘겨주기
  var hiddenInput = document.createElement('input');
  hiddenInput.type = 'hidden';
  hiddenInput.name = 'goods_color';
  hiddenInput.value = colorValue;

  // form 요소 가져오기
  var cartForm = document.forms['cart'];

  // hidden input을 form에 추가
  cartForm.appendChild(hiddenInput);

  // goods_qty 값 가져오기
  var goodsQtyInput = document.querySelector('input[name="goods_qty"]');
  var goodsQtyValue = goodsQtyInput.value;

  // 가져온 값 확인을 위해 콘솔에 출력
  console.log(goodsQtyValue);

  // 가져온 값(goods_qty)을 form에 hidden input으로 추가하여 넘겨주기
  var hiddenQtyInput = document.createElement('input');
  hiddenQtyInput.type = 'hidden';
  hiddenQtyInput.name = 'goods_qty';
  hiddenQtyInput.value = goodsQtyValue;

  // hidden input을 form에 추가
  cartForm.appendChild(hiddenQtyInput);
  // form 제출
  cartForm.submit();
}
        // URL에서 alert 파라미터를 확인하여 작성 여부를 판단하고 alert 창을 표시
  var urlParams = new URLSearchParams(window.location.search);
  if (urlParams.has('alert') && urlParams.get('alert') === 'exist') {
    alert('이미 작성하였거나 상품을 구매하지 않았습니다.');
  }
  if (urlParams.has('alert') && urlParams.get('alert') === 'exist1') {
    alert('작성이 완료되었습니다. 적립금 1000원 적립');
  }
  document.addEventListener('DOMContentLoaded', function() {
    new Drift(document.querySelector('.main-image img'), {
      inlinePane: true,
      containInline: true,
      zoomFactor: 1.5,

    });
  });

  // 첫 번째 이미지로 초기화
  var firstImage = document.querySelector('.thumbnails .zoom').querySelector('img').getAttribute('src');
  document.querySelector('.main-image img').setAttribute('src', firstImage);
  document.querySelector('.main-image img').setAttribute('data-zoom', firstImage);

  // 썸네일 클릭 시 이미지 변경
  var thumbnails = document.querySelectorAll('.thumbnails .zoom');
  thumbnails.forEach(function(thumbnail) {
    thumbnail.addEventListener('click', function(e) {
      e.preventDefault();
      var photo_fullsize = this.querySelector('img').getAttribute('src');
      document.querySelector('.main-image img').setAttribute('src', photo_fullsize);
      document.querySelector('.main-image img').setAttribute('data-zoom', photo_fullsize);
    });
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
      </script>
    
</body>
</html>