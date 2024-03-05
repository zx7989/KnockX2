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

.reviewBox{
  display: flex;
  flex-direction: column;

}
.review01{
  display: flex;
  justify-content: flex-start;
  flex-wrap: nowrap;
  height: 200px;
 

  } .editor {
    border:1px solid #c7c7c7;
    border-radius: 20px;
    width:1000px;   overflow-y: scroll;
    *{
      width: 98%;
    
    }
 
  } 
  .reviewBtn{
    width:15%;
    margin:10px;
    font-size: 30px;
    background-color: #258bff;
    border-radius: 20px;
    border:0;
    color:white;
    font-weight: bold;
    &:hover{
    background-color: #258bff8a;
    }
  }
  .rating {
  unicode-bidi: bidi-override;
  direction: rtl;
  text-align: center;
  margin:10px;
  padding:5px;
  border-radius: 10px;
}

.rating select {
  width:200px;
  padding:0 5px;
  font-size: 24px;
  color:tomato;
  border-radius: 10px;
  font-weight: bold;
}

.rating option {
  padding: 0;
  font-size: 24px;
  cursor: pointer;
  color:#ffc107;
  border:1px solid;
  
}

.rating option:before {
  content: '★';
}

.rating option:checked:before {
  content: '★★★★★';
}
.reviewTab{
  width: 100%;
}
.reviewTab, .reviewTab td{
  border:1px solid #cacaca;
  border-collapse: collapse;
}
.reviewContent{
  max-width: 1000px;
  max-height:300px;
  overflow-y: scroll;
  
}
.reviewTabTitle{
  font-weight: bold;
}
</style>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

</head>
<body> 

  <div> 
    <h1>리뷰관리</h1>
  <table class="reviewTab">
    <tr class="reviewTabTitle">
      <td width="7%">상품코드</td>
      <td width="10%">별점</td>
      <td width="50%">내용</td>
      <td width="10%">작성자</td>
      <td width="20%">작성날짜</td>
      <td width="3%">삭제</td>
    </tr>
    <c:forEach var="rev" items="${reviewList}">
      
      <tr style="max-height: 100px !important;table-layout:fixed;">
        <td>${rev.goods_code}</td>
        <td style="color:#ffc107">
          <c:choose>
            <c:when test="${rev.rating == 1}">
              <span><i class="fa fa-star"></i></span>
            </c:when>
            <c:when test="${rev.rating == 2}">
              <span><i class="fa fa-star"></i><i class="fa fa-star"></i></span>
            </c:when>
            <c:when test="${rev.rating == 3}">
              <span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span>
            </c:when>
            <c:when test="${rev.rating == 4}">
              <span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span>
            </c:when>
            <c:when test="${rev.rating == 5}">
              <span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span>
            </c:when>
          </c:choose>
        </td>
        <td ><div class="reviewContent">${rev.content}</div></td>
        <td style="color:#e90000">**${rev.id.substring(3)}</td>
        <td>${rev.writedate}</td>
        <td><a onclick="return delOk();" href="${contextPath}/admin/review/removeReview.do?id=${rev.id}&goods_code=${rev.goods_code}">X</a></td>
      </tr>
     
</c:forEach>
</table> 

</div>




  
  
<style>
 
</style>
    <script>
  
      function delOk(){
				if(!confirm('삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까??')){
					return false;
				}else{
				}
			}
      </script>
    
</body>
</html>