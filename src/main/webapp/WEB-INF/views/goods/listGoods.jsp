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
    @import url('https://fonts.googleapis.com/css?family=Roboto:400,500,700');
*
{
    -webkit-box-sizing: border-box;
            box-sizing: border-box;
  
}
#content{
    flex-direction: row;
    flex-wrap: wrap;
    padding:3px;
}

body
{
    font-family: 'Roboto', sans-serif;
}
a
{
    text-decoration: none;
}
.product-card {
    width: 18%;
    position: relative;
    box-shadow: 0 2px 7px #3d3d3d;
    margin: 10px;
    background: #fafafa;
    transform: scale(1.0);
}
.product-card:hover{
    background-color: rgb(238, 238, 238);
    transform: scale(1.05);
    transition: 0.5s ease-out;
}

.badge {
    position: absolute;
    left: 0;
    top: 20px;
    text-transform: uppercase;
    font-size: 13px;
    font-weight: 700;
    background: red;
    color: #fff;
    padding: 3px 10px;
}

.product-tumb {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 200px;
    padding: 10px;
    background: #f0f0f0;
}

.product-tumb img {
    max-width: 100%;
    max-height: 100%;
	border-radius: 10%;
}

.product-details {
    padding: 10px;
	display: flex;
	flex-direction: column;
}

.product-catagory {
    display: block;
    font-size: 16px;
    font-weight: 700;
    text-transform: uppercase;
    color: rgb(29, 153, 255);
    margin-bottom: 18px;
}

.product-details a {
    display: block;
    font-weight: bold;
    text-transform: uppercase;
    color: #3f3f3f;
    font-size: 20px;
    text-decoration: none;
    transition: 0.3s;
}

.product-details h4 a:hover {
    color: #fbb72c;
}

.product-details p {
    font-size: 15px;
    line-height: 22px;
    margin-bottom: 18px;
    color: #999;
}

.product-bottom-details {
    overflow: hidden;
    border-top: 0px solid #eee;
    padding-top: 10px;
    width:100%;
    margin:0 auto;

}

.product-bottom-details div {
    float: left;
    width: 50%;
}

.product-price {
	width:20%;
    font-size: 20px;
    color: #006ce7;
    font-weight: 600;
	text-wrap: nowrap;
}

.product-price small {
    font-size: 70%;
    font-weight: 600;
    color:rgb(255, 57, 31);
    display: inline-block;
}

.product-links {
    text-align: right;
    
}

.product-links a {
    display: inline-block;
    margin-left: 5px;
    color: #9c9c9c;
    transition: 0.3s;
    font-size: 20px;
}

.product-links a:hover {
    color: #fbb72c;
}
.main6{
        position: relative;
        height:500px;
		margin:0 auto;
        background: rgb(252, 252, 252); 
        border-top: 1px solid #616161;
        border-bottom: 1px solid #616161;

    }
    .main6_1{
        position: absolute; top:10%;
        width:300px;
        height: 200px;
        border: 2px solid;
    }
	.card01{
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		justify-content:center;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<div class="card01">
	<c:forEach var="goods" items="${goodsList}">
    <div class="product-card">
		<div class="badge">HOT</div>
		<div class="product-tumb">
           
			<c:choose>
		<c:when test="${goods.goods_img1 == null}">
		  <img  src="${contextPath}/resources/image/profile.png" id="preview"  width=200/>
		  
		</c:when>
		<c:when test="${goods.goods_img1 != null}">
		  <img src="${contextPath}/download2.do?goods_code=
				${goods.goods_code}&goods_img1=${goods.goods_img1}" id="preview"  width=200/>
		</c:when>
  </c:choose>
		</div>
		<div class="product-details">
			<span class="product-catagory">
                <span style="color:tomato; background-color: rgb(255, 226, 226); padding:0 10px;"><span style="font-size: 25px; margin:0;  color:#ff6363;">${goods.total_sell_count}</span>개 판매됐어요!</span><br>${goods.goods_type}</span>
			<a href="${contextPath}/goods/goodsDetail.do?goods_code=${goods.goods_code}">${goods.goods_name}</a>
			<p>${goods.goods_volume}</p>
			<div class="product-bottom-details">
				<div class="product-price"><small>스마트몰 최저가</small><br> <fmt:formatNumber type="number"  value="${goods.goods_price*0.9}" />
					원</div>
				<div class="product-links">
                    
					<a href=""><i class="fa fa-heart"></i></a>
					<a href=""><i class="fa fa-shopping-cart"></i></a>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
</div>

</body>
</html>