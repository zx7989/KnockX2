<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"
    %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>
	
html{
	&::-webkit-scrollbar {
  width: 30px;
  height: 12px;
}
&::-webkit-scrollbar {
  width: 15px;
  border-radius: 10px;
  border-left: 2px solid rgb(139, 139, 139);
}

&::-webkit-scrollbar-thumb {
  background: linear-gradient(#005ce7, rgb(0, 206, 206));
  border-radius: 6px;
  border-radius: 20px;
}

&::-webkit-scrollbar-thumb:hover {
  background: linear-gradient(transparent, #ff4800, transparent);
}
}
	*{
		font-family: 'Noto Sans KR', sans-serif ;
		
}
	
	.maxcontain{
		font-family: 'Noto Sans KR', sans-serif !important;
		margin: 0px auto !important;
		padding: 0px auto;
		display: flex;
		flex-direction: column;
		justify-content: center;
	}

	#container1{
		clear: both;
		width:100%;
		margin: 0px auto;
		padding: 0px auto;
		border: 0px solid #bcbcbc;
		position: relative;
		text-align: center;
		
	}
	.back{
		margin:0 auto;
	   padding:0 auto;
		background: url("${contextPath}/resources/image/school.jpg");
	   opacity: 0.15;
	   width:2500px;
	   height: 1300px;
	   z-index: 0;
	   position :relative;
	   background-size: cover;
	  
	 
	}
	.back1{
	   opacity: 0.2;
	   width:2000px;
	   height: 1300px;
	   z-index: 0;
	   position :relative;
	   background-size: cover;
	   margin:10px auto;
	   padding:0 auto;
	   position: relative;
	}
	#header{
		margin:0px auto;
		padding: 0px auto;
		width: 100%;
		border: 0px solid #bcbcbc;
		justify-content: center;
	
	}
	#sidebar-left{
		width:18%;
		padding: 5px;
		margin-right:5px;
		margin-bottom:5px;
		float:left;
		min-height: 800px;
		border: 0px solid #bcbcbc;
		font-size:10px;
	}
	#content{
		text-align: center;
		width:100%;
		margin:0 auto;
		padding: 0px auto;
		margin-bottom:50px;
		float:left;
		border: 0px solid #bcbcbc;
	}
	#footer{
		clear:both;
		margin-top:10px;
		border: 0px solid #bcbcbc;
	}
	.main61{
        position: relative;
		width:100%;
        height:350px;
		margin:0 auto;
        background: rgb(252, 252, 252); 
        border-bottom: 1px solid #616161;

    }
	.main7{
        position: relative;
		width:100%;
        height:150px;
		margin:0 auto;
        background: rgb(252, 252, 252); 
        border-bottom: 1px solid #616161;

    }
	.upper01{
		display: flex;
		justify-content: flex-end;
		text-align: right;
		clear: both;
		width:30%;
		margin-left: auto;
		
	}
</style>
<title></title>
</head>
<body>
	<style>
	
		@media screen and (min-width: 1800px) {
		
    #container1{
		width: 1800px;
		margin:0 auto;
	}
	.main61{
		width: 1900px;
		margin:0 auto;
	}
  }
  @media screen and (max-width: 1200px) {
		
		.maxcontain{
			width: 1200px;
			margin:0 auto;
		}
		.main61{
			width: 1200px;
			margin:0 auto;
		}
	  }
	</style>
	<div class="maxcontain">
		<div id="header">
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<c:if test="${ upperMode == 'phone'}">
			<div class="main61">
            <jsp:include page="../main_part2.jsp" ></jsp:include>
        </div>
	</c:if>
	<c:if test="${ upperMode == 'shopMain'}">
		<div class="main7">
            <jsp:include page="../shop/shop_upper1.jsp" ></jsp:include>
        </div>
	</c:if>
	<c:if test="${ upperMode == 'myShop'}">
		<div class="main7">
            <jsp:include page="../myPage/myShop_upper1.jsp" ></jsp:include>
        </div>
	</c:if>
	
		<div id="container1">
		
	<c:if test="${ sideMode != null}">
		<style>
		#content{
			width:75%;
		}
	</style>
	
			<div id="sidebar-left">
				<jsp:include page="side.jsp" ></jsp:include>
			</div>	
	</c:if>
	
		<div id="content">
			<c:if test="${ sideMode == 'page'}">
			<div class="upper01">
				<jsp:include page="../upper01.jsp" ></jsp:include>
			</div>
		</c:if>
			<jsp:include page="../${contentPage}.jsp"></jsp:include>
		</div>	
			
	</div>
	<div id="footer">
		<jsp:include page="footer2.jsp"></jsp:include>
	</div>
	</div>
</div>
</body>
</html>

