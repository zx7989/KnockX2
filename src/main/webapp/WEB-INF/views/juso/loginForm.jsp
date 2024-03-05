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
</style>
</head>

<body>
 <h1>[회원등록화면]</h1>
<form method="post" action="${contextPath}/juso/jusoAdd.do">
 <table>
  <tr>
    <td>이름</td>
    <td>주소</td>
    <td>전화번호</td>
  </tr>
  <tr>
    <td><input type="text" value="" name="name"></td>
    <td><input type="text" value="" name="adress"></td>
    <td><input type="text" value="" name="phone"></td>
  </tr>
 </table>

 <button type="submit" value="등록"></button>
</form>
</body>
</html>