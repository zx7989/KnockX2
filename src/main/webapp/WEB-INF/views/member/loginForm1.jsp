<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>로그인창</title>

<style>
body{
	background-color: #fff;
}
.frm-group{
	width:402px;
	margin-left:auto;
	margin-right:auto;
}

.login-btn{
	width:402px;
	display: block;
	text-align: center;
	height: 48px;
	margin:auto;
}

.reset-btn{
	width: auto;
	height: 48px;
}

.log-btn{
	width:402px;
	height: 48px;
	display: inline-block;
	text-align: center;
	box-sizing: border-box;
	border-radius: 6px;
    border: solid 1px #e3e3e3;
	background-color: #ff4747;
	color: #ffffff;
	font-weight: bold;
	font-size: 16px;
	margin-left:auto;
	margin-right:auto;
}

.log-btn:hover{
	background-color: rgb(209, 41, 41);
	transition: 0.2s;
}

.rst-btn{
	width:402px;
	height: 48px;
	display: block;
	text-align: center;
	border-radius: 6px;
    border: solid 1px #e3e3e3;
    box-sizing: border-box;
}

.frm-inline{
	display:inline-block;
}

.login-frm{
	width:650px;
	border: 1px solid #e3e3e3;
	padding: 20px 20px;	
}

.id{
	border: 1px solid #e3e3e3;
	box-sizing:border-box;
	border-radius: 6px 6px 0 0;
	width: 402px;
	height: 48px;
	font-size: 16px;	
}

.id:focus{
		border: 2px solid;
		border-color: #ff4747;
		outline: none;
	}

.pwd{
	border: 1px solid #e3e3e3;
	box-sizing:border-box;
	border-radius: 0 0 6px 6px;
	width: 402px;
	height: 48px;
	font-size: 16px;	
}

.pwd:focus{
		border: 2px solid;
		border-color: #ff4747;
		outline: none;
	}

</style>
</head>
<c:choose>
	<c:when test="${result=='loginFailed' }">
		<script>
			window.onload=function(){
				alert("아이디나 비밀번호가 틀립니다. 다시 로그인 하세요!");
			}
		</script>
	</c:when>
	
</c:choose>
<body>
	<div class="logo-img">
		<img src="/resources/image/headlogo1.png" width="120px">
	</div>
	<br><br>
	<div class="frm-inline">
		<c:if test="${admin == 'admin'}">
			<h1>관리자로그인이 필요한 페이지입니다.</h1>
		</c:if>
	<form class="login-frm" method="post" action="${contextPath}/member/login.do"
		encType="UTF-8">
		<div class="frm-group">
			<input type="text" class="id" name="id" placeholder="학번">
		</div>

		<div class="frm-group">
			<input type="password" class="pwd" name="pwd" placeholder="비밀번호">
		</div>
		<br>
		
		<div class="login-btn">
			<button type="submit" class="log-btn"><span class="btn-text">로그인</span></button>
		
		<!--<div class="reset-btn">
			<button type="reset" class="rst-btn"><span class="btn-retext">다시입력</span></button>
		</div>-->
		</div>
	</form>
	</div>
</body>
</html>