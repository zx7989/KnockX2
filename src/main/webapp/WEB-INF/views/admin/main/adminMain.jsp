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
  #container1{
    background-color: rgb(241, 241, 241);
  }
  .adminBox01{
    width: 500px;
    border-radius: 30px;
    height: 300px;
    background-color: white;
    margin:20px;
    overflow-y: scroll;
  }
  .adminBox{
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
  }
  .gauge-progress {
    width: 100%;
  }
  .gauge-progress {
        margin-bottom: 17px;
        appearance: none;
      }
  .gauge-progress::-webkit-progress-bar {
        background: #f0f0f0;
        border-radius: 12px;
        border: 1px solid #eeeeee;
        overflow: hidden;
        height: 20px;
      }
  .gauge-progress::-webkit-progress-value {
        background: #61bbff;
        border-radius: 0px;
        height: 20px;
        width: 48px;
      }
      .gauge-progress2 {
    width: 100%;
  }
  .gauge-progress2 {
        margin-bottom: 17px;
        appearance: none;
      }
  .gauge-progress2::-webkit-progress-bar {
        background: #f0f0f0;
        border-radius: 12px;
        border: 1px solid #eeeeee;
        overflow: hidden;
        height: 20px;
      }
  .gauge-progress2::-webkit-progress-value {
        background: #ffc061;
        border-radius: 0px;
        height: 20px;
        width: 48px;
      }
  .tableBox{
    text-align: center;
    table{
        width: 450px;
        margin:0 auto;
    }
    color:rgb(99, 99, 99);
  }
  td:nth-child(2){
    text-align: right;
  }
  .tableBox2{
    text-align: center;
    table{
        width: 450px;
        margin:0 auto;
    }
    td{
     font-size: 18px;
     font-weight: bold;
     border-bottom:1px solid blueviolet;
     height: 50px;
    }
    color:rgb(99, 99, 99);
    td:nth-child(2){
    text-align: right;
    color:red;
  }
  }
  .adminBox01{
	&::-webkit-scrollbar {
  width: 30px;
  height: 12px;
}
&::-webkit-scrollbar {
  width: 15px;
  border-radius: 10px;
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
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
   <div class="adminBox">
    <div class="adminBox01">
        <h2 style="color:rgb(127, 182, 255);">판매 랭킹 Sell Rank</h2>
        <div class="tableBox">
        <table class="tbl1">
        <c:forEach var="shop" items="${shopList}" varStatus="shopc">
            <tr style="text-align: left;">
                <td>${shopc.count}등 ${shop.shopVO.shop_name}</td>
                <td>판매금액:${shop.shopVO.shopTotalPrice}</td>
            </tr>
            <tr>
                <td colspan="2"><progress class="gauge-progress" value="${shop.shopVO.shopTotalPrice}" max="30000000"></progress>
            </tr>
            </c:forEach>
    </table>
</div>
    </div>
    <div class="adminBox01">
        <h2 style="color:rgb(127, 182, 255);">주문 랭킹 Order Rank</h2>
        <div class="tableBox">
        <table class="tbl1">
        <c:forEach var="goods" items="${goodsList}" varStatus="goodsc">
            <tr style="text-align: left;">
                <td>${goodsc.count}등 ${goods.goods_name} 상점코드:${goods.shop_code}</td>
                <td>판매 수:${goods.goods_sell_count}</td>
            </tr>
            <tr>
                <td colspan="2"><progress class="gauge-progress2" value="${goods.goods_sell_count}" max="50"></progress>
                </tr>
            </c:forEach>
    </table>
</div>
    </div>
    <div class="adminBox01">
        <h2 style="color:rgb(127, 182, 255);">신규 가입자 new Member</h2>
        <div class="tableBox2">
        <table class="tbl2">
        <c:forEach var="mem" items="${membersList}" varStatus="memc" begin="0" end="5">
            <tr style="text-align: left;">
                <td>아이디:${mem.id} 이름:${mem.name}</td>
                <td>가입일:${mem.joinDate}</td>
            </tr>
            </c:forEach>
    </table>
</div>
    </div>
    <div class="adminBox01">
        <h2 style="color:rgb(127, 182, 255);">신규 제휴업체 new SmartMall</h2>
        <div class="tableBox2">
        <table class="tbl2">
        <c:forEach var="mem" items="${shopJoin}" varStatus="memc" begin="0" end="5">
            <tr style="text-align: left;">
                <td>아이디:${mem.id} 이름:${mem.name}</td>
                <td>가입일:${mem.joinDate}</td>
            </tr>
            </c:forEach>
    </table>
</div>
    </div>
   </div>
   <img src="${contextPath}/resources/image/admin1.png" width="100%">

</body>
</html>