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
<title>게시판</title>
<style>
#content {
		background-color: #ffffff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

table {
    width: 80%;
    border-collapse: collapse;
	opacity: 0.6;
	margin: 0 auto;
	
}
table tr:nth-child(odd) {
    background-color: #e3e3e3;
  }

.left {text-align: left;}
.right {  float: right;}
.center { text-align: center;}
.cls1:hover{
	text-decoration: underline;
	color:red;
	margin-top: 10px;
}
/* table tr:nth-child(odd):hover {
    background-color: rgba(255, 255, 0, 0.411);
  } */

a {
	color:black;
	text-decoration-line : none;
}

th {
	border-bottom: 1px solid black;
	padding: 10px;
	border-top: 3px solid rgb(77, 100, 122);
	
	
}

td {
	font-weight: 800;
	font-style:normal;
	color: black;
	border-bottom: 2px solid #d4d4d4;
    padding: 10px;
	text-align: center;
}



.cls1 {
	text-decoration: none;
	
}

.cls3 {
	width: 80px;
	height:31px;
	font-size:18px;
	text-align:center;
	margin-top: 15px;
	margin-right:140px;
	border-style: none;
	background-color: dodgerblue;
	color: white;
	border-radius: 5px;
	padding:1px 3px;
	float: right;
	
}
.cls3:hover{
	background-color: rgb(102, 123, 145);
	color: white;
	transition: 0.2s;
}

tbody {
	tr {		
		&:hover {
			background-color: rgb(176, 229, 236);
		}
		&:active{
			background-color: rgba(51, 51, 45, 0.267);
		}
		
		}
	}
.brd-notice{
	width: 75%;
	height: 150px;
	font-size: 18px;
	margin: 0 auto;
	position: relative;
    padding: 1.75rem 2rem;
    margin-top: 1rem;
    border: 1px solid #e0e0e0;
    background: #fff;
	
}
.brd-notice::after{
	height: 100%;
	vertical-align: middle;
}
.brd-notice img{
	float: left;	
	vertical-align:middle;

}
.list_st1{
	display: block;
	list-style-type: none;
	margin-left: 3.6rem;
	padding-left: 1.6rem;
}
.list_st1 li{
	display: list-item;
    text-align: left;
	padding-left: 4.6rem;
    color: #2b2828;
	
}

.brd-notice-txt{
    width: calc(100% - 50px);
}

.banner {
	height: 300px;
    background-image: url("${context}/resources/image/apple-brd-banner.png");
    background-size: cover; /* 이미지를 가능한 한 크게 확대하여 요소에 맞춥니다. */
    background-position: center; /* 이미지를 가운데로 정렬합니다. */
    background-repeat: no-repeat; /* 이미지 반복을 비활성화합니다. */
    display: flex; /* 텍스트를 가운데 정렬하기 위해 flexbox를 사용합니다. */
    align-items: center; /* 수직 중앙 정렬 */
    justify-content: center; /* 수평 중앙 정렬 */
    text-align: center; /* 텍스트를 수평 중앙 정렬 */
    height: 300px; /* 배경 이미지의 높이에 맞게 조정해주세요. */
	margin-bottom: 10px;
}

.banner h2 {
    color: white; /* 텍스트 색상 설정 */
    font-size: 40px; /* 텍스트 크기 설정 */
	font-weight: bold; /* 텍스트를 굵게 표시합니다. */
    line-height: 1.5; /* 텍스트의 행간을 설정합니다. */
	text-shadow: 0 0.1em 20px black, 0.05em -0.03em 0 black, 0.05em 0.005em 0 black, 0em 0.08em 0 black, 0.05em 0.08em 0 black, 0px -0.03em 0 black, -0.03em -0.03em 0 black, -0.03em 0.08em 0 black, -0.03em 0 0 black;

}



</style>
</head>

<body>
<br>
<div class="banner">

</div>
<hr class ="hr1" noshade> 
<h2 style="text-align: left; margin-left: 150px;">애플게시판</h2>
<table>
    <tr style="background-color: rgb(36, 36, 36); color:white;">
        <th>번호</th>
        <th style="width: 60%;">제목</th>
		<th>작성자</th>
        <th>작성일</th>
    </tr>
	<tbody>
	<c:choose>
		<c:when test="${empty articlesList }">
		<tr height="10">
			<td colspan="4">
				<p align = "center">
				<b><span style="font-size:9px;">
				등록된 글이 없습니다.</span></b></p>
			</td>
		</tr>
		</c:when>
		<c:when test="${!empty articlesList }">
		<c:forEach var="article" items="${articlesList }" varStatus="articleNum">
    <tr>
        <td class="center" style="color: rgb(0, 0, 0);">${articleNum.count }</td>
        <td align="left" width="20%">
			<span style="padding-right:30px"></span>
			<c:choose>
				<c:when test="${article.level > 1 }">
					<c:forEach begin="1" end="${article.level }" step="1">
						<span style="padding-left:20px"></span>
					</c:forEach>
					<span style="font-size:12px; color: black;"><img src="${contextPath}/resources/image/down-right-arrow.png">[답변]</span>
					<a class="cls1" href="${contextPath }/board/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
				</c:when>
					<c:otherwise>						
					<a class="cls1" href="${contextPath }/board/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
					</c:otherwise>
			</c:choose>
		</td>
		<td class="list-writer" style="color: black;">**${article.id.substring(2)}</td>
		<td class="list-regdate" style="color: rgb(0, 0, 0); width: 20%;"><fmt:formatDate value="${article.writeDate }" /></td>
    </tr>
	</c:forEach>
	</c:when>
	</c:choose>
</tbody>
</table>
<style>
	.pageNum01{
display:inline-flex;
text-decoration: none;
justify-content: center;
margin:10px;
height: min-content;
*{
border-radius: 5px;
border:1px solid dodgerblue;
margin:5px;
padding:1px 3px;
background-color: dodgerblue;
color: white;
font-weight: 300;
font-size: 18px;
}
}
.pageNum01 *:hover{
border: 1px solid rgb(102, 123, 145);
background-color: rgb(102, 123, 145);
transition: 0.2s;
}
</style>
<div class="pageNum01">
	<!-- 이전 페이지 링크 -->
<c:if test="${currentPage > 1}">
	<a href="${contextPath}/board/listArticles.do?pageNum=${currentPage - 1}">이전 페이지</a>
</c:if>

<!-- 페이지 번호 링크 -->
<c:forEach begin="1" end="${totalPage}" var="pageNum">
	<c:choose>
		<c:when test="${pageNum == currentPage}">
			<strong style="color:black; background-color: white;">${pageNum}</strong>
		</c:when>
		<c:otherwise>
			<a href="${contextPath}/board/listArticles.do?pageNum=${pageNum}">${pageNum}</a>
		</c:otherwise>
	</c:choose>
</c:forEach>

<!-- 다음 페이지 링크 -->
<c:if test="${currentPage < totalPage}">
	<a href="${contextPath}/board/listArticles.do?pageNum=${currentPage + 1}">다음 페이지</a>
</c:if>

</div>
<c:if test="${member != null}">
<input class="cls3" type="button" value="글쓰기" onclick="location.href='${contextPath}/board/articleForm.do?id=${member.id}'"/>
</c:if>
</div>
</br>

</body>
</html>