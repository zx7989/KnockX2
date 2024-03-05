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
  .h01 {
  text-align: left;
  width:100px;
  clear: both;
}

th, td {
  padding: 8px;
  text-align: center;
  border-bottom: 1px solid rgb(196, 196, 196);
  font-weight: bold;
  a{
    color:rgb(68, 0, 146);
    &:hover{
      background-color: rgb(0, 4, 255);
      color:white;
    }
  }
 
}

th {
  font-weight: bold;
}
tr{
  &:hover{
      background-color: rgb(224, 225, 255);
      padding:5px;
    }
}
.tumb01 {
  display: flex;
  justify-content: center;
  align-items: center;
}

.price01 {
  font-weight: 600;
  white-space: nowrap;
}

.price01 small {
  font-size: 12px;
}

.links01 {
  text-align: center;
}

.links01 a {
  margin-right: 5px;
  text-decoration: none;
}

.list1 {
  background-color: #ffffff;
  border-radius: 5px;
  box-shadow: 0 0 10px #616161;
}

/* 추가한 스타일링 코드 */

/* 테이블 헤더 배경색과 글자색 변경 */
th {
  background-color: #616161;
  color: #ffffff;
}

/* 상품 수정, 삭제 버튼 스타일 변경 */
.links01 button {
  background-color: #616161;
  color: #ffffff;
  border: none;
  padding: 5px 10px;
  border-radius: 3px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.links01 button:hover {
  background-color: #404040;
}

/* 테이블 외부 여백 추가 */
table {
  margin: 20px 0;
  border-collapse: collapse;
  width: 100%;
  margin-top: 20px;
  box-shadow: 0 0 10px #616161;
  border-radius: 5px;
}

/* 상품 추가 버튼 스타일 변경 */
button {
  background-color: #616161;
  color: #ffffff;
  border: none;
  padding: 8px 12px;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s;
}

button:hover {
  background-color: #404040;
  background-color: #afffa8;
}
</style>
</head>
<body>
  <div class="frm1">
    <div style="display: flex; justify-content: space-between;">
    <h1 class="h01">결제</h1>
      <img style="border-bottom: 5px solid rgb(89, 161, 255); clear: both;" src="${contextPath}/resources/image/pay3.png" width="500px" height="100px;">
    </div>
    <div class="list1">
      <table>
        <c:choose>
        <c:when test="${ordersList[0] == null}">
          <tr >
            <td colspan="6" style="text-align: center;">
              <h1>주문한 상품이 없습니다.</h1>
              <br>
              <a href="${contextPath }/shop/listShop.do">
                <p class="cls1">판매하러가기 (클릭)</p>
              </a>
            </td>
          </tr>
        </c:when>
        <c:otherwise>
          <tr>
            <th>상품이미지</th>
            <th>상품코드</th>
            <th>상품명</th>
            <th>상품 구매 수</th>
            <th>선택 색상</th>
            <th>주문 금액</th>
            <th>배송현황</th>
            <th>상세보기</th>
          </tr>
          <c:forEach var="order" items="${ordersList}">
          <tr
          <c:if test="${order.delivery eq '배송준비중'}">style="background-color: #a8dcff;"</c:if>
          <c:if test="${order.delivery eq '배송완료'}">style="background-color: #afffa8;"</c:if>
          <c:if test="${order.delivery eq '주문취소(재고부족)'}">style="background-color: tomato;"</c:if>
          >
              <td>
                <div class="tumb01">
                  <c:choose>
                    <c:when test="${order.goodsVO.goods_img1 == null}">
                      <img src="${contextPath}/resources/image/profile.png" id="preview" width="100" height="100">
                    </c:when>
                    <c:when test="${order.goodsVO.goods_img1 != null}">
                      <img src="${contextPath}/download2.do?goods_code=${order.goodsVO.goods_code}&goods_img1=${order.goodsVO.goods_img1}" id="preview" width="100" height="100">
                    </c:when>
                  </c:choose>
                </div>
              </td>
              <td><a href="${contextPath}/goods/goodsDetail.do?goods_code=${order.goodsVO.goods_code}">${order.goods_code}<BR>(상품보기)</a></td>
              <td>${order.goodsVO.goods_name}</td>
              <td>${order.goods_qty}</td>
              <td>${order.goods_color}</td>
              <td>
                <div class="price01">
                  <fmt:formatNumber  type="number" value="${order.order_price * order.goods_qty}" pattern="#,##0" />원
                </div>
              </td>
              <td>
                <form method="post" action="${contextPath}/order/modDelivery.do?order_no=${order.order_no}">
                <select name="delivery">
                  <option value="${order.delivery}" selected>${order.delivery}</option>
                  <option value="결제완료">결제완료</option>
                  <option value="배송준비중">배송준비중</option>
                  <option value="배송완료">배송완료</option>
                  <option value="주문취소(재고부족)">주문취소(재고부족)</option>
                </select>
               
                <input type="submit" value="상태 변경">
                <input type="hidden" value="${shopInfo.id}" name="id">
              </form>
              </td>
              <td>
                
                <a href="${contextPath}/order/orderResultForm.do?order_no=${order.order_no}">결제 상세보기</a>
              </td>
            </tr>
          </c:forEach>  
        </c:otherwise>
      </c:choose>
      </table>
    </div>
  </div>
  
  <script>
    function updatePrice(inputElement, unitPrice) {
      var quantity = inputElement.value;
      var originalPriceElement = document.getElementById("originalPrice_" + inputElement.id);
      var discountedPriceElement = document.getElementById("discountedPrice_" + inputElement.id);
      
      var originalPrice = unitPrice * quantity;
      var discountedPrice = originalPrice * 0.9;
      
      originalPriceElement.innerText = originalPrice.toLocaleString();
      discountedPriceElement.innerText = discountedPrice.toLocaleString();
    }

  // 페이지 로딩 후에 배송 상태를 확인하고 배경색을 변경하는 함수
                window.onload = function() {
                  var deliveryStatus = "${order.delivery}"; // 배송 상태 값을 가져옵니다
                  var trElement = document.getElementsByClassName("tr01"); // 해당 <tr> 엘리먼트의 ID를 지정해야 합니다
              
                  if (deliveryStatus == "배송준비중") {
                    trElement.style.backgroundColor = "yellow"; // 배경색을 변경합니다
                  }
                };
             

  </script>
</body>
</html>