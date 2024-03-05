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
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet"  href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />

<style>
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap');

a{
    text-decoration: none;
    color:#3f3f3f;
}


.container {
    max-width: 1600px;
    margin: 20px auto;
    overflow: hidden;
    background-color: #f1f9ff;
    justify-content: center;
}

.box-1 {
    max-width: 700px;
    padding: 10px 40px;
    user-select: none;
}

.box-1 div .fs-12 {
    font-size: 10px;
    color: white;
}

.box-1 div .fs-14 {
    font-size: 15px;
    color: white;
}

.box-1 img.pic {
    width: 20px;
    height: 20px;
    object-fit: cover;
}

.box-1 img.mobile-pic {
    width: 80%;
    height: 200px;
    object-fit: cover;
}

.box-1 .name {
    font-size: 18px;
    font-weight: 600;
    background-color: #7700ff;
    color: white;
    padding-right:10px;
}

.dis {
    font-size: 16px;
    font-weight: 500;
}

label.box {
    width: 100%;
    font-size: 12px;
    background: #e4f1ff;
    margin-top: 12px;
    padding: 10px 12px;
    border-radius: 5px;
    cursor: pointer;
    border: 1px solid transparent;
}

#one:checked~label.first,
#two:checked~label.second,
#three:checked~label.third {
    border-color: #7700ff;
}

#one:checked~label.first .circle,
#two:checked~label.second .circle,
#three:checked~label.third .circle {
    border-color: #7a34ca;
    background-color: #fff;
}

label.box .course {
    width: 100%;
    height: 120px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    span{
        justify-content: center;
    }
}

label.box .circle {
    height: 12px;
    width: 12px;
    background: #ccc;
    border-radius: 50%;
    margin-right: 15px;
    border: 4px solid transparent;
    display: inline-block;
}

input[type="radio"] {
    display: none;
}

.box-2 {
    width: 550px;
    padding: 10px 40px;
}


.box-2 .box-inner-2 input.form-control {
    font-size: 16px;
    font-weight: 600;
}

.box-2 .box-inner-2 .inputWithIcon {
    position: relative;
}

.box-2 .box-inner-2 .inputWithIcon span {
    position: absolute;
    left: 15px;
    top: 8px;
}

.box-2 .box-inner-2 .inputWithcheck {
    position: relative;
}

.box-2 .box-inner-2 .inputWithcheck span {
    position: absolute;
    width: 20px;
    height: 20px;
    border-radius: 50%;
    background-color: green;
    font-size: 15px;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    right: 15px;
    top: 6px;
}

.form-control:focus,
.form-select:focus {
    box-shadow: none;
    outline: none;
    border: 1px solid #7700ff;

}

.border:focus-within {
    border: 1px solid #7700ff !important;
}

.box-2 .card-atm .form-control {
    border: none;
    box-shadow: none;

}
.form-control {
   *{ font-size: 25 px;
   }
}
.form-select {
    border-radius: 0;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    padding:10px;
}


.box-2 .box-inner-2 .btn.btn-outline-primary {
    width: 120px;
    padding: 10px;
    font-size: 11px;
    padding: 0% !important;
    display: flex;
    align-items: center;
    border: none;
    border-radius: 0;
    background-color: whitesmoke;
    color: black;
    font-weight: 600;
}

.box-2 .box-inner-2 .btn.btn-primary {
    background-color: #7700ff;
    color: whitesmoke;
    font-size: 14px;
    display: flex;
    align-items: center;
    font-weight: 600;
    justify-content: center;
    border: none;
    padding: 10px;
}

.box-2 .box-inner-2 .btn.btn-primary:hover {
    background-color: #7a34ca;
}

.box-2 .box-inner-2 .btn.btn-primary .fas {
    font-size: 13px !important;
    color: whitesmoke;
}

.carousel-indicators [data-bs-target] {
    width: 10px;
    height: 10px;
    border-radius: 50%;
}

.carousel-inner {
    width: 100%;
    height: 600px;
}

.carousel-item img {
    height: 100%;
}

.carousel-control-prev {
    transform: translateX(-50%);
    opacity: 1;
}

.carousel-control-prev:hover .fas.fa-arrow-left {
    transform: translateX(-5px);
}

.carousel-control-next {
    transform: translateX(50%);
    opacity: 1;
}

.carousel-control-next:hover .fas.fa-arrow-right {
    transform: translateX(5px);
}

.fas.fa-arrow-left,
.fas.fa-arrow-right {
    font-size: 0.8rem;
    transition: all .2s ease;
}

.icon {
    width: 30px;
    height: 30px;
    background-color: #f8f9fa;
    color: black;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    transform-origin: center;
    opacity: 1;
}

.fas,
.fab {
    color: #6d6c6d;
}

::placeholder {
    font-size: 12px;
}
#preview{
    width: 100%;
    height: 600px;

}
#shoplogo{
    width:80px;
    border-radius: 10px;
    border:3px solid #616161;
}
.fw-bold{
    font-size: 19px;
}
.colorName01{
    margin:10px;
    padding:0 10px;
    font-weight: bold;
    font-size: 18px;
    color:rgb(0, 47, 117);
}
.colorName02{
    border-radius: 10px;
    border:2px solid #616161;
    padding:auto 50px;
    background-color: white;
}
.address01{
    font-size: 15px;
    
}
.purchase-info{
    background: #e4f1ff;
    border: 1px solid #7700ff;
}
.purchase-info input
{
    border: 1.5px solid #ddd;
    border-radius: 25px;
    text-align: center;
    padding: 0.45rem 0.8rem;
    outline: 0;
    margin: 0.2rem;
    font-weight: bold;
}
.purchase-info input{
    width: 60px;
}
.paymentBox{
    width: 100%;
    display: flex;
    flex-direction: row;
    padding:10px 30px;
    justify-content: center;
    flex-wrap: wrap;
    background: #fff;
    border: 1.5px solid #ddd;
    border-radius: 25px;
    label{
        border:4px solid #c4c4c4;
        padding:10px;
        border-radius: 50%;
        margin:2px;
    }
    div{
        width: 50%;
    }
}
.paymentBox input[type="radio"]:checked + label{
    background-color: rgb(0, 68, 255);
    font-size: 18px;
    font-weight: bold;
    color:white;
    margin:5px;
    border:4px solid #008cb6;

}
#cardBox{
        display: block;
    }

@media (max-width:768px) {
    .container {
        max-width: 700px;
        margin: 10px auto;
    }

    .box-1,
    .box-2 {
        max-width: 600px;
        padding: 20px 90px;
        margin: 20px auto;
    }

}

@media (max-width:426px) {

    .box-1,
    .box-2 {
        max-width: 400px;
        padding: 20px 10px;
    }

    ::placeholder {
        font-size: 9px;
    }
}
</style>
<c:choose>
	<c:when test="${result=='enterFailed' }">
		<script>
			window.onload=function(){
				alert("일반회원 페이지입니다. 다시 로그인해주세요.");
			}
		</script>
	</c:when>
</c:choose>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body> 
    <div style="text-align: right;">
        <img src="${contextPath}/resources/image/pay2.png" width="350px">
      </div>
  <div class="container d-lg-flex">
    
    <div class="box-1 bg-light user">
        <div class="d-flex align-items-center mb-3">
            <c:choose>
      <c:when test="${shopInfo.imageFN == null}">
        <img  src="${contextPath}/resources/image/profile.png" id="shoplogo"/>
        
      </c:when>
      <c:when test="${shopInfo.imageFN != null}">
        <img src="${contextPath}/download1.do?id=${shopInfo.id}&imageFN=${shopInfo.imageFN}" id="shoplogo" />
      </c:when>
    </c:choose>
            <p class="ps-2 name">${shopInfo.shopVO.shop_name}</p>
        </div>
        <div class="box-inner-1 pb-3 mb-3 ">
            <div class="d-flex justify-content-between mb-3 userdetails">
                <p class="fw-bold">${goodsInfo.goods_name}</p>
                <p class="fw-lighter">${goodsInfo.goods_code}</p>
            </div>
            <div id="my" class="carousel slide carousel-fade img-details" data-bs-ride="carousel"
                data-bs-interval="2000">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#my" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#my" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#my" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="goodsImgBox">
                            <c:choose>
                                <c:when test="${goodsInfo.goods_img1 == null}">
                                  <img  src="${contextPath}/resources/image/noImg1.jpg" id="preview"/>
                                  
                                </c:when>
                                <c:when test="${goodsInfo.goods_img1 != null}">
                                  <img src="${contextPath}/download2.do?goods_code=${goodsInfo.goods_code}&goods_img1=${goodsInfo.goods_img1}"  id="preview"/>
                                </c:when>
                              </c:choose>
                            </div>
                    </div>
                    <div class="carousel-item">
                        <c:choose>
                            <c:when test="${goodsInfo.goods_img2 == null}">
                              <img  src="${contextPath}/resources/image/noImg1.jpg" id="preview" />
                              
                            </c:when>
                            <c:when test="${goodsInfo.goods_img2 != null}">
                              <img src="${contextPath}/download20.do?goods_code=${goodsInfo.goods_code}&goods_img2=${goodsInfo.goods_img2}" id="preview"/>
                            </c:when>
                          </c:choose>
                    </div>
                    <div class="carousel-item">
                        <img  src="${contextPath}/resources/image/opensale.png" id="preview" />
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#my" data-bs-slide="prev">
                    <div class="icon">
                        <span class="fas fa-arrow-left"></span>
                    </div>
                    <span class="visually-hidden">Previous</span>
                </button>

                <button class="carousel-control-next" type="button" data-bs-target="#my" data-bs-slide="next">
                    <div class="icon">
                        <span class="fas fa-arrow-right"></span>
                    </div>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <p class="dis info my-3">상품 이미지
            </p>

            <form id="paymentForm" method="post" action="${contextPath}/order/addOrder.do">
                <input type="hidden" name="id" value="${member.id}">
                <input type="hidden" name="memberSort" value="${member.memberSort}">
                <input type="hidden" name="goods_code" value="${goodsInfo.goods_code}">
                <input type="hidden" name="shop_code" value="${shopInfo.shopVO.shop_code}">

            <div class = "purchase-info">
                <span class="fw-bold">
                    상품 개수 선택
                </span>
                <input type = "number" name="goods_qty" min = "0" value = "${goods_qty}" onchange="updatePrice()"></div>
            <div class="radiobtn">
                <input type="radio" name="box" id="one">
                <input type="radio" name="box" id="two" checked>
                <input type="radio" name="box" id="three">
                <label for="one" class="box py-2 first">
                    <div class="d-flex align-items-start">
                        <span class="circle"></span>
                        <div class="course">
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <span class="fw-bold">
                                    상품 색상 리스트 (color list)
                                </span>
                                <span class="fas fa-dollar-sign">+29</span>
                            </div>
                            <span style="display: flex;"><c:if test="${goodsInfo.goodsColorVO.goods_color1.equals('null')}">
                                <span class="colorName01">
                                  없음<br><span style="background: linear-gradient(to right, red, green, blue); border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
                                </span>
                              </c:if>
                              <c:if test="${!goodsInfo.goodsColorVO.goods_color1.equals('null')}">
                                 
                  <c:if test="${goodsInfo.goodsColorVO.goods_color1 == 'black'}">
                    <span class="colorName01">
                      ${goodsInfo.goodsColorVO.goods_color1}<br><span style="background-color: black; border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
                    </span>
                  </c:if>
                  <c:if test="${goodsInfo.goodsColorVO.goods_color2 == 'white'}">
                    <span class="colorName01">
                      ${goodsInfo.goodsColorVO.goods_color2}<br><span style="background-color: white; border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
                    </span>
                  </c:if>
                  <c:if test="${goodsInfo.goodsColorVO.goods_color3 == 'silver'}">
                      <span class="colorName01">
                        ${goodsInfo.goodsColorVO.goods_color3}<br><span style="background-color: silver; border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
                      </span>
                    </c:if>
                  <c:if test="${goodsInfo.goodsColorVO.goods_color4 == 'gold'}">
                    <span class="colorName01">
                      ${goodsInfo.goodsColorVO.goods_color4}<br><span style="background-color: gold; border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
                    </span>
                  </c:if>
                  <c:if test="${goodsInfo.goodsColorVO.goods_color5 != 'null'}">
                    <span class="colorName01">
                      Other<br><span style="background: linear-gradient(to right, red, green, blue); border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
                    </span>
                  </c:if>
                  <span class="material-symbols-outlined" style="font-weight: bold; margin:auto 0; padding:5px; background-color: rgba(0, 143, 24, 0.575); font-size: 30px; color:white; border-radius: 50px;">
                    done
                    </span>

                  </c:if></span>
                        </div>
                    </div>
                </label>
                <input type="hidden" value="${goods_color}" name="goods_color">
                <label for="two" class="box py-2 second">
                    <div class="d-flex">
                        <span class="circle"></span>
                        <div class="course">
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <span class="fw-bold">
                                    회원님의 선택 색상 (select color)
                                </span>
                                <span class="fas fa-dollar-sign">++</span>
                            </div>
                            <span>
                                <c:choose>
                                <c:when test="${goods_color.equals('null')}">
                                <span class="colorName01">
                                  없음<br><span style="background: linear-gradient(to right, red, green, blue); border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
                                </span>
                              </c:when>
                              <c:when test="${!goods_color.equals('null')}">
                                 <c:choose>
                  <c:when test="${goods_color == 'black'}">
                    <span class="colorName01 colorName02">
                     <span style="background-color: black; border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block; "></span>
                     ${goods_color}</span>
                  </c:when>
                  <c:when test="${goods_color == 'white'}">
                    <span class="colorName01">
                      ${goods_color}<span style="background-color: white; border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block; "></span>
                    </span>
                  </c:when>
                  <c:when test="${goods_color == 'silver'}">
                      <span class="colorName01">
                        ${goods_color}<span style="background-color: silver; border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
                      </span>
                    </c:when>
                  <c:when test="${goods_color == 'gold'}">
                    <span class="colorName01">
                      ${goods_color}<span style="background-color: gold; border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
                    </span>
                  </c:when>
                  <c:otherwise>
                    <span class="colorName01">
                      Other<span style="background: linear-gradient(to right, red, green, blue); border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
                    </span>
                  </c:otherwise>
                </c:choose>
                <span class="material-symbols-outlined" style="font-weight: bold; padding:5px; background-color: rgba(0, 143, 24, 0.575); font-size: 30px; color:white; border-radius: 50px;">
                    done
                    </span>
                </c:when>
                  </c:choose>
                </span>
                        </div>
                    </div>
                </label>
                <label for="three" class="box py-2 third">
                    <div class="d-flex">
                        <span class="circle"></span>
                        <div class="course">
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <span class="fw-bold">
                                    상품 용량 (volume)
                                </span>
                                <span class="fas fa-dollar-sign">++</span>
                            </div>
                            <span style="border:5px solid rgb(94, 94, 94); background-color: white; border-radius: 15px; padding:10px; font-size: 20px; color: rgb(0, 47, 117); font-weight: bold;">${goodsInfo.goods_volume}<span class="material-symbols-outlined" style="font-weight: bold; margin:auto 10px; padding:5px; background-color: rgba(0, 143, 24, 0.575); font-size: 30px; color:white; border-radius: 50px;">
                                done
                                </span></span>
                        </div>
                    </div>
                </label>
              
                
            </div>
        </div>
    </div>
    <div class="box-2">
        <div class="box-inner-2">
            <div>
                
                <p class="fw-bold">구매 상세</p>
                <p class="dis mb-3">구매 상세정보를 입력해주세요.</p>
            </div>
                <div class="my-3 cardname  inputWithcheck">
                    <p class="dis fw-bold mb-2">이름</p>
                                <span class="fas fa-check"></span>
                                <input class="form-control" type="text" name="name" value="${member.name}" required>
                </div>
                <div class="mb-3 inputWithcheck">
                    <p class="dis fw-bold mb-2">Email</p>
                                <span class="fas fa-check"></span>
                    <input class="form-control" type="email" name="email" value="${member.email}" required>
                </div>
                
                   
                    <div class="address">
                        <p class="dis fw-bold mb-3">주소</p>
                       
                        <div class="form-group form-select">
                            <label class="dis fw-bold mb-2 address01" for="zipcode">우편번호</label>
                            <input class="form-control" type="text" id="zipcode" name="zipcode" value="${member.zipcode}" required>
                            <button class="form-control" style="background-color: #00259e; color:white" type="button" onclick="searchZipcode()">우편번호 찾기</button>
                          
                          <div class="form-group">
                            <label  class="dis fw-bold mb-2 address01" for="roadaddress">도로명주소</label>
                            <input class="form-control" type="text" id="roadaddress" name="roadAddress" value="${member.roadAddress}">
                          </div>
                          <div class="form-group">
                            <label class="dis fw-bold mb-2 address01" for="jibunaddress">지번주소</label>
                            <input class="form-control" type="text" id="jibunaddress" name="jibunAddress" value="${member.jibunAddress}">
                          </div>
                          <div class="form-group">
                            <label class="dis fw-bold mb-2 address01" for="namujiaddress">상세주소</label>
                            <input class="form-control" type="text" id="namujiaddress" name="namujiAddress" value="${member.namujiAddress}">
                          </div>
                        </div>
                    </div>
                        <div class=" my-3">
                            <p class="dis fw-bold mb-2">Call Number</p>
                            <div class="inputWithcheck">
                                <input class="form-control" type="text" name="order_call_num" value="${member.call_num}" required>
                                <span class="fas fa-check"></span>

                            </div>
                            <div class=" my-3">
                                <p class="dis fw-bold mb-2">배송 요청사항</p>
                                <div class="inputWithcheck">
                                    <input class="form-control" type="text" name="order_memo" value="배송 빠르게 부탁드립니다." placeholder="요청사항을 입력해주세요." required>
                                    <span class="fas fa-check"></span>
    
                                </div>
                            <div class="paymentBox1">
                                <p class="dis fw-bold mb-2">Payment</p>
                                <div class="paymentBox">
                                    <div>
                                    <input id="kpay" type="radio" name="order_payment" value="bank" onclick="changePaymentFunction(requestPayini)">
                                    <label for="kpay">이니시스</label>
                                </div>
                                <div>
                                    <input id="kakao" type="radio" name="order_payment" value="kakao"  onclick="changePaymentFunction(requestPay)">
                                    <label for="kakao">카카오페이</label>
                                </div>
                                <div>
                                    <input id="naver" type="radio" name="order_payment" value="naver" onclick="changePaymentFunction(requestPayCO)">
                                    <label for="naver">페이코</label>
                                </div>
                                <div>
                                    <input id="credit" type="radio" name="order_payment" value="credit" checked >
                                    <label for="credit">신용카드</label>
                                </div>
                                <div>
                                    <input id="bank" type="radio" name="order_payment" value="bank" >
                                    <label for="bank">무통장입금</label>
                                </div>
                                <div>
                                    <input id="toss" type="radio" name="order_payment" value="toss"  onclick="changePaymentFunction(requestPaytoss)">
                                    <label for="toss">토스 Pay</label>
                                </div>
                                </div>
                                <div id="cardBox">
                                <p class="dis fw-bold mb-2">Credit Card</p>
                                <div class="d-flex align-items-center justify-content-between card-atm border rounded">
                                    <div class="fab fa-cc-visa ps-3"></div>
                                    <input type="text" class="form-control" placeholder="Card Details">
                                    <div class="d-flex w-50">
                                        <input type="text" class="form-control px-0" placeholder="MM/YY" maxlength="4">
                                        <input type="text" maxlength=3 class="form-control px-0" placeholder="CVV" maxlength="3">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class=" my-3">
                            <p class="dis fw-bold mb-2">적립금 사용 ( 사용가능 : ${memInfo.buyPoint} )</p>
                            <div class="inputWithcheck">
                                <input class="form-control" type="number" id="buyPoint_input" name="order_buyPoint1" value="" placeholder="현재 적립금:${memInfo.buyPoint}" oninput="if(this.value > ${memInfo.buyPoint}) this.value = ${memInfo.buyPoint}; calculateTotalPrice(this.value);">
                            <fmt:formatNumber type="number" value="${goodsInfo.goods_price*0.9*0.05*goods_qty}"  pattern="#0" var="buyPoint_reward"/>

                                <input type="hidden" name="buyPoint" id="remainingPoint" value="${memInfo.buyPoint}">
                                <input type="hidden" name="buyPoint_reward" id="buyPoint_reward1" value="${buyPoint_reward}">
                                <span class="fas fa-check"></span>

                            </div>
                        <div class="d-flex flex-column dis">
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p>상품가격</p>
                                <p style="text-decoration: line-through;"><span id="total_price_dis"><fmt:formatNumber type="number"  value="${goodsInfo.goods_price}" /></span><span class="fas fa-won-sign"></span></p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p>할인<span>(10%)</span></p>
                                <p>-<span id="dis_price"><fmt:formatNumber type="number"  value="${goodsInfo.goods_price*0.1}" ></fmt:formatNumber></span><span class="fas fa-won-sign"></span></p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p>적립금사용<span></span></p>
                                <p>-<span id="buyPoint"></span><span class="fas fa-won-sign"></span></p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p>결제 적립금<span>(결제금액의 5% 적립)</span></p>
                                <p>+<span id="buyPoint_reward"><fmt:formatNumber type="number" value="${goodsInfo.goods_price*0.9*0.05*goods_qty}" /></span><span class="fas fa-won-sign"></span></p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p class="fw-bold">Total</p>
                                <p class="fw-bold"><span id="total_price"><fmt:formatNumber type="number" value="${goodsInfo.goods_price*0.9*goods_qty}"/></span> <span class="fas fa-won-sign"></span> </p>
                            <fmt:formatNumber type="number" value="${goodsInfo.goods_price*0.9*goods_qty}"  pattern="#0" var="total_sales_price"/>
                        </div>
                        <input type="hidden" name="shop_code" id="shop_code" value="${goodsInfo.shop_code}">
                            <input type="hidden" name="order_price" id="order_price" value="${total_sales_price}">
                            <button class="btn btn-primary mt-2" type="button" onclick="submit();" id="payButton">Pay (결제하기) </button>
                            <button class="btn btn-primary mt-2" type="button" onclick="back(this.form);">돌아가기 </button>

                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div>
</div>
<style>
 
</style>
<link rel="stylesheet" type="text/css" href="https://codepen.io/imgix/pen/d06269809bb83c85326ebbbf7e81241b.css">
<link rel="stylesheet" type="text/css" href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/164071/drift-basic.css">
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/164071/Drift.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- jQuery --> 
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> 
	<!-- iamport.payment.js --> 
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
 
<script>
      var payButton = document.getElementById("payButton");

function changePaymentFunction(paymentFunction) {
    if (!paymentFunction) {
        payButton.onclick = function() {
            document.getElementById("paymentForm").submit();
        };
    } else {
        payButton.onclick = paymentFunction;
    }
}

 function requestPay() {
    var IMP = window.IMP;
    IMP.init("imp36825135");  // 가맹점식별코드를 여기에 작성해주세요

    var name = document.getElementsByName('name')[0].value;
    var email = document.getElementsByName('email')[0].value;
    var zipcode = document.getElementsByName('zipcode')[0].value;
    var order_call_num = document.getElementsByName('order_call_num')[0].value;
    var roadAddress = document.getElementsByName('roadAddress')[0].value;
    var order_price = document.getElementsByName('order_price')[0].value;
    var timestamp = new Date().getTime(); // 현재 시간을 밀리초로 나타내는 고유한 값으로 활용
    var randomNum = Math.floor(Math.random() * 100000); // 0부터 99999까지의 임의의 숫자

    var merchant_uid = timestamp.toString() + randomNum.toString(); // 시간과 임의의 숫자를 조합하여 주문 번호 생성

    IMP.request_pay({
        pg: "kakaopay.TC0ONETIME",
        pay_method: "card",
        merchant_uid: merchant_uid,
        name: "${goodsInfo.goods_name}",
        amount: order_price,
        buyer_email: email,
        buyer_name: name,
        buyer_tel: order_call_num,
        buyer_addr: roadAddress,
        buyer_postcode: zipcode
    }, function (rsp) {
        if (rsp.success) {
            alert("결제가 완료되었습니다.");
            // 결제 완료 후 처리할 내용을 여기에 작성해주세요
            document.getElementById("paymentForm").submit();
        } else {
            var msg = "결제되었습니다. 상품:${goodsInfo.goods_name} 가격:"+order_price;
            msg  ;
            alert(msg);
            document.getElementById("paymentForm").submit();
        }
    });
}
function requestPayini() {
    var IMP = window.IMP;
    IMP.init("imp36825135");  // 가맹점식별코드를 여기에 작성해주세요

    var name = document.getElementsByName('name')[0].value;
    var email = document.getElementsByName('email')[0].value;
    var zipcode = document.getElementsByName('zipcode')[0].value;
    var order_call_num = document.getElementsByName('order_call_num')[0].value;
    var roadAddress = document.getElementsByName('roadAddress')[0].value;
    var order_price = document.getElementsByName('order_price')[0].value;
    var timestamp = new Date().getTime(); // 현재 시간을 밀리초로 나타내는 고유한 값으로 활용
    var randomNum = Math.floor(Math.random() * 100000); // 0부터 99999까지의 임의의 숫자

    var merchant_uid = timestamp.toString() + randomNum.toString(); // 시간과 임의의 숫자를 조합하여 주문 번호 생성

    IMP.request_pay({
        pg: "html5_inicis.INIBillTst",
        pay_method: "card",
        merchant_uid: merchant_uid,
        name: "${goodsInfo.goods_name}",
        amount: order_price,
        buyer_email: email,
        buyer_name: name,
        buyer_tel: order_call_num,
        buyer_addr: roadAddress,
        buyer_postcode: zipcode
    }, function (rsp) {
        if (rsp.success) {
            alert("결제되었습니다. 상품:${goodsInfo.goods_name} 가격:"+order_price);
            // 결제 완료 후 처리할 내용을 여기에 작성해주세요
            document.getElementById("paymentForm").submit();
        } else {
            var msg = "결제취소되셨습니다.";
            msg += "에러 내용: " + rsp.error_msg;
            alert(msg);
        }
    });
}
function requestPaytoss() {
    var IMP = window.IMP;
    IMP.init("imp36825135");  // 가맹점식별코드를 여기에 작성해주세요

    var name = document.getElementsByName('name')[0].value;
    var email = document.getElementsByName('email')[0].value;
    var zipcode = document.getElementsByName('zipcode')[0].value;
    var order_call_num = document.getElementsByName('order_call_num')[0].value;
    var roadAddress = document.getElementsByName('roadAddress')[0].value;
    var order_price = document.getElementsByName('order_price')[0].value;
    var timestamp = new Date().getTime(); // 현재 시간을 밀리초로 나타내는 고유한 값으로 활용
    var randomNum = Math.floor(Math.random() * 100000); // 0부터 99999까지의 임의의 숫자

    var merchant_uid = timestamp.toString() + randomNum.toString(); // 시간과 임의의 숫자를 조합하여 주문 번호 생성

    IMP.request_pay({
        pg: "uplus.tlgdacomxpay",
        pay_method: "card",
        merchant_uid: merchant_uid,
        name: "${goodsInfo.goods_name}",
        amount: order_price,
        buyer_email: email,
        buyer_name: name,
        buyer_tel: order_call_num,
        buyer_addr: roadAddress,
        buyer_postcode: zipcode
    }, function (rsp) {
        if (rsp.success) {
            alert("결제가 완료되었습니다.");
            // 결제 완료 후 처리할 내용을 여기에 작성해주세요
            document.getElementById("paymentForm").submit();
        } else {
            var msg = "결제취소되셨습니다.";
            msg += "에러 내용: " + rsp.error_msg;
            alert(msg);
        }
    });
}
function requestPayCO() {
    var IMP = window.IMP;
    IMP.init("imp36825135");  // 가맹점식별코드를 여기에 작성해주세요

    var name = document.getElementsByName('name')[0].value;
    var email = document.getElementsByName('email')[0].value;
    var zipcode = document.getElementsByName('zipcode')[0].value;
    var order_call_num = document.getElementsByName('order_call_num')[0].value;
    var roadAddress = document.getElementsByName('roadAddress')[0].value;
    var order_price = document.getElementsByName('order_price')[0].value;
    var timestamp = new Date().getTime(); // 현재 시간을 밀리초로 나타내는 고유한 값으로 활용
    var randomNum = Math.floor(Math.random() * 100000); // 0부터 99999까지의 임의의 숫자

    var merchant_uid = timestamp.toString() + randomNum.toString(); // 시간과 임의의 숫자를 조합하여 주문 번호 생성

    IMP.request_pay({
        pg: "payco.AUTOPAY",
        pay_method: "card",
        merchant_uid: merchant_uid,
        name: "${goodsInfo.goods_name}",
        amount: order_price,
        buyer_email: email,
        buyer_name: name,
        buyer_tel: order_call_num,
        buyer_addr: roadAddress,
        buyer_postcode: zipcode
    }, function (rsp) {
        if (rsp.success) {
            alert("결제가 완료되었습니다.");
            // 결제 완료 후 처리할 내용을 여기에 작성해주세요
            document.getElementById("paymentForm").submit();
        } else {
            var msg = "결제취소되셨습니다.";
            msg += "에러 내용: " + rsp.error_msg;
            alert(msg);
        }
    });
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
  function back(obj){
		obj.action = "${contextPath}/goods/goodsDetail.do?goods_code=${goodsInfo.goods_code}";
		obj.submit();
	}
    var totalPrice = 0;
    let goodsPrice = "${goodsInfo.goods_price*0.9}";
    function updatePrice() {
        var goodsQty = document.getElementsByName("goods_qty")[0].value;
        var buyPoint = document.getElementById("buyPoint_input").value;
        var buyPoint_reward1 = goodsQty * "${goodsInfo.goods_price*0.9*0.05}";
        var buyPoint_reward = buyPoint_reward1.toLocaleString();
        var dis_price = goodsQty * "${goodsInfo.goods_price*0.1}";
         totalPrice = parseInt(goodsQty * goodsPrice - buyPoint);
        var totalPrice_dis = goodsQty * "${goodsInfo.goods_price}";
        var formattedPrice1 = totalPrice_dis.toLocaleString(); // 쉼표로 구분된 형식으로 변환
        var formattedPrice2 = dis_price.toLocaleString(); // 쉼표로 구분된 형식으로 변환
        var formattedPrice = totalPrice.toLocaleString().split(".")[0]; // 쉼표로 구분된 형식으로 변환
        var formattedPrice11 = totalPrice; // 최종
        document.getElementById("total_price").innerText = formattedPrice;
        document.getElementById("total_price_dis").innerText = formattedPrice1;
        document.getElementById("buyPoint_reward").innerText = buyPoint_reward;
        document.getElementById("buyPoint_reward1").value = buyPoint_reward1;
        document.getElementById("dis_price").innerText = formattedPrice2;
        document.getElementById("order_price").value = formattedPrice11;
    }

  
    function calculateTotalPrice(buyPoint) {
        var goodsQty = document.getElementsByName("goods_qty")[0].value;
        var totalPrice = parseInt(goodsQty * goodsPrice - buyPoint);
        var remainingPoint = ${member.buyPoint} - buyPoint;
        var formattedPrice = totalPrice.toLocaleString().split(".")[0];
        var formattedPrice11 = totalPrice; // 최종
        document.getElementById("total_price").innerText = formattedPrice;
        document.getElementById("buyPoint").innerText = buyPoint;
        document.getElementById("order_price").value = formattedPrice11;
        document.getElementById("remainingPoint").value = remainingPoint;
    }

    var paymentRadios = document.getElementsByName("order_payment");
    var cardBox = document.getElementById("cardBox");

    for (var i = 0; i < paymentRadios.length; i++) {
        paymentRadios[i].addEventListener("change", function() {
            if (this.value === "credit") {
                cardBox.style.display = "block"; // 신용카드 선택 시 cardBox 표시
            } else {
                cardBox.style.display = "none"; // 다른 결제 방법 선택 시 cardBox 숨김
            }
        });
    }
      </script>
    
</body>
</html>