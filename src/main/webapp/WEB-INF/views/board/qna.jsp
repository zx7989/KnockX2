<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"
    import = "java.util.*,sec03.brd08.*"
    %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" ></c:set>
<c:set var="articlesList" value="${articlesMap.articlesList}" ></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<title>게시판</title>
<script>
$(function() {
  $(".qna-expand, .qna-expand-1, .qna-expand-2").on( "click", function() {
    $(this).next().slideToggle(200);
    $expand = $(this).find(">:first-child");
    
    if($expand.text() == "+") {
      $expand.text("-");
    } else {
      $expand.text("+");
    }
  });
});


$(document).ready(function() {
     
      $(".customer-qna").show();
      $(".customer-qna-1").hide();
	  $(".customer-qna-2").hide();
      
      $(".cat-qna1 a").on("click", function(e) {
        e.preventDefault();
        $(".customer-qna").show();
        $(".customer-qna-1").hide();
		$(".customer-qna-2").hide();
      });

      $(".cat-qna2 a").on("click", function(e) {
        e.preventDefault();
        $(".customer-qna").hide();
        $(".customer-qna-1").show();
		$(".customer-qna-2").hide();
      });

	  $(".cat-qna3 a").on("click", function(e) {
        e.preventDefault();
        $(".customer-qna").hide();
        $(".customer-qna-1").hide();
		$(".customer-qna-2").show();
      });

    });



</script>
<style>
*,
*:before,
*:after {
	-webkit-box-sizing: border-box; 
    -moz-box-sizing: border-box; 
    box-sizing: border-box;
}

#qna-integration-list {
    font-family: 'Open Sans', sans-serif;
    width: 80%;
    margin: 0 auto;
    display: table;
}
#qna-integration-list ul {
    padding: 0;
    margin: 20px 0 0 20px;
    color: #555;
}
#qna-integration-list ul > li {
    list-style: none;
    border-top: 1px solid #ddd;
    padding: 15px;
    overflow: hidden;
}

#qna-integration-list ul > li:hover {
    background: #efefef;
}
.qna-expand, .qna-expand-1, .qna-expand-2 {
    display: block;
    text-decoration: none;
    color: #555;
    cursor: pointer;
	text-align: left;
}
h2 {
    padding: 0;
    margin: 0;
    font-size: 17px;
    font-weight: 400;
}
span {
    font-size: 13.5px;
}

.qna-detail, .qna-detail-1, .qna-detail-2{
    margin: 10px 0 10px 0px;
    display: none;
    line-height: 22px;
	text-align: left;	
}
.qna-detail span, .qna-detail-1 span, .qna-detail-2 span{
    margin: 0;
}
div .qna-detail p, div .qna-detail-1 p, div .qna-detail-2 p{
	vertical-align: middle;
}
.qna-detail p, .qna-detail-1 p, .qna-detail-2 p{
    padding: 0 0 0 70px;
    display: inline-block;
    line-height: 22px;
	font-size: 14px;
}
.qna-right-arrow, .qna-right-arrow-1, .qna-right-arrow-2 {
    margin-top: 12px;
    margin-left: 20px;
    width: 10px;
    height: 100%;
    float: right;
    font-weight: bold;
    font-size: 20px;
}
.qna-title{
	font-size:22px;
	padding: 35px 0;
}
.qna-wrap{
	text-align: left;
	margin: 0 auto;
}
.qna-wrap ul{
	margin-left: 114px;
}
.qna-sort ul li{
	width:174px;	
	box-sizing: border-box;
	display: inline-block;
	border: 1px solid #dcdcdc;	
}
.qna-sort ul li a{
	display:block;
	text-align:center;
	font-size:15px;
	padding: 15px 0;
}
.qna-category-tab{
	display: block;
}
.qna-wrap{
	display: block;
	margin: auto 0;
}

.qna-category-tab ul{
	overflow: hidden;
	width:1000px;
	margin: 0 auto;
}
.qna-category-tab ul li{
	width:174px;	
	box-sizing: border-box;
	display: inline-block;
	border: 1px solid #dcdcdc;	
}
.qna-category-tab ul li a{
	display: block;
	padding: 0 25px;
	font-size: 15px;
	text-align: center;
}
.qna-num p, .qna-num-1 p, .qna-num-2 p{
	padding: 0 0 0 70px;
}
.customer-qna, .customer-qna-1, .customer-qna-2{
	padding: 0;
    border: 0;
    box-shadow: none;
    margin: 0 0 35px;
}
.qna-num .qna-num-1, .qna-num-2{
	font-size: 16px;
    top: 50%;
    left: 16px;
    color: #555;
    line-height: 60px;
}
.qna-answer, .qna-answer-1, .qna-answer-2{
	font-size: 16px;
    top: 50%;
    left: 16px;
    color: #555;
    line-height: 60px;	
}
.qna-ask, .qna-ask-1, .qna-ask-2{
	padding:0 0 0 70px;
	display: inline-block;
	line-height: 22px;
}
.cat-qna1,.cat-qna2,.cat-qna3{
	background-color: #f1f1f1;
}
.frq-qna{
	background-color: #555555;
}
.frq-qna a{
	color: white;
	font-weight: 800;
}
</style>
</head>
<body>
<div class="qna-title">
	<div class="qna-wrap">
		<span style="font-size: 30px; font-weight: 800;">고객센터</span><i class="fas material-symbols-outlined">arrow_forward_ios</i>
	</div>
</div>
<article class="qna-sort">
	<div class="qna-wrap">
		<ul>
			<li class="frq-qna">
				<a href="#">자주하는 질문</a>
			</li>
			<li class="1on1">
				<a href="${contextPath}/board/inquiry.do">문의사항</a>
			</li>
		</ul>
	</div>
</article>
	<div id="qna-integration-list">
		<article class="qna-category-tab">
			<div class="qna-wrap">
				<ul>
					<li class="cat-qna1">	
						<a href="#">신청/개통문의</a>
					</li>
					<li class="cat-qna2">
						<a href="#">배송문의</a>
					</li>
					<li class="cat-qna3">
						<a href="#">취소/반품문의</a>
					</li>
				</ul>
			</div>
		</article>
		<article class="customer-qna">
		<ul>
			<li>
				<a class="qna-expand">
					<div class="qna-right-arrow">+</div>
					<div>
						<span class="qna-num">Q</span>
						<h2 class="qna-ask">부모님(가족) 혹은 지인 대신 신청하려고 합니다 어떻게 하나요?</h2>
						
					</div>
				</a>
	
				<div class="qna-detail">
					<div>
					<span class="qna-answer">A</span>
						<p>접수는 부모님(가족), 혹은 지인분 명의로 하시고<br>
						추가연락처에 대신 신청해주시는분 번호 작성후 메모에 대신 신청하는거라고 말씀해주시면 추가연락처로 연락드려서 내용안내 해드릴 예정입니다.</p>
					</div>
				</div>
			</li>
			<li>
				<a class="qna-expand">
					<div class="qna-right-arrow">+</div>
					<div>
						<span class="qna-num">Q</span>
						<h2 class="qna-ask">개통은 어떻게 이루어지나요?</h2>					
					</div>
					
				</a>
	
				<div class="qna-detail">
					<div>
						<span class="qna-answer">A</span>
							<p>기기변경:기기수령후 바로 유심변경후 사용 가능<br>
							번호이동:기기수령후 담장자, 혹은 카카오톡 플러스친구로 개통요청-> 개통완료시 기존폰 사용불가-> 새휴대폰에 유심넣고 전원켜서 사용
							<br><br>
							※개통은 보통 평균적으로 당일 가능하나 , 개통이 밀려있는경우에는 다음날(평균 2~3일)로 넘어갈수있는 가능성은 참고 부탁드립니다.※</p>
					</div>
				</div>
			</li>
			<li>
				<a class="qna-expand">
					<div class="qna-right-arrow">+</div>
					<div>
						<span class="qna-num">Q</span>
						<h2 class="qna-ask">휴대폰 데이터 옮기는 방법</h2>
					</div>
				</a>
	
				<div class="qna-detail">
					<div>
						<span class="qna-answer">A</span>
							<p>▶ 새 휴대폰으로 정보 옮기는 방법 안내<br>

								- 안드로이드 https://blog.naver.com/dox1120?Redirect=Log&logNo=221583569039<br>
								<br>
								- 아이폰 https://blog.naver.com/gkrwja88/221688891047<br>
								<br>
								&nbsp;&nbsp;위 블로그 내용을 참고하셔서 정보를 옮기시면 됩니다.</p>
					</div>
				</div>
			</li>
			<li>
				<a class="qna-expand">
					<div class="qna-right-arrow">+</div>
					<div>
						<span class="qna-num">Q</span>
						<h2 class="qna-ask">공식신청서 작성시) 유심은 어떻게 체크해야 할까요?</h2>
					</div>
				</a>
	
				<div class="qna-detail">
					<div>
						<span class="qna-answer">A</span>
							<p>공식 신청서 작성시에 유심은 가입유형별 다릅니다.<br>

								<strong>1. 번호이동의 경우 ( = 새유심배송 / 신규유심구매 )</strong><br>
								
								기존통신사의 유심 사용이 불가하므로 이동하실 통신사의 새 유심을 사용하셔야 합니다. (유심비 7,700원 첫달 일회 부과)<br>
								
								<strong>2. 기기변경의 경우 ( = 기존유심사용 / 유심재사용 )</strong><br>
								
								통신비 절감을 위해서 고객님의 기존유심으로 개통을 진행해드립니다. 새휴대폰 수령전까지 기존휴대폰을 사용하실 수 있습니다.<br>
								
								혹여나 개통 후 기존 휴대폰이 끊어지시는 경우 전원만 2~3회 껏다 켰다 하시면 사용이 가능해지십니다.<br>
								
								그리고 새 휴대폰 수령후 유심만 이동하여 사용하시면 됩니다.</p>
					</div>
				</div>
			</li>
			<li>
				<a class="qna-expand">
					<div class="qna-right-arrow">+</div>
					<div>
						<span class="qna-num">Q</span>
						<h2 class="qna-ask">(공식신청서 작성시) 공식 신청서의 금액/색상이 다르게 나옵니다. 어떻게 해야 되나요?</h2>
					</div>
				</a>
	
				<div class="qna-detail">
					<div>
						<span class="qna-answer">A</span>
							<p>온라인 공식 신청서 상에는 월 예상 납부금액이 정상가로 표기 됩니다.<br>

								국민폰 특별할인은 개통시 적용이 되기 때문에 가격과 색상이 상이하더라도 <strong>홈페이지에서 고객님께서 신청하신 내용 그대로 금액/색상이 맞춰서 개통</strong>됩니다.<br>
									
								개통후 가입조건은 고객센터 혹은 통신사 어플을 통해 확인 가능합니다.</p>
					</div>
				</div>
			</li>
		</ul>
	</article>

	<article class="customer-qna-1">
		<ul>
			<li>
				<a class="qna-expand-1">
					<div class="qna-right-arrow-1">+</div>
					<div>
						<span class="qna-num-1">Q</span>
						<h2 class="qna-ask-1">배송은 몇시까지가 마감인가요?</h2>
					</div>
				</a>
				<div class="qna-detail-1">
					<div>
					<span class="qna-answer-1">A</span>
						<p>공식신청서 작성을 기준으로 하여 5시안에 작성이 완료가 되시면<br>
						당일 배송이 출발하여 다음날 휴대폰을 수령하실 수 있습니다.</p>
					</div>
				</div>
			</li>
			<li>
				<a class="qna-expand-1">
					<div class="qna-right-arrow-1">+</div>
					<div>
						<span class="qna-num-1">Q</span>
						<h2 class="qna-ask-1">당일수령(방문수령) 가능한가요?</h2>
					</div>
				</a>
				<div class="qna-detail-1">
					<div>
					<span class="qna-answer-1">A</span>
						<p>통신사 혹은 재고 유부 여부에 따라 나가는 지역이 다르다보니<br>
						접수주실때 당일수령 가능여부 말씀해주시면 방문가능여부,퀵가능여부 확인해서 연락드릴예정입니다. (퀵비는 본인부담입니다)</p>
					</div>
				</div>
			</li>
		</ul>
	</article>

	<article class="customer-qna-2">
		<ul>
			<li>
				<a class="qna-expand-2">
					<div class="qna-right-arrow-2">+</div>
					<div>
						<span class="qna-num-2">Q</span>
						<h2 class="qna-ask-2">제품불량시 교환안내</h2>
					</div>
				</a>
				<div class="qna-detail-2">
					<div>
					<span class="qna-answer-2">A</span>
						<p>교품증발급을 통한 교환은 개통일기준 14일 이내에만 가능합니다.14일 이후에는 단말기 제조사 서비스 센터 A/S규정에 따릅니다.<br>
						제조사 서비스센터에서 확인된불량에대해서만 교환 가능합니다.<br>
						삼성전자/엘지전자 제품 교품절차 : 제조사 서비스센터 방문 ▶ 불량 확인서 발급 ▶ 고객센터 교환요청 ▶ 교환(교품) 진행<br>
						Apple사 제품의 경우 대리점에서 교환은 불가능하오며, 새제품으로 교환을 원하실 경우 Apple A/S센터를 방문하시기 바랍니다.</p>
					</div>
				</div>
			</li>
			<li>
				<a class="qna-expand-2">
					<div class="qna-right-arrow-2">+</div>
					<div>
						<span class="qna-num-2">Q</span>
						<h2 class="qna-ask-2">취소안내</h2>
					</div>
				</a>
				<div class="qna-detail-2">
					<div style="display: flex; height:24px;">
					<span class="qna-answer-2">A</span>
						<p>주문취소는 상품이 배송전 또는 단말기 수령후 미개통이면서 미개봉 상태인 경우에만 가능합니다. 단말기개봉이 될 경우 반품이 불가하니 유의하시기 바랍니다.<br>
							회원의 상품중 배송이 불가능 사유(별도 휴대폰 정책축소 및 삭제, 단말기 재고소진등)가 발생할 경우, 전자상거래 등에서의 소비자 보호에 관한 법률 제 15조 2항에 의거하여 자동으로 취소될 수 있으며, 별도 유선 또는 SMS로 안내드리오니 양지 바랍니다.
							반품 단말기 회수는 접수 후 고객센터에서 지정된 택배사를 통해 요청합니다. (임의 발송 시 정상 처리되지 않을 수 있습니다 .)</p>
					</div>
				</div>
			</li>
		</ul>
	</article>
	</div>
</body>
</html>