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
    width: 20%;
    min-width: 250px;
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
	height:max-content;
}

.product-catagory {
    display: block;
    font-size: 16px;
    font-weight: 700;
    text-transform: uppercase;
    color: #0081fa;
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
    color: #3916ff;
    font-weight: 600;
	text-wrap: nowrap;
}

.product-price small {
    font-size: 80%;
    font-weight: 400;
    color:rgb(121, 121, 121);
    text-decoration: line-through;
    display: inline-block;
    margin-right: 5px;
}

.product-links {
    text-align: right;
}

.product-links a {
    display: inline-block;
    margin-left: 5px;
    color: #e1e1e1;
    transition: 0.3s;
    font-size: 17px;
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
		justify-content: space-evenly;
        margin:0 auto;
	}
    .card02{
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		justify-content: space-evenly;
        margin:0 auto;
	}
    .card03{
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		justify-content: space-evenly;
        margin:0 auto;
	}
    
    .title01{
        border-bottom: 5px solid #616161;
        width: max-content;
        text-align: left;
        border-left: 30px solid #616161;
        color: rgb(9, 77, 202);
        font-weight: bold;
    }
    .sortTitle01{
        font-weight: bold;
        margin:5px;
        font-size: 30px;
        border: 2px solid ;
        background-color: #3916ff;
        color: white;
  text-shadow: 0 0.1em 20px black, 0.05em -0.03em 0 black, 0.05em 0.005em 0 black, 0em 0.08em 0 black, 0.05em 0.08em 0 black, 0px -0.03em 0 black, -0.03em -0.03em 0 black, -0.03em 0.08em 0 black, -0.03em 0 0 black;
    }
    .colorBox01{
        display: flex;
        justify-content: center;

    }
    .colorName01{
        color:rgb(12, 12, 12) !important;
        margin: 0 5px;
        font-size: 13px;
    }
    
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
    <h1 class="title01">별도 케이스</h1>
 
<h2 class="sortTitle01">케이스</h1>
	<div class="card03">
        <c:choose>
            <c:when test="${shopCasesList[0] == null}">
                <style>.card03{flex-direction: column; justify-content: center; margin:0 auto;}</style>
            <h1>등록된 상품이 없습니다.</h1><br>
            <a href="${contextPath }/main.do"><p class="cls1">메인홈페이지로 가기</p></a>
        </c:when>
        <c:otherwise>
	<c:forEach var="goods" items="${shopCasesList}">
    <div class="product-card">
		<div class="badge">HOT</div>
		<div class="product-tumb">
			<c:choose>
		<c:when test="${goods.goods_img1 == null}">
		  <img  src="${contextPath}/resources/image/noImg1.jpg" id="preview"  width=200/>
		  
		</c:when>
		<c:when test="${goods.goods_img1 != null}">
		  <img src="${contextPath}/download2.do?goods_code=
				${goods.goods_code}&goods_img1=${goods.goods_img1}" id="preview"  width=200/>
		</c:when>
  </c:choose>
		</div>
		<div class="product-details">
			<span class="product-catagory">${goods.goods_type}</span>
			<a href="">${goods.goods_name}</a>
			<p>${goods.goods_volume}</p>
            <div class="colorBox01">
                <c:if test="${!goods.goodsColorVO.goods_color1.equals('null')}">
                   
    <c:if test="${goods.goodsColorVO.goods_color1 == 'black'}">
      <span class="colorName01">
        ${goods.goodsColorVO.goods_color1}<br><span style="background-color: black; border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
      </span>
    </c:if>
    <c:if test="${goods.goodsColorVO.goods_color2 == 'white'}">
      <span class="colorName01">
        ${goods.goodsColorVO.goods_color2}<br><span style="background-color: white; border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
      </span>
    </c:if>
    <c:if test="${goods.goodsColorVO.goods_color3 == 'silver'}">
        <span class="colorName01">
          ${goods.goodsColorVO.goods_color3}<br><span style="background-color: silver; border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
        </span>
      </c:if>
    <c:if test="${goods.goodsColorVO.goods_color4 == 'gold'}">
      <span class="colorName01">
        ${goods.goodsColorVO.goods_color4}<br><span style="background-color: gold; border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
      </span>
    </c:if>
    <c:if test="${goods.goodsColorVO.goods_color5 != 'null'}">
      <span class="colorName01">
        ${goods.goodsColorVO.goods_color1}<br><span style="background: linear-gradient(to right, red, green, blue); border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
      </span>
    </c:if>
    </c:if>
    
                </div>
			<div class="product-bottom-details">
				<div class="product-price"><small><fmt:formatNumber type="number"  value="${goods.goods_price}" />원</small><br> <fmt:formatNumber type="number"  value="${goods.goods_price*0.9}" />
					원</div>
				<div class="product-links">
					<a href=""><i class="fa fa-heart"></i></a>
					<a href=""><i class="fa fa-shopping-cart"></i></a>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
</c:otherwise>
</c:choose>
</div>
</body>
</html>