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
<script>
 
</script>
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
    <div class="frm1">
    <h1 class="h01">상품리스트</h1>
    <div class="list1">
    <table>
      <c:choose>
        <c:when test="${shopGoodsList[0] == null}">
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
            <th>상품코드</th>
            <th>상품이미지</th>
            <th>브랜드</th>
            <th>종류</th>
            <th>상품명</th>
            <th>가격</th>
            <th>동작</th>
          </tr>
          <c:forEach var="goods" items="${shopGoodsList}">
            <tr>
              <td>${goods.goods_code}</td>
              <td>
                <div class="tumb01">
                  <c:choose>
                    <c:when test="${goods.goods_img1 == null}">
                      <img src="${contextPath}/resources/image/profile.png" id="preview" width="100" height="100">
                    </c:when>
                    <c:when test="${goods.goods_img1 != null}">
                      <img src="${contextPath}/download2.do?goods_code=${goods.goods_code}&goods_img1=${goods.goods_img1}" id="preview" width="100" height="100">
                    </c:when>
                  </c:choose>
                </div>
              </td>
              <td>${goods.goods_type}</td>
              <td>${goods.goods_sort}</td>
              <td>${goods.goods_name}</td>
              <td>
                <div class="price01">
                    원가:<fmt:formatNumber type="number" value="${goods.goods_price}" />원
                  <br>
                  할인가:<fmt:formatNumber type="number" value="${goods.goods_price*0.9}" />원
                </div>
              </td>
              <td>
                <div class="links01">
                  <a href="${contextPath}/goods/modGoodsForm.do?goods_code=${goods.goods_code}">수정</a>
                  <a href="${contextPath}/myPage/removeGoods.do?goods_code=${goods.goods_code}&shop_code=${shop.shop_code}" onclick="return delOk(event); ">삭제</a>
                </div>
              </td>
            </tr>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </table>
  </div>
</div>
<script>
  function delOk(event){
    if(!confirm('삭제하시면 복구할 수 없습니다. \n 정말로 삭제하시겠습니까?')){
      event.preventDefault(); // 링크 실행을 중단합니다.
    }
  }
</script>
  </body>
</html>