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
<title>헤더</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
	@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css');
</style>
</head>
<style>
@font-face {
  font-family: 'Material Icons';
  font-style: normal;
  font-weight: 400;
  src: url(https://example.com/MaterialIcons-Regular.eot); /* For IE6-8 */
  src: local('Material Icons'),
    local('MaterialIcons-Regular'),
    url(https://example.com/MaterialIcons-Regular.woff2) format('woff2'),
    url(https://example.com/MaterialIcons-Regular.woff) format('woff'),
    url(https://example.com/MaterialIcons-Regular.ttf) format('truetype');
}
p{
	margin:0 !important;
}
.material-icons {
  font-family: 'Material Icons';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;  /* Preferred icon size */
  display: inline-block;
  line-height: 1;
  text-transform: none;
  letter-spacing: normal;
  word-wrap: normal;
  white-space: nowrap;
  direction: ltr;

  /* Support for all WebKit browsers. */
  -webkit-font-smoothing: antialiased;
  /* Support for Safari and Chrome. */
  text-rendering: optimizeLegibility;

  /* Support for Firefox. */
  -moz-osx-font-smoothing: grayscale;

  /* Support for IE. */
  font-feature-settings: 'liga';
}
	body {
		font-family: 'Noto Sans KR', sans-serif ;
	   background-repeat: repeat-x ;
	   padding: 0 auto;
	   margin:0 auto;
	  li{
		list-style: none;
	  }
   }
   
   a {
	   text-decoration: none;
	   padding:0 auto;
	   margin: auto 0;
   }
   

   
   ul.ulcls1 {
	li{
		text-align: center;
		list-style: none;
		display: inline-block;
		margin:0 10px;
	}
	a{
		color:rgb(255, 255, 255);
		font-size: 10px;
		font-family: 'Noto Sans KR', sans-serif;
		margin: 0 auto;
   }
   }
  
.admin_header{
	height:100px;
	background-color: rgb(20, 0, 133);
	display: flex;
	justify-content: space-evenly;
	padding:0 3%;
	.adminlogo{
		justify-content: space-between;
	}
}
   </style>
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
   <body>
	
	   <!-- Hero -->
	   <div class="admin_header">
		<span style="color:white; font-size: 100px;"class="material-symbols-outlined">
			Groups
			</span><span style="font-weight: bold; font-size: 20px; margin:10px 0; text-align: center; color:rgb(223, 223, 223);">ADMIN MODE<br>관리자 페이지입니다.</span>
	<a href="${contextPath}/admin/main/adminMain.do"><img class="adminlogo" src="${contextPath}/resources/image/adminlogo.png" width=300 height="100" alt="mainlogo"></a>
	
	<ul class="ulcls1">
		<c:choose>
			<c:when test="${isLogOn==true and member != null }">
				<li><a  href="${contextPath}/member/logout.do" >
					
					<span style="font-size: 40px;"class="material-symbols-outlined">
						logout
						</span><p>(${member.name})님 로그아웃</p>
				 </a></li>
				<input type="hidden" value="${member.id}" name="id" />
			</c:when>
			
			<c:otherwise>
				<li><a href="${contextPath}/member/loginForm.do">
					<span style="font-size: 40px;"class="material-symbols-outlined">
					login
					</span><p>로그인</p></a></li>
				<li><a href="${contextPath}/member/memberForm.do">
					<span style="font-size: 40px;"class="material-symbols-outlined">
						Key
						</span><p>회원가입</p></a></li>
			</c:otherwise>
		</c:choose>
	   
		<c:if test="${isLogOn==true and loginMode != 'admin' }">
		 <li class="no_line"><a
			 href="${contextPath }/member/scoreForm.do?id=${member.id}"><span style="font-size: 40px;"class="material-symbols-outlined">
				man
			</span><p>마이페이지</p></a></li>
	 </c:if>
		<c:if test="${isLogOn==true and loginMode == 'admin' }">
		 <li class="no_line"><a
			 href="${contextPath}/main.do">
			 <span style="font-size: 40px;"class="material-symbols-outlined">
				Groups
				</span><p>메인으로</p></a></li>	
		</c:if>
			
		
	</ul>
	<input type="hidden" value="${member.id}" name="id">
</div>

<style>
	
</style>
<script>

</script>

	   
 
	   <c:if test="${main1 == 'main' }">
	   <style>
   
	body {
	   background: url("${contextPath}/resources/image/mainbar4.png");
	   background-repeat: repeat-x;
   }
   </style>
			   <div class="mainimg1">
	   <img src="${contextPath}/resources/image/main2.png">
	   </div>
			   </c:if>
	   
	   
	   <br>
	 
	  
	
</body>


</html>