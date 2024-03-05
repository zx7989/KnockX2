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

body {
  font-weight: 300;
}




.yellow { color: #0a0a00; 
	border-bottom: 3px solid;
	width: 100%;
}

.container th h1 {
	  font-weight: bold;
	  font-size: 1em;
  text-align: left;
  color: #185875;
}

.container td {
	  font-weight: normal;
	  font-size: 1em;
  -webkit-box-shadow: 0 2px 2px -2px #0E1119;
	   -moz-box-shadow: 0 2px 2px -2px #0E1119;
	        box-shadow: 0 2px 2px -2px #0E1119;
}

.container {
	  text-align: left;
	  overflow: hidden;
	  width: 100%;
	  margin: 0 auto;
  display: table;
  padding: 0 0 0 0;
  border-collapse: collapse;
  border:0px solid;
  border-bottom:3px solid rgb(212, 212, 212);
}

.container td, .container th {
	  padding:2px;
}

/* Background-color of the odd rows */
.container tr:nth-child(odd) {
	  background-color: rgb(236, 236, 236);
}

/* Background-color of the even rows */
.container tr:nth-child(even) {
	  background-color: #c4c4c4;
}

.container th {
	  background-color: #1F2739;
}


.container tr:hover {
   background-color: #84adff;
-webkit-box-shadow: 0 6px 6px -6px #0E1119;
	   -moz-box-shadow: 0 6px 6px -6px #0E1119;
	        box-shadow: 0 6px 6px -6px #0E1119;
}

.container td:hover {
  background-color: #FFF842;
  color: #403E10;
  font-weight: bold;
  
  box-shadow: #7F7C21 -1px 1px, #7F7C21 -2px 2px, #7F7C21 -3px 3px, #7F7C21 -4px 4px, #7F7C21 -5px 5px, #7F7C21 -6px 6px;
  transform: translate3d(6px, -6px, 0);
  
  transition-delay: 0s;
	  transition-duration: 0.4s;
	  transition-property: all;
  transition-timing-function: line;
}

@media (max-width: 800px) {
.container td:nth-child(4),
.container th:nth-child(4) { display: none; }
}

.table1 td{

	color:rgb(78, 78, 78);
	font-weight: bold;
}


.tabletd1{
	
	img{
		width: 50px;
		border-radius: 50%;
	}
}

.product-card {
    width: 18%;
    position: relative;
    box-shadow: 0 2px 7px #c4c4c4;
    margin: 10px;
    background: #fafafa;
	padding:0;
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
    top: 20px;
    text-transform: uppercase;
    font-size: 13px;
    font-weight: 700;
    background: rgb(0, 8, 240);
    color: #fff;
    padding: 3px 10px;
}

.product-tumb {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 150px;
    padding: 20px;
    background: #4294ff;
}

.product-tumb img {
    max-width: 100%;
    max-height: 100%;
	border-radius: 20px;
}

.product-details {
    padding: 7px;
}

.product-catagory {
    display: block;
    font-size: 15px;
    font-weight: 4x00;
    text-transform: uppercase;
    color: rgb(153, 153, 153);
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

.product-bottom-details div {
    float: left;
    width: 50%;
}

.product-price {
    font-size: 18px;
    color: #fb2c2c;
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
.shops01{
	display: flex;
	flex-wrap: wrap;
	justify-content: center;

}

</style>
</head>
<body>
	
	<h1><span class="yellow">제휴 사업자 목록
	</span></h1>
	<div class="shops01">
	<c:forEach var="mem" items="${shopsList}">
	<div class="product-card">
		<div class="badge">제휴업체</div>
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
			<span class="product-catagory">대표:${mem.name }</span>
			<a href="${contextPath }/admin/myPage/myPageMainForm.do?id=${mem.id}&memberSort=shop&shop_code=${mem.shopVO.shop_code}">${mem.shopVO.shop_name}</a>
			<p>사업자등록번호<br>${mem.shopVO.shop_num}</p>
			<div class="product-bottom-details">
				<div class="product-price"><small>판매누적금액</small>${mem.shopVO.shopTotalPrice}</div>
				<div class="product-links">
					<a href=""><i class="fa fa-heart"></i></a>
					<a href=""><i class="fa fa-shopping-cart"></i></a>
				</div>
			</div>
		</div>
	</div>
</c:forEach></div>
	<table class="container" align="center" border="1" align="center">
		<tr align="center" bgcolor="#616161" style="color:white; background-color: #3d3d3d;">
			<td width="2%" >프로필</td>
			<td width="5%">아이디<br>(상세보기)</td>
			<td width="5%">비밀번호</td>
			<td width="5%">이름 </td>
			<td width="5%">이메일</td>
			<td width="5%">가입일</td>
			<td width="5%">수정</td>
			<td width="5%">삭제</td>
		</tr>
	
			<c:forEach var="mem" items="${shopsList}">
				
			<tr class="table1" align="center">
				<td class="tabletd1"><c:choose>
					<c:when test="${mem.imageFN == null}">
					  <img  src="${contextPath}/resources/image/profile.png" id="preview"  width=400/>
					  
					</c:when>
					<c:when test="${mem.imageFN != null}">
					  <img src="${contextPath}/download1.do?id=
							${mem.id}&imageFN=${mem.imageFN}" id="preview"  width=400/>
					</c:when>
			  </c:choose></td>
			  <td><a href="${contextPath}/admin/myPage/myPageMainForm.do?id=${mem.id}&memberSort=shop&shop_code=${mem.shopVO.shop_code}"
				>${mem.id}</a>
				</td>
				
				<td>${mem.pwd }</td>
				<td>${mem.name }</td>
				<td>${mem.email }</td>
				<td>${mem.joinDate }</td>
				<td><a href="${contextPath}/admin/myPage/modMemberForm.do?id=${mem.id}&memberSort=${mem.memberSort}" style="color:#FB667A">수정</a></td>
				<td><a onclick="return delOk();" href="${contextPath }/member/removeMember.do?id=${mem.id}&memberSort=shop" style="color:rgb(255, 54, 54)">삭제</a></td>
			</tr>
			</c:forEach>
		</table>
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
		<div class="pageNum01">
	<!-- 이전 페이지 링크 -->
<c:if test="${currentPage > 1}">
    <a href="${contextPath}/member/listShops.do?pageNum=${currentPage - 1}">이전 페이지</a>
</c:if>

<!-- 페이지 번호 링크 -->
<c:forEach begin="1" end="${totalPage}" var="pageNum">
    <c:choose>
        <c:when test="${pageNum == currentPage}">
            <strong style="color:red; background-color: white; border:3px solid tomato;">${pageNum}</strong>
        </c:when>
        <c:otherwise>
            <a href="${contextPath}/member/listShops.do?pageNum=${pageNum}">${pageNum}</a>
        </c:otherwise>
    </c:choose>
</c:forEach>

<!-- 다음 페이지 링크 -->
<c:if test="${currentPage < totalPage}">
    <a href="${contextPath}/member/listShops.do?pageNum=${currentPage + 1}">다음 페이지</a>
</c:if>
</div>
		<a href="${contextPath }/main.do"><p class="cls1">메인홈페이지로 가기</p></a>
		
		<script>
			function delOk(){
				if(!confirm('삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까??')){
					return false;
				}else{
				}
			}
			</script>
</body>
</html>