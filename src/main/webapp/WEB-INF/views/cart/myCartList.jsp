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
 
}

th, td {
  padding: 8px;
  text-align: center;
  border-bottom: 1px solid rgb(196, 196, 196);
}

th {
  font-weight: bold;
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
}
</style>
</head>
<body>
  <div class="frm1">
    <h1 class="h01">장바구니</h1>
    <div>
      <img src="${contextPath}/resources/image/pay1.png" width="500px">
    </div>
    <div class="list1">
      <table>
        <c:choose>
        <c:when test="${myCartList[0] == null}">
          <tr>
            <td colspan="6" style="text-align: center;">
              <h1>등록된 상품이 없습니다.</h1>
              <br>
              <a href="${contextPath }/main.do">
                <p class="cls1">메인홈페이지로 가기</p>
              </a>
            </td>
          </tr>
        </c:when>
        <c:otherwise>
          <tr>
            <th>상품이미지</th>
            <th>브랜드</th>
            <th>종류</th>
            <th>상품명</th>
            <th>색상</th>
            <th>용량</th>
            <th>수량</th>
            <th>가격</th>
            <th>동작</th>
          </tr>
          <c:forEach var="cart" items="${myCartList}">
            <tr>
              <td>
                <div class="tumb01">
                  <c:choose>
                    <c:when test="${cart.goods_img1 == null}">
                      <img src="${contextPath}/resources/image/profile.png" id="preview" width="100" height="100">
                    </c:when>
                    <c:when test="${cart.goods_img1 != null}">
                      <img src="${contextPath}/download2.do?goods_code=${cart.goods_code}&goods_img1=${cart.goods_img1}" id="preview" width="100" height="100">
                    </c:when>
                  </c:choose>
                </div>
              </td>
              <td>${cart.goods_type}</td>
              <td>${cart.goods_sort}</td>
              <td>${cart.goods_name}</td>
              <td>${cart.cartVO.goods_color}</td>
              <td>${cart.goods_volume}</td>
              <form action="${contextPath}/cart/modQty.do?id=${cart.cartVO.id}&memberSort=${member.memberSort}" method="post">
                <input type="hidden" name="cartNO" value="${cart.cartVO.cartNO}">
                <td>
                  <input type="number" name="goods_qty" id="goodsQty" min="1" max="100" value="${cart.cartVO.goods_qty}">
                  <button type="submit">수량변경</button>
                </td>
              </form>
              <td>
                <div class="price01">
                  원가: <fmt:formatNumber  type="number" value="${cart.goods_price * cart.cartVO.goods_qty}" pattern="#,##0" />원
                  <br>
                  할인가: <fmt:formatNumber  type="number" value="${cart.goods_price*0.9 * cart.cartVO.goods_qty}" pattern="#,##0" />원
                </div>
              </td>
              <td>
                <div class="links01">
                  <a href="${contextPath}/order/orderForm.do?goods_code=${cart.goods_code}&goods_qty=${cart.cartVO.goods_qty}&goods_color=${cart.cartVO.goods_color}&id=${member.id}">구매하기</a>
                  <a href="${contextPath}/cart/removeCartGoods.do?id=${cart.cartVO.id}&cartNO=${cart.cartVO.cartNO}&memberSort=${member.memberSort}" onclick="return delOk(event); ">삭제</a>
                </div>
              </td>
            </tr>
          </c:forEach>  
        </c:otherwise>
      </c:choose>
      </table>
    </div>
  </div>
</body>
</html>