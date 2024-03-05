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
<title>상품 페이지</title>

<style>
  .OrderContainer {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        a{
            color:blue;
        }
        table {
            width: 70%;
            border:10px solid rgb(119, 119, 119);
            padding:10px;
            border-radius: 30px;
            margin:20px;
        }
        
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            
            font-size: 20px;
            font-weight: bold;
            border-radius: 30px;
            +td:hover{
                background-color: rgb(223, 234, 255);
            }
        }
        td{
            text-align: left;

        }
        
        th {
            text-align: center;
            background-color: #2873ff;
            color:white;
        }
        tr td:nth-child(1){
            text-align: center;
        }
        .result001{
            background-color: rgb(0, 23, 226);
            color:rgb(255, 255, 255);
            border-radius: 15px;
        }
        .result002 *{
            background-color: rgb(54, 54, 54);
            color:rgb(255, 255, 255);
            border-radius: 15px;
            width:300px;
            margin:0 auto;
            padding:5px;
            &:hover{
                background-color: rgb(15, 0, 150);
                color:rgb(0, 255, 255);
            }
        }
        .product-card {
    width: 20%;
    min-width: 300px;
    position: relative;
    box-shadow: 0 2px 7px #3d3d3d;
    margin: auto 10px;
    background: #fafafa;
    transform: scale(1.0);
    height: max-content;

}
.product-card:hover{
    background-color: rgb(238, 238, 238);
    transform: scale(1.05);
    transition: 0.5s ease-out;
}

.badge {
    position: absolute;
    left: 0;
    top: 20px;
    text-transform: uppercase;
    font-size: 13px;
    font-weight: 700;
    background: red;
    color: #fff;
    padding: 3px 10px;
}

.product-tumb {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 200px;
    padding: 10px;
    background: #f0f0f0;
}

.product-tumb img {
    max-width: 100%;
    max-height: 100%;
	border-radius: 10%;
}

.product-details {
    padding: 10px;
	display: flex;
	flex-direction: column;
  justify-content: space-between;
}

.product-catagory {
    display: block;
    font-size: 16px;
    font-weight: 700;
    text-transform: uppercase;
    color: #0081fa;
    margin-bottom: 18px;
}

.product-details a {
    display: block;
    font-weight: bold;
    text-transform: uppercase;
    color: #3f3f3f;
    font-size: 20px;
    text-decoration: none;
    transition: 0.3s;
}

.product-details h4 a:hover {
    color: #fbb72c;
}

.product-details p {
    font-size: 15px;
    line-height: 22px;
    margin-bottom: 18px;
    color: #999;
}

.product-bottom-details {
    overflow: hidden;
    border-top: 0px solid #eee;
    padding-top: 10px;
    width:100%;
    margin:auto auto;
    
}

.product-bottom-details div {
    float: left;
    width: 50%;
}

.product-price {
	width:20%;
    font-size: 20px;
    color: #3916ff;
    font-weight: 600;
	text-wrap: nowrap;
}

.product-price small {
    font-size: 80%;
    font-weight: 400;
    color:rgb(121, 121, 121);
    text-decoration: line-through;
    display: inline-block;
    margin-right: 5px;
}

.product-links {
    text-align: right;
}

.product-links a {
    display: inline-block;
    margin-left: 5px;
    color: #e1e1e1;
    transition: 0.3s;
    font-size: 17px;
}

.product-links a:hover {
    color: #fbb72c;
}
.fBox{
    display: flex;
    justify-content: center;
}
.colorBox01{
        display: flex;
        justify-content: center;

    }
</style>
<c:choose>
	<c:when test="${result=='enter' }">
		<script>
			window.onload=function(){
				alert("구매가 성공적으로 되었습니다.");
			}
		</script>
	</c:when>
</c:choose>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body> 
    <div style="text-align: right;">
      </div>
    <div class="container">
        <c:if test="${member.memberSort == 'member'}">
        <h1 class="result001">구매해주셔서 감사합니다.</h1>
        
        <img src='${contextPath}/resources/image/order.png' width="100%"/>
       
        <a class="result002" href="${contextPath}/goods/goodsDetail.do?goods_code=${orderInfo.goods_code}"><h1>(구매한 상품보기)</h1></a>
    </c:if>
        <h1>주문 결과 정보</h1>
        <div class="fBox">
            <div class="product-card">
                <div class="badge">HOT</div>
                <div class="product-tumb">
                    <c:choose>
                <c:when test="${goods.goods_img1 == null}">
                  <img  src="${contextPath}/resources/image/noImg1.jpg" id="preview"  width=200/>
                  
                </c:when>
                <c:when test="${goods.goods_img1 != null}">
                  <img src="${contextPath}/download2.do?goods_code=${goods.goods_code}&goods_img1=${goods.goods_img1}" id="preview"  width=200/>
                </c:when>
          </c:choose>
                </div>
                <div class="product-details">
                    <span class="product-catagory">
                <span style="color:tomato; background-color: rgb(255, 226, 226); padding:0 10px;"><span style="font-size: 25px; margin:0;  color:#ff6363;">${goods.goods_sell_count}</span>개 판매됐어요!</span><br>${goods.goods_type}</span>
                
                    <a href="${contextPath}/goods/goodsDetail.do?goods_code=${goods.goods_code}">${goods.goods_name}</a>
                    <p>${goods.goods_volume}</p>
                    <div class="colorBox01"><c:if test="${goods.goodsColorVO.goods_color1.equals('null')}">
                      <span class="colorName01">
                        없음<br><span style="background: linear-gradient(to right, red, green, blue); border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
                      </span>
                    </c:if>
                    <c:if test="${!goods.goodsColorVO.goods_color1.equals('null')}">
                       
        <c:if test="${goods.goodsColorVO.goods_color1 == 'black'}">
          <span class="colorName01">
            ${goods.goodsColorVO.goods_color1}<br><span style="background-color: black; border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
          </span>
        </c:if>
        <c:if test="${goods.goodsColorVO.goods_color2 == 'white'}">
          <span class="colorName01">
            ${goods.goodsColorVO.goods_color2}<br><span style="background-color: white; border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
          </span>
        </c:if>
        <c:if test="${goods.goodsColorVO.goods_color3 == 'silver'}">
            <span class="colorName01">
              ${goods.goodsColorVO.goods_color3}<br><span style="background-color: silver; border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
            </span>
          </c:if>
        <c:if test="${goods.goodsColorVO.goods_color4 == 'gold'}">
          <span class="colorName01">
            ${goods.goodsColorVO.goods_color4}<br><span style="background-color: gold; border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
          </span>
        </c:if>
        <c:if test="${goods.goodsColorVO.goods_color5 != 'null'}">
          <span class="colorName01">
            Other<br><span style="background: linear-gradient(to right, red, green, blue); border-radius: 50%; border:3px solid #616161; width: 30px; height: 30px; display: inline-block;"></span>
          </span>
        </c:if>
        </c:if>
        
                    </div>
                    <div class="product-bottom-details">
                        <div class="product-price"><small><fmt:formatNumber type="number"  value="${goods.goods_price}" />원</small><br> <fmt:formatNumber type="number"  value="${goods.goods_price*0.9}" />
                            원</div>
                        <div class="product-links">
                            <a href=""><i class="fa fa-heart"></i></a>
                            <a href=""><i class="fa fa-shopping-cart"></i></a>
                        </div>
                    </div>
                </div>
            </div>
       
        <table>
            <tr>
                <th>주문내역</th>
                <th>내용</th>
            </tr>
            <tr>
                <td>상품 코드</td>
                <td><a href="${contextPath}/goods/goodsDetail.do?goods_code=${orderInfo.goods_code}">${orderInfo.goods_code} (상품보기)</a>
                </td>
            </tr>
            <tr>
                <td>주문 번호</td>
                <td>${orderInfo.order_no}</td>
            </tr>
            <tr>
                <td>주문 날짜</td>
                <td>${orderInfo.order_date}</td>
            </tr>
            <tr>
                <td>주문 메모</td>
                <td>${orderInfo.order_memo}</td>
            </tr>
            <tr>
                <td>주문 전화번호</td>
                <td>${orderInfo.order_call_num}</td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>${orderInfo.email}</td>
            </tr>
            <tr>
                <td>이름</td>
                <td>${orderInfo.name}</td>
            </tr>
            <tr>
                <td>상품 수량</td>
                <td>${orderInfo.goods_qty}</td>
            </tr>
            <tr>
                <td>상품 색상</td>
                <td>${orderInfo.goods_color}</td>
            </tr>
            <tr>
                <td>주문자 아이디</td>
                <td>${orderInfo.id}</td>
            </tr>
            <tr>
                <th>주소</th>
                <th>내용</th>
            </tr>
            <tr>
                <td>우편번호</td>
                <td>${orderInfo.zipcode}</td>
            </tr>
            <tr>
                <td>도로명 주소</td>
                <td>${orderInfo.roadAddress}</td>
            </tr>
            <tr>
                <td>지번 주소</td>
                <td>${orderInfo.jibunAddress}</td>
            </tr>
            <tr>
                <td>나머지 주소</td>
                <td>${orderInfo.namujiAddress}</td>
            </tr>
            <tr>
                <th>결제</th>
                <th>내용</th>
            </tr>
            <tr>
                <td>주문 결제 방법</td>
                <td>${orderInfo.order_payment}</td>
            </tr>
            <tr>
                <td>주문 가격</td>
                <td><fmt:formatNumber type="number"  value="${orderInfo.order_price}" ></fmt:formatNumber>원</td>
            </tr>
            <tr>
                <td>주문 결과</td>
                <td>${orderInfo.delivery} (배송 평균 2일~5일)</td>
            </tr>
           
          
          
        </table>
    </div>
    </div>
    <a class="result002" href="${contextPath}/main.do"><span class="result002">메인으로 돌아가기</span></a>
<script>
  
      </script>
    
</body>
</html>