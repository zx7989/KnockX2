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
    width: 380px;
    position: relative;
    box-shadow: 0 2px 7px #dfdfdf;
    margin: 20px auto;
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
    height: 300px;
    padding: 50px;
    background: #f0f0f0;
}

.product-tumb img {
    max-width: 100%;
    max-height: 100%;
}

.product-details {
    padding: 30px;
}

.product-catagory {
    display: block;
    font-size: 12px;
    font-weight: 700;
    text-transform: uppercase;
    color: #ccc;
    margin-bottom: 18px;
}

.product-details h4 a {
    font-weight: 500;
    display: block;
    margin-bottom: 18px;
    text-transform: uppercase;
    color: #363636;
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
    border-top: 1px solid #eee;
    padding-top: 20px;
}

.product-bottom-details div {
    float: left;
    width: 50%;
}

.product-price {
    font-size: 18px;
    color: #fbb72c;
    font-weight: 600;
}

.product-price small {
    font-size: 80%;
    font-weight: 400;
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
	}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	
	<div class="card01">
    <div class="product-card">
		<div class="badge">Hot</div>
		<div class="product-tumb">
			<img src="${contextPath}/resources/image/phone2.png" alt="">
		</div>
		<div class="product-details">
			<span class="product-catagory">Women,bag</span>
			<h4><a href="">Women leather bag</a></h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero, possimus nostrum!</p>
			<div class="product-bottom-details">
				<div class="product-price"><small>$96.00</small>$230.99</div>
				<div class="product-links">
					<a href=""><i class="fa fa-heart"></i></a>
					<a href=""><i class="fa fa-shopping-cart"></i></a>
				</div>
			</div>
		</div>
	</div>
    <div class="product-card">
		<div class="badge">Hot</div>
		<div class="product-tumb">
			<img src="${contextPath}/resources/image/phone2.png" alt="">
		</div>
		<div class="product-details">
			<span class="product-catagory">Women,bag</span>
			<h4><a href="">Women leather bag</a></h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero, possimus nostrum!</p>
			<div class="product-bottom-details">
				<div class="product-price"><small>$96.00</small>$230.99</div>
				<div class="product-links">
					<a href=""><i class="fa fa-heart"></i></a>
					<a href=""><i class="fa fa-shopping-cart"></i></a>
				</div>
			</div>
		</div>
	</div>
    <div class="product-card">
		<div class="badge">Hot</div>
		<div class="product-tumb">
			<img src="${contextPath}/resources/image/phone2.png" alt="">
		</div>
		<div class="product-details">
			<span class="product-catagory">Women,bag</span>
			<h4><a href="">Women leather bag</a></h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero, possimus nostrum!</p>
			<div class="product-bottom-details">
				<div class="product-price"><small>$96.00</small>$230.99</div>
				<div class="product-links">
					<a href=""><i class="fa fa-heart"></i></a>
					<a href=""><i class="fa fa-shopping-cart"></i></a>
				</div>
			</div>
		</div>
	</div>
    <div class="product-card">
		<div class="badge">Hot</div>
		<div class="product-tumb">
			<img src="${contextPath}/resources/image/phone2.png" alt="">
		</div>
		<div class="product-details">
			<span class="product-catagory">Women,bag</span>
			<h4><a href="">Women leather bag</a></h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero, possimus nostrum!</p>
			<div class="product-bottom-details">
				<div class="product-price"><small>$96.00</small>$230.99</div>
				<div class="product-links">
					<a href=""><i class="fa fa-heart"></i></a>
					<a href=""><i class="fa fa-shopping-cart"></i></a>
				</div>
			</div>
		</div>
	</div>
    <div class="product-card">
		<div class="badge">Hot</div>
		<div class="product-tumb">
			<img src="${contextPath}/resources/image/phone2.png" alt="">
		</div>
		<div class="product-details">
			<span class="product-catagory">Women,bag</span>
			<h4><a href="">Women leather bag</a></h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero, possimus nostrum!</p>
			<div class="product-bottom-details">
				<div class="product-price"><small>$96.00</small>$230.99</div>
				<div class="product-links">
					<a href=""><i class="fa fa-heart"></i></a>
					<a href=""><i class="fa fa-shopping-cart"></i></a>
				</div>
			</div>
		</div>
	</div>
    <div class="product-card">
		<div class="badge">Hot</div>
		<div class="product-tumb">
			<img src="${contextPath}/resources/image/phone2.png" alt="">
		</div>
		<div class="product-details">
			<span class="product-catagory">Women,bag</span>
			<h4><a href="">Women leather bag</a></h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero, possimus nostrum!</p>
			<div class="product-bottom-details">
				<div class="product-price"><small>$96.00</small>$230.99</div>
				<div class="product-links">
					<a href=""><i class="fa fa-heart"></i></a>
					<a href=""><i class="fa fa-shopping-cart"></i></a>
				</div>
			</div>
		</div>
	</div>
    <div class="product-card">
		<div class="badge">Hot</div>
		<div class="product-tumb">
			<img src="${contextPath}/resources/image/phone2.png" alt="">
		</div>
		<div class="product-details">
			<span class="product-catagory">Women,bag</span>
			<h4><a href="">Women leather bag</a></h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero, possimus nostrum!</p>
			<div class="product-bottom-details">
				<div class="product-price"><small>$96.00</small>$230.99</div>
				<div class="product-links">
					<a href=""><i class="fa fa-heart"></i></a>
					<a href=""><i class="fa fa-shopping-cart"></i></a>
				</div>
			</div>
		</div>
	</div>
</div>
	
</body>
</html>