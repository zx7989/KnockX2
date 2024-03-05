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

  </script>
</head>

<body>
  <div style="display: flex; flex-direction: column; width: 600px;">
 <h2>[회원결과화면]</h2>
<form name="form1" method="post" action="${contextPath}/juso/jusoForm.do">
 <table>
  <tr>
    <td>이름</td>
    <td >주소</td>
    <td>전화번호</td>
  </tr>
  <tr>
    <td><input type="text" value="${juso[0].name}" name="name" disabled></td>
    <td  style="width:500px;"><input id="address1" value="${juso[0].address}" size="50" type="text" value="" name="address" disabled></td>
    <td><input type="text" value="${juso[0].phone}" name="phone" disabled></td>
  </tr>
 </table>

 <button style="float:right" type="submit" value="등록">확인</button>
</form>
</div>
<form name="form" id="form" method="post">
	<table style="display: none;" >
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