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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />

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

   
  <table class="reviewTab">
    <tr class="reviewTabTitle">
      <td width="20%">별점</td>
      <td width="50%">내용</td>
      <td width="10%">작성자</td>
      <td width="20%">작성날짜</td>
    </tr>
  <c:forEach var="rev" items="${reviewList}">
   
      <tr style="max-height: 100px !important;table-layout:fixed;">
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
      </tr>
     
</c:forEach>
</table> 
</c:when>
</c:choose>
  </div>


     </div>
</div>


  
  
<style>
 
</style>
<link rel="stylesheet" type="text/css" href="https://codepen.io/imgix/pen/d06269809bb83c85326ebbbf7e81241b.css">
<link rel="stylesheet" type="text/css" href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/164071/drift-basic.css">
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/164071/Drift.min.js"></script>
    <script>
        // URL에서 alert 파라미터를 확인하여 작성 여부를 판단하고 alert 창을 표시
  var urlParams = new URLSearchParams(window.location.search);
  if (urlParams.has('alert') && urlParams.get('alert') === 'exist') {
    alert('이미 작성하였습니다.');
  }
  document.addEventListener('DOMContentLoaded', function() {
    new Drift(document.querySelector('.main-image img'), {
      inlinePane: true,
      containInline: true,
      zoomFactor: 1.5,

    });
  });

  // 첫 번째 이미지로 초기화
  var firstImage = document.querySelector('.thumbnails .zoom').querySelector('img').getAttribute('src');
  document.querySelector('.main-image img').setAttribute('src', firstImage);
  document.querySelector('.main-image img').setAttribute('data-zoom', firstImage);

  // 썸네일 클릭 시 이미지 변경
  var thumbnails = document.querySelectorAll('.thumbnails .zoom');
  thumbnails.forEach(function(thumbnail) {
    thumbnail.addEventListener('click', function(e) {
      e.preventDefault();
      var photo_fullsize = this.querySelector('img').getAttribute('src');
      document.querySelector('.main-image img').setAttribute('src', photo_fullsize);
      document.querySelector('.main-image img').setAttribute('data-zoom', photo_fullsize);
    });
  });
  let oEditors = [];
		  
		  function smartEditor() {
			console.log("Naver SmartEditor");
			nhn.husky.EZCreator.createInIFrame({
			  oAppRef: oEditors,
			  elPlaceHolder: "editorTxt",
			  sSkinURI: "/smarteditor/SmartEditor2Skin.html",
			  fCreator: "createSEditor2"
			});
		  }
		  
		  $(document).ready(function() {
			smartEditor();
		  });
		  
		  function getEditorContent() {
			oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
			var content = oEditors.getById["editorTxt"].getIR();
			document.getElementById("anotherTextarea").value = content;
		  }
      </script>
    
</body>
</html>