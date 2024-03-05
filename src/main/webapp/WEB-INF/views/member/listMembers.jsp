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
	width: 80%;
}

tr, td{
	border-left: none;
	border-right: none;
	
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
.container tr{
	border-bottom:none;
}
.container {
	text-align: left;
	width: 100%;
	margin: 0 auto;
  	padding: 0 0 0 0;
	border-collapse: collapse;
	border-style: none;
}

.container td, .container th {
	padding:2px;
}
/* Background-color of the odd rows */
.container tr:nth-child(odd) {
	  background-color: #e3e3e3;
}

/* Background-color of the even rows */
.container tr:nth-child(even) {
	  background-color: #eee;
}

.container th {
	  background-color: #1F2739;
}

.container td:first-child { color: white; }

.container tr:hover {
   	background-color: rgba(156, 198, 214, 0.466);
	
			
}

.container td:hover {
  background-color: #82bcec;
  color: black;
  font-weight: bold; 
  border-radius: 10px;
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
	color:black;
	font-weight: bold;
}
.tabletd1{
	img{
		width:50px;
		border-radius: 20%;
	}
}
.mem-btn-main{
	width: 100px;
	height: 40px;
	border-radius: 10px;
	border-style: none;
	margin-top: 20px;
	background-color: #ea6153;
	color: white;
	font-weight: 300;
}
.mem-btn-main:hover{
	background-color: #8a1204c4;
	transition: 0.2s;
}

</style>
</head>
<body>
	
	<h1><span class="yellow">회원관리
	</span></h1><br>
	<br>
	<div class="conBox" style="width:100%;">
	<table class="container" align="center" border="1" align="center">
		<tr align="center" bgcolor="#616161" style="color:#ffffff; background-color: #ea6153; border-top: none;">
			<td width="2%" >프로필</td>
			<td width="5%">아이디<br>(상세보기)</td>
			<td width="5%">비밀번호</td>
			<td width="5%">이름 </td>
			<td width="5%">이메일</td>
			<td width="5%">가입일</td>
			<td width="5%">수정하기</td>
			<td width="5%">삭제하기</td>
		</tr>
	
			<c:forEach var="mem" items="${membersList }">
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
			  	<td><a href="${contextPath }/admin/myPage/myPageMainForm.do?id=${mem.id}&memberSort=member"
					style="color:#FB667A">${mem.id}</a>
				</td>
				<td>${mem.pwd }</td>
				<td>${mem.name }</td>
				<td>${mem.email }</td>
				<td>${mem.joinDate }</td>
				<td><a href="${contextPath }/admin/myPage/modMemberForm.do?id=${mem.id}&memberSort=member" style="color:#FB667A">수정</a></td>
				<td><a onclick="return delOk();" href="${contextPath}/member/removeMember.do?id=${mem.id}&memberSort=member" style="color:rgb(255, 54, 54)">삭제</a></td>
			</tr>
			</c:forEach>
		</table>
		</div>
		<div>
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
				<a href="${contextPath}/member/listMembers.do?pageNum=${currentPage - 1}">이전 페이지</a>
			</c:if>
			
			<!-- 페이지 번호 링크 -->
			<c:forEach begin="1" end="${totalPage}" var="pageNum">
				<c:choose>
					<c:when test="${pageNum == currentPage}">
						<strong style="color:red; background-color: white;">${pageNum}</strong>
					</c:when>
					<c:otherwise>
						<a href="${contextPath}/member/listMembers.do?pageNum=${pageNum}">${pageNum}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음 페이지 링크 -->
			<c:if test="${currentPage < totalPage}">
				<a href="${contextPath}/member/listMembers.do?pageNum=${currentPage + 1}">다음 페이지</a>
				
			</c:if>
			<a href="${contextPath}/member/listMembers.do?all=all">모두 보기</a>
			<c:if test="${all != null}">
				<style>
					.conBox{
						overflow-y: scroll;
						max-height:800px;
					}
				</style>
			</c:if>
			</div>
		<input class="mem-btn-main" type="button" value="메인으로 가기" onclick="location.href='${contextPath }/main.do'" style="width: 100px;"/>	
		</div>
		<script>
				function delOk(){
				if(!confirm('삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까??')){
					return false;
				}else{
					return true;
				}
			}
		</script>
</body>
</html>