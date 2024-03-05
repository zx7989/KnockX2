<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
    request.setCharacterEncoding("utf-8");
%>
<html>
<head>
    <script src="${contextPath}/js/scriptTest.js" type="text/javascript"></script>
    <meta charset="utf-8">
    <title>hello.JSP 페이지</title>
</head>
<body>
    안녕하세요 <br>
    <h2>${message}</h2>
    <img width=200 height=200 src="${contextPath}/image/winm.jpg" /> <br/>
    <input type="button" name="테스트" value="테스트" onclick="test();">


    <button onclick="requestPay();">결제하기</button>
</body>

<!-- jQuery -->
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<!-- 아임포트 -->
<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script>
function requestPay() {
    var IMP = window.IMP;
    IMP.init("imp36825135");  // 가맹점식별코드를 여기에 작성해주세요

    IMP.request_pay({
        pg: "kakaopay.TC0ONETIME",
        pay_method: "card",
        merchant_uid: "15151515",
        name: "테스트",
        amount: 1,
        buyer_email: "zx7989@naver.com",
        buyer_name: "전찬우",
        buyer_tel: "010-6604-7486",
        buyer_addr: "서울시 강남구",
        buyer_postcode: "15151"
    }, function (rsp) {
        if (rsp.success) {
            alert("결제가 완료되었습니다.");
            // 결제 완료 후 처리할 내용을 여기에 작성해주세요
        } else {
            var msg = "결제에 실패하였습니다.";
            msg += "에러 내용: " + rsp.error_msg;
            alert(msg);
        }
    });
}
</script>
</html>