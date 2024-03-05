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
<title>Knock X2에 오신 것을 환영합니다</title>

<c:choose>
	<c:when test="${result == 'addtrue' }">
		<script>
			window.onload=function(){
				alert("회원가입이 완료되었습니다.");
			}
		</script>
	</c:when>
	<c:when test="${result == 'enterFailed' }">
		<script>
			window.onload=function(){
				alert("접속불가, 올바른 ID로 로그인하세요.");
			}
		</script>
	</c:when>
	
</c:choose>
<style>
    .main1 {
        text-align: center;
        align-items: center;
        margin: 0 auto;
        padding:0 auto;
    }

    .mainbtn1 img{
        border-radius: 10px;
        width:100%;
        padding:3px;

        
    }
    .mainbtn1 img:hover{
            background-color: rgb(59, 59, 59);
            
        }
    
    .main2{
        height: 400px;
        display: flex;
        background: url('${contextPath}/resources/image/main3.jpg');
        background-size: cover;

        flex-direction: column;
        position: relative; overflow:hidden;
        
        h1{
            position: absolute; left:200px; top:10px;
            font-size: 80px;
            color:rgb(236, 236, 236);
            opacity: 0;
            animation: slide1 3s ease-out forwards;
  text-transform: uppercase;
  text-align: center;
  line-height: 1;
            
            
        }
        h2{
            margin-left:50px;
            position: absolute; top:250px;
            font-size: 30px;
            color:rgb(221, 221, 221);
            opacity: 0;
            animation: slide1 4s ease-out forwards;
        }
        .phone2{
            position: absolute; width:600px; right:10%; 
        }
        
    }
    .main3{
        display: block;
        height: 500px;
        margin:0 auto;
        padding:50px auto;
        background: url('${contextPath}/resources/image/main222.jpg');
        background-size: cover;

        flex-direction: column;
        position: relative; overflow:hidden;
        
        
    }
    .main4{
        clear: both;
        height: 400px;
        display: flex;
        background: url('${contextPath}/resources/image/main4.jpg') fixed;
        background-size: cover;

        flex-direction: column;
        position: relative; overflow:hidden;
        
        h1{
            position: absolute; left:200px; top:50px;
            font-size: 60px;
            color:rgb(255, 255, 255);
            opacity: 0;
            animation: slide1 3s ease-out forwards;
        }
        h2{
            margin-left:-10px;
            position: absolute; top:250px;
            font-size: 30px;
            color:rgb(255, 255, 255);
            opacity: 0;
            animation: slide1 4s ease-out forwards;
        }
        .phone3{
            position: absolute; width:600px;right:10%; margin:20px auto; 
        }
        
    }
    .main5{
        
        margin:0 auto;
        display: flex;
        background-size: cover;

        flex-direction: column;
        position: relative; overflow: hidden;
        background: rgba(0, 0, 0, 0.3);
    }
    .main6{
        position: relative;
        height:500px;
		margin:0 auto;
        background: rgb(252, 252, 252); 

    }
    .main6_1{
        position: absolute; top:10%;
        width:300px;
        height: 200px;
        border: 2px solid;
    }
    .main10{
        clear: both;
    }

    @keyframes slide1 {
            from{left:-10%;opacity: 0;} to{left:10%;opacity: 1;}}
    @keyframes slide1_1 {
            from{left:10%;opacity: 1;} to{left:-10%;opacity: 0;}}

    @keyframes slide2 {
            from{bottom:-100px; opacity: 0;} to{bottom:10px;opacity: 1;}}
    @keyframes slide2_2 {
            from{bottom:10px; opacity: 1;} to{bottom:-100px;opacity: 0;}}

     @keyframes main4_1 {
            from{left:-10%;opacity: 0;} to{left:10%;opacity: 1;}}
    @keyframes  main4_1_1 {
            from{left:10%;opacity: 1;} to{left:-10%;opacity: 0;}}
   

    @keyframes slide3 {
            from{bottom:-200px;opacity: 0;} to{bottom:-30px;opacity: 1;}}
    @keyframes slide3_2 {
            from{bottom:-30px;opacity: 1;} to{bottom:-200px;opacity: 0;}}
    
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>
    <style>
		@media screen and (min-width: 1800px) {
	.main1{
        width:1800px;
    }
  }
  @media screen and (max-width: 1800px) {
	.main1{
        width:100%;
    }
    
   
  }
  .login01{
    margin:0 auto !important;
    color:white;
        padding:10px;
    border:10px solid blueviolet;
    border-radius: 50px;
    width: 70%;
    background-color: blueviolet;
  }
 
  
	</style>
            <jsp:include page="popup1.jsp" ></jsp:include>

     <div class="main10">
        <c:choose>
        <c:when test="${memberSort == 'member' && isLogOn == true }">
            <h1 class="login01">${member.name} 님 Knock X2에 오신 것을 환영합니다!</h1>
            <div class="mainbtn1">
            </div>
        </c:when>
        <c:when test="${memberSort == 'shop' && isLogOn == true }">
            <h1 class="login01">${member.name} 님 사업자모드로 로그인되셨습니다.</h1>
            <div class="mainbtn1">
            <a href="${contextPath}/shop/shopMain.do?shop_code=${shop.shop_code}"><img src="${contextPath}/resources/image/shopMainBtn01.png" /></a>
           </div>
        </c:when>
        <c:when test="${loginMode == 'admin' }">
            <h1 class="login01">관리자로 로그인되었습니다. 아래 메뉴를 클릭하여 이동하세요.</h1>
            <div class="mainbtn1">
                <a href="${contextPath}/admin/main/adminMain.do"><img src="${contextPath}/resources/image/adminMainBtn01.png" /></a>
           
            </div>
        </c:when>
        <c:otherwise>
            <h1></h1>
        </c:otherwise>
    </c:choose>
    </div>
    <div class="main1">
        
    <div class="main2">
        <h1 id="animation1">Knock X2<br>Service</h1>
       <h2 id="animation2">스마트추천<br>smart recommand</h2>
       <img id="phone2" class="phone2" src="${contextPath}/resources/image/phone2.png"/>
    </div>
    
    <div class="main6">
            <jsp:include page="main_part2.jsp" ></jsp:include>
        </div>
    
     <div class="main4">
         <h1 id="animation3">THE 새롭게<br>THE 빠르게</h1>
        <h2 id="animation4">Rate Plan<br>smart recommand</h2>
        <img id="phone3" class="phone3" src="${contextPath}/resources/image/phone1.png"/>
     </div>
     <div class="main5">
        <jsp:include page="main_part3.jsp" ></jsp:include>
    </div>
     <div class="main3">
        <jsp:include page="main_part1.jsp" ></jsp:include>
    </div>
    
    <script>
        let mainText = document.querySelector("#animation1")
        let mainText2 = document.querySelector("#animation2")
        let mainText3_1 = document.querySelector("#animation3")
        let mainText3_2 = document.querySelector("#animation4")
        let mainimg1 = document.querySelector(".phone2")
        let mainimg2 = document.querySelector(".phone3")

        window.addEventListener('scroll', function(){
            let value = window.scrollY
            console.log("scrollY", value)

            if(value > 800){
            mainText.style.animation = "slide1_1 2s ease-out forwards";
            mainText2.style.animation = "slide1_1 3s ease-out forwards";
            mainimg1.style.animation = "slide2_2 3s ease-out forwards";

         } 
         else{
            mainText.style.animation = "slide1 2s ease-out forwards";
            mainText2.style.animation = "slide1 3s ease-out forwards";
            mainimg1.style.animation = "slide2 3s ease-out forwards";
         }

         if(value<500){
            mainText3_1.style.animation = "main4_1_1 2s ease-out forwards";
            mainText3_2.style.animation = "main4_1_1 3s ease-out forwards";
            mainimg2.style.animation = "slide3_2 3s ease-out forwards";
         }else{
            mainText3_1.style.animation = "main4_1 2s ease-out forwards";
            mainText3_2.style.animation = "main4_1 3s ease-out forwards";
            mainimg2.style.animation = "slide3 3s ease-out forwards";

         }
        })
        
      

    </script>
   

</body>
</html>