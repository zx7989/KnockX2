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
  table{
    border:1px solid;
    border-collapse: collapse;

  }
 td{
    border:1px solid;
    border-collapse: collapse;
  }
  *{
    margin:10px;
  }
</style>
<script language="javascript">
  // opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
  //document.domain = "abc.go.kr";
  
  function goPopup(){
    // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
      var pop = window.open("/juso/jusoPopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
      
    // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
      //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
  }
  /** API 서비스 제공항목 확대 (2017.02) **/
  function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
              , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
    // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
    document.form.roadAddrPart1.value = roadAddrPart1;
    document.form.roadAddrPart2.value = roadAddrPart2;
    document.form.addrDetail.value = addrDetail;
    document.form.zipNo.value = zipNo;
    document.form1.address1.value = zipNo+roadAddrPart1+roadAddrPart2+addrDetail;
    
  }
  </script>
</head>

<body>
  <div style="display: flex; flex-direction: column; width: 600px;">
 <h2>[회원등록화면]</h2>
<form name="form1" method="post" action="${contextPath}/juso/jusoAdd.do">
 <table>
  <tr>
    <td>이름</td>
    <td>주소</td>
    <td>전화번호</td>
  </tr>
  <tr>
    <td><input type="text" value="" name="name"></td>
    <td><input id="address1"  type="text" value="" size="50" name="address"></td>
    <td><input type="text" value="" name="phone"></td>
  </tr>
 </table>

 <button style="float:right" type="submit" value="등록">등록</button>
</form>
</div>
<form name="form" id="form" method="post">
	<table >
			<colgroup>
				<col style="width:20%"><col>
			</colgroup>
			<tbody>
				<tr>
					<th>우편번호</th>
					<td>
					    <input type="hidden" id="confmKey" name="confmKey" value=""  >
						<input type="text" id="zipNo" name="zipNo" readonly style="width:100px">
						<input type="button"  value="주소검색" onclick="goPopup();">
					</td>
				</tr>
				<tr>
					<th>도로명주소</th>
					<td><input type="text" id="roadAddrPart1" style="width:85%"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>
						<input type="text" id="addrDetail" style="width:40%" value="">
						<input type="text" id="roadAddrPart2"  style="width:40%" value="">
					</td>
				</tr>
			</tbody>
		</table>
</form>
</body>
</html>