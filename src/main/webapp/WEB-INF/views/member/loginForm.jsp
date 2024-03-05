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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<meta charset="UTF-8">
<title>로그인창</title>
<style>
login-img{
	width: 100%;
}
.login {
    height: 1300px;
    width: 100%;
    background: radial-gradient(#98e2ff, rgb(255, 255, 255));
    padding:auto 0;
}
.login_box {
    width: 1300px;
    height: 800px;
    position: relative;
    top:20%;
    margin:0 auto;
    background: #fff;
    border-radius: 10px;
    box-shadow: 1px 4px 22px -8px #0004;
    display: flex;
    overflow: hidden;
}
.login_box .login-left{
  width: 41%;
  height: 100%;
  padding: 25px 25px;
  
}
.login_box .login-right{
  width: 59%;
  height: 100%  
}
.login-left .top_link a {
    color: #452A5A;
    font-weight: 400;
}
.login-left .top_link{
  height: 20px
}
.login-left .contact{
	display: flex;
    align-items: center;
    justify-content: center;
    align-self: center;
    height: 100%;
    width: 73%;
    margin: auto;
}
.login-left h3{
  text-align: center;
  margin-bottom: 40px;
}
.login-left input {
    border: none;
    width: 80%;
    margin: 15px 0px;
    border-bottom: 1px solid #4f30677d;
    padding: 7px 9px;
    width: 100%;
    overflow: hidden;
    background: transparent;
    font-weight: 600;
    font-size: 14px;
}
.login-left{
	background: linear-gradient(-45deg, #dcd7e0, #fff);
}
.login-submit {
    width: 189px;
    border: none;
    padding: 15px 70px;
    border-radius: 8px;
    display: block;
    margin: auto;
    margin-top: 80px;
    background: #583672;
    color: #fff;
    font-weight: bold;
    -webkit-box-shadow: 0px 9px 15px -5px rgba(88,54,114,1);
    -moz-box-shadow: 0px 9px 15px -5px rgba(88,54,114,1);
    box-shadow: 0px 9px 15px -5px rgba(88,54,114,1);
}

.login-submit:hover{
    background-color: rgb(158, 135, 173);
    transition: 0.5s;

}

.login-submit:focus{
  border:none;
  outline:none;
}

.join-submit {
    width: 189px;
    border: none;
    padding: 15px 70px;
    border-radius: 8px;
    display: block;
    margin: auto;
    margin-top: 20px;
    background: #583672;
    color: #fff;
    font-weight: bold;
    -webkit-box-shadow: 0px 9px 15px -5px rgba(88,54,114,1);
    -moz-box-shadow: 0px 9px 15px -5px rgba(88,54,114,1);
    box-shadow: 0px 9px 15px -5px rgba(88,54,114,1);
}

.join-submit:hover{
    background-color: rgb(158, 135, 173);
    transition: 0.5s;
}

.join-submit:focus{
  border: none;
  outline: none;
}

.kakao-img{
  border: none;
  width: 189px;
  margin: auto;
  margin-top: 20px;
  display: block;
  -webkit-box-shadow: 0px 9px 15px -5px #9e9a61;
  -moz-box-shadow: 0px 9px 15px -5px #9e9a61;
  box-shadow: 0px 9px 15px -5px #9e9a61;
}

.kakao-login:focus {
  border: none;
  outline: none;
}

.login-right {
	background: linear-gradient(212.38deg, rgba(57, 174, 242, 0.7) 0%, rgba(175, 70, 189, 0.71) 100%),url(https://static.seattletimes.com/wp-content/uploads/2019/01/web-typing-ergonomics-1020x680.jpg);
	color: #fff;
	position: relative;
}

.login-right .login-right-text{
  height: 100%;
  position: relative;
  transform: translate(0%, 45%);
}
.login-right-text h2{
  display: block;
  width: 100%;
  text-align: center;
  font-size: 50px;
  font-weight: 500;
}
.login-right-text h5{
  display: block;
  width: 100%;
  text-align: center;
  font-size: 19px;
  font-weight: 400;
}

.login-right .login-right-inductor{
  position: absolute;
  width: 70px;
  height: 7px;
  background: #fff0;
  left: 50%;
  bottom: 70px;
  transform: translate(-50%, 0%);
}
.top_link img {
    width: 120px;
    padding-right: 7px;
    margin-top: -3px;
}

</style>
</head>

<c:choose>
	<c:when test="${result=='loginFailed' && result2 == null}">
		<script>
			window.onload=function(){
				alert("아이디나 비밀번호가 틀립니다. 다시 로그인 하세요!");
			}
		</script>
	</c:when>
  <c:when test="${result2=='loginFailed' }">
		<script>
			window.onload=function(){
				alert("해당 카카오 ID와 연동되어 있는 아이디가 없습니다. \n 일반 로그인 후 연동하여 주세요.");
			}
		</script>
	</c:when>
</c:choose>
<body>
    <section class="login">
		<div class="login_box">
			<div class="login-left">
				<div class="top_link"><a href="${contextPath}/main.do"><img src="${contextPath}/resources/image/knock_logo.png" alt=""></a></div>
				<div class="contact">
					<form action="${contextPath}/member/login.do" method="post">
						<h3>LOGIN</h3>
						<input type="text" name="id" placeholder="ID">
						<input type="password" name="pwd" placeholder="PASSWORD">
						<button class="login-submit">LOGIN</button></a>
            <button type="button" class="join-submit" onclick="location.href='${contextPath}/member/memberForm.do'">JOIN</button>
            <a href="https://kauth.kakao.com/oauth/authorize?client_id=2840b2919a36903a43e08af211aab685&redirect_uri=http://localhost:8091/auth/kakao/callback&response_type=code">
              <img src="${contextPath}/resources/image/kakao_login_medium_narrow.png" class="kakao-img" alt="카카오 로그인" /></a>
            
					</form>
				</div>
			</div>
			<div class="login-right">
				<div class="login-right-text">
					<h2>KNOCKX2</h2>
					<h5>SMART RECOMMEND SYSTEM</h5>
				</div>
				<div class="login-right-inductor"><img src="https://lh3.googleusercontent.com/fife/ABSRlIoGiXn2r0SBm7bjFHea6iCUOyY0N2SrvhNUT-orJfyGNRSMO2vfqar3R-xs5Z4xbeqYwrEMq2FXKGXm-l_H6QAlwCBk9uceKBfG-FjacfftM0WM_aoUC_oxRSXXYspQE3tCMHGvMBlb2K1NAdU6qWv3VAQAPdCo8VwTgdnyWv08CmeZ8hX_6Ty8FzetXYKnfXb0CTEFQOVF4p3R58LksVUd73FU6564OsrJt918LPEwqIPAPQ4dMgiH73sgLXnDndUDCdLSDHMSirr4uUaqbiWQq-X1SNdkh-3jzjhW4keeNt1TgQHSrzW3maYO3ryueQzYoMEhts8MP8HH5gs2NkCar9cr_guunglU7Zqaede4cLFhsCZWBLVHY4cKHgk8SzfH_0Rn3St2AQen9MaiT38L5QXsaq6zFMuGiT8M2Md50eS0JdRTdlWLJApbgAUqI3zltUXce-MaCrDtp_UiI6x3IR4fEZiCo0XDyoAesFjXZg9cIuSsLTiKkSAGzzledJU3crgSHjAIycQN2PH2_dBIa3ibAJLphqq6zLh0qiQn_dHh83ru2y7MgxRU85ithgjdIk3PgplREbW9_PLv5j9juYc1WXFNW9ML80UlTaC9D2rP3i80zESJJY56faKsA5GVCIFiUtc3EewSM_C0bkJSMiobIWiXFz7pMcadgZlweUdjBcjvaepHBe8wou0ZtDM9TKom0hs_nx_AKy0dnXGNWI1qftTjAg=w1920-h979-ft" alt=""></div>
			</div>
		</div>
	</section>
  <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script type="text/javascript">
    $(document).ready(function(){
        Kakao.init('87d53232b58e858b007f73fedb07fb22');
        Kakao.isInitialized();
    });

    function loginWithKakao() {
        Kakao.Auth.authorize({ 
        redirectUri: 'http://localhost:8091/kakao_callback' 
        }); // 등록한 리다이렉트uri 입력
    }
  </script>
</body>
</html>