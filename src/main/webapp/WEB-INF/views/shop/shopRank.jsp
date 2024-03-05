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
<title>회원 목록창</title>
<style>
/*	
	Table Responsive
	===================
	Author: https://github.com/pablorgarcia
 */

 @charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700);



.product-card {
    border:10px solid;
    padding:10px;
    max-width: 230px;
    width: 18%;
    position: relative;
    box-shadow: 0 2px 7px #424242;
    margin: 50px;
    background: #e4f4ff;
	border-radius: 30px 0;
	flex-direction: row;
}
.product-card:hover{
    background-color: rgb(238, 238, 238);
    transform: scale(1.05);
    transition: 0.5s ease-out;
}

.badge {
    position: absolute;
    left: 0;
    top: -50px;
    text-transform: uppercase;
    font-size: 25px;
    font-weight: 700;
    background: rgb(240, 96, 0);
    color: #fff;
    padding: 3px 10px;
}
.badge1 {
    position: absolute;
    left: 0;
    top: -50px;
    text-transform: uppercase;
    font-size: 25px;
    font-weight: 700;
    background: rgb(0, 132, 240);
    color: #fff;
    padding: 3px 10px;
}
.product-tumb {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 180px;
    padding: 20px;
    background: linear-gradient(rgb(78, 169, 255),rgb(0, 45, 104));
}

.product-tumb img {
    max-width: 100%;
    max-height: 100%;
	border-radius: 30%;
    box-shadow: 1px 1px 10px rgb(212, 0, 0);
}

.product-details {
    padding: 7px;
}

.product-catagory {
    display: block;
    font-size: 16px;
    line-height: 10px;
    font-weight: bold;
    font-weight: 4x00;
    text-transform: uppercase;
    color: rgb(94, 94, 94);
    margin-bottom: 8px;
}

.product-details a {
    font-weight: 800;
	font-size: 24px;
    display: block;
    margin-bottom: 8px;
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
    margin-bottom: 8px;
    color: #999;
}

.product-bottom-details {
    overflow: hidden;
    border-top: 1px solid #eee;
    padding-top: 20px;
}


.product-price {
    font-size: 25px;
    color: rgb(255, 71, 71);
    font-weight: 600;
    display: flex;
    flex-direction: column;
}

.product-price small {
    font-size: 80%;
    font-weight: 800;
    color: #008d92;
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
.shops01{
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
    width: 103%;
}
.yellow{
    border-bottom: 3px solid #616161;
    background-color: #002e92;
        color: white;
        width: 95%;
        padding:0 20px;
        margin:0 auto;
  text-shadow: 0 0.1em 20px black, 0.05em -0.03em 0 black, 0.05em 0.005em 0 black, 0em 0.08em 0 black, 0.05em 0.08em 0 black, 0px -0.03em 0 black, -0.03em -0.03em 0 black, -0.03em 0.08em 0 black, -0.03em 0 0 black;
   
}

.shopTitle01 {
  background-image: linear-gradient(rgb(110, 173, 255), rgb(0, 15, 223));
  background-size: 100% 5px;
  background-repeat: no-repeat;
  background-position: 100% 0%;
   transition: background-size .7s, background-position .5s ease-in-out;
   width: fit-content;
   margin:0 auto;
}

.product-card:hover .shopTitle01 {
    color: rgb(250, 250, 250);
    padding:3px 50px;
    border: 3px solid rgb(24, 24, 24);
    border-radius: 10px;
    font-weight: 600;
    text-shadow: 0 0.1em 20px black, 0.05em -0.03em 0 black, 0.05em 0.005em 0 black, 0em 0.08em 0 black, 0.05em 0.08em 0 black, 0px -0.03em 0 black, -0.03em -0.03em 0 black, -0.03em 0.08em 0 black, -0.03em 0 0 black;
  background-size: 100% 100%;
  background-position: 0% 100%;
  transition: background-position .10s, background-size .10s ease-in-out,  padding .5s ease, border .2 ease-in-out;
}
</style>
</head>
<body>
	
	<h1 class="yellow"><span class="yellow">파워스토어
	</span></h1>
    <img style="margin:0 auto;" src="${contextPath}/resources/image/rank.png"  width=100%/>
    <div class="shops01">
	<c:forEach var="mem" items="${shopsList}" varStatus="RankNum" begin="0" end="2" >
       
    <div class="product-card">
        
		<div class="badge">${RankNum.count}등 축하합니다!<i class="material-symbols-outlined">celebration</i></div>
		<div class="product-tumb">
			<c:choose>
		<c:when test="${mem.imageFN == null}">
		  <img  src="${contextPath}/resources/image/profile.png" id="preview"  width=400/>
		  
		</c:when>
		<c:when test="${mem.imageFN != null}">
		  <img src="${contextPath}/download1.do?id=
				${mem.id}&imageFN=${mem.imageFN}" id="preview"  width=400/>
		</c:when>
  </c:choose>
		</div>
		<div class="product-details">
			<span class="product-catagory">대표:${mem.name}</span>
			<a class="shopTitle01" href="${contextPath}/shop/shopMain.do?shop_code=${mem.shopVO.shop_code}">${mem.shopVO.shop_name}</a>
			<div class="product-bottom-details">
                            
                            <div class="product-price"><small>판매누적금액</small><span style="text-wrap: nowrap;"><fmt:formatNumber type="number" value="${mem.shopVO.shopTotalPrice}"  pattern=""/>원</span></div>
			</div>
		</div>
	</div>
</c:forEach></div>
<div class="shops01">
	<c:forEach var="mem" items="${shopsList}" varStatus="RankNum" begin="3" end="5" >
       
    <div class="product-card">
        
		<div class="badge1">${RankNum.index+1}등 축하합니다!<i class="material-symbols-outlined">celebration</i></div>
		<div class="product-tumb">
			<c:choose>
		<c:when test="${mem.imageFN == null}">
		  <img  src="${contextPath}/resources/image/profile.png" id="preview"  width=400/>
		  
		</c:when>
		<c:when test="${mem.imageFN != null}">
		  <img src="${contextPath}/download1.do?id=
				${mem.id}&imageFN=${mem.imageFN}" id="preview"  width=400/>
		</c:when>
  </c:choose>
		</div>
		<div class="product-details">
			<span class="product-catagory">대표:${mem.name}</span>
			<a class="shopTitle01" href="${contextPath}/shop/shopMain.do?shop_code=${mem.shopVO.shop_code}">${mem.shopVO.shop_name}</a>
			<div class="product-bottom-details">
                            
                            <div class="product-price"><small>판매누적금액</small><span style="text-wrap: nowrap;"><fmt:formatNumber type="number" value="${mem.shopVO.shopTotalPrice}"  pattern=""/>원</span></div>
			</div>
		</div>
	</div>
</c:forEach></div>
<style>
    .pageNum01{
display: flex;
text-decoration: none;
justify-content: center;
margin:10px;
height: min-content;
*{
border-radius: 10px;
border:1px solid tomato;
margin:5px;
padding:2px 3px;
background-color: #ea6153;
color: white;
font-weight: 300;
font-size: 18px;
}
}
.pageNum01 *:hover{
background-color: #8a1204c4;
transition: 0.2s;
}
</style>
		<a href="${contextPath }/main.do"><p class="cls1">메인홈페이지로 가기</p></a>
		
		<script>
			function delOk(){
				if(!confirm('삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까??')){
					return false;
				}
			}
			</script>
</body>
</html>