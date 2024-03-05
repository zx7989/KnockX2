<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"
    import = "java.util.*,sec03.brd08.*"
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
<title>글목록 창</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<c:choose>
	<c:when test="${not empty article.imageFileName || article.imageFileName!='null' }">
		<script type="text/javascript">
		function fn_enable(obj){
			document.getElementById("i_title").disabled=false;
			document.getElementById("editorBox1").style.display="block";
			document.getElementById("editorBox2").style.display="none";

			document.getElementById("i_imageFileName").disabled=false;
			document.getElementById("tr_btn_modify").style.display="block";

			document.getElementById("tr_btn").style.display="none";
			smartEditor();
		}
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
		function fn_enable(obj){
			document.getElementById("i_title").disabled=false;
			document.getElementById("editorBox1").style.display="block";

			document.getElementById("editorBox2").style.display="none";

			
			document.getElementById("tr_btn_modify").style.display="block";
			document.getElementById("tr_btn").style.display="none";
			smartEditor();
		}
		</script>
	</c:otherwise>
</c:choose>
<script type="text/javascript">
	/*
	function fn_enable(obj){
		document.getElementById("i_title").disabled=false;
		document.getElementById("i_content").disabled=false;
		document.getElementById("i_imageFileName").disabled=false;
		document.getElementById("tr_btn_modify").style.display="block";
		document.getElementById("tr_btn").style.display="none";
	*/
	function fn_modify_article(obj){
		getEditorContent();
		obj.action = "${contextPath}/board/modArticle.do";
		obj.submit();
	}
	
	function fn_remove_article(url, articleNO){
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", url);
		var articleNOInput = document.createElement("input");
		articleNOInput.setAttribute("type", "hidden");
		articleNOInput.setAttribute("name", "articleNO");
		articleNOInput.setAttribute("value", articleNO);
		
		form.appendChild(articleNOInput);
		document.body.appendChild(form);
		form.submit();
	}
	
	function fn_reply_form(url, parentNO) {
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", url);
		var parentNOInput = document.createElement("input");
		parentNOInput.setAttribute("type", "hidden");
		parentNOInput.setAttribute("name", "parentNO");
		parentNOInput.setAttribute("value", parentNO);
		form.appendChild(parentNOInput);
		document.body.appendChild(form);
		form.submit();
	}
	
	
	function readURL(input){
		if (input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function (e){
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function backToList(obj){
		obj.action = "${contextPath}/board/listArticles.do";
		obj.submit();
	}
	function cancle(obj){
		obj.action = "${contextPath }/board/viewArticle.do?articleNO=${article.articleNO}";
		obj.submit();
	}
</script>
<title>글보기</title>
<style>
table {
    width: 60%;
    border-collapse: collapse;
}

.banner {
    background-image: url("${context}/resources/image/article1.jpg");
    background-size: cover; /* 이미지를 가능한 한 크게 확대하여 요소에 맞춥니다. */
    background-position: center; /* 이미지를 가운데로 정렬합니다. */
    display: flex; /* 텍스트를 가운데 정렬하기 위해 flexbox를 사용합니다. */
    align-items: center; /* 수직 중앙 정렬 */
    justify-content: center; /* 수평 중앙 정렬 */
    text-align: center; /* 텍스트를 수평 중앙 정렬 */
    height: 300px; /* 배경 이미지의 높이에 맞게 조정해주세요. */
	margin-bottom: 10px;
}

.banner h2 {
    color: white; /* 텍스트 색상 설정 */
    font-size: 40px; /* 텍스트 크기 설정 */
	font-weight: bold; /* 텍스트를 굵게 표시합니다. */
    line-height: 1.5; /* 텍스트의 행간을 설정합니다. */
	text-shadow: 2px 2px 0 black; /* 텍스트의 테두리를 검은색으로 설정합니다. */

}

td {
	border-bottom: 1px solid #000000;
	font-size: small;
	color: rgb(12, 12, 12);
    padding: 10px;
}



 #tr_btn_modify{
 	display:none;
	float: right;
 }
 #tr_btn_modify #td1 input{	 
	margin-right: 10px;
	border-style: none;
	border-radius: 5px;
	padding: 5px;
	background-color: dodgerblue;
	color: #eee;
	font-weight: 500;
	width: 70px;
 }
 #tr_btn_modify #td1 input:hover{
	background-color: black;
	color:white;
	transition: 0.2s;
 }
 .class1{
 	color:black;
	width: 100px;
	font-weight: bold;
	
 }

 .boundary1{
	width:100%;
	opacity: 0.8;
	background-color: #ffffff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
 }

 #td2 input{
	border-style: none;
	border-radius: 5px;
	padding: 5px;
	background-color: dodgerblue;
	color: #eee;
	width:70px;
	
 }

 #td2 input:hover{
	background-color: black;
	color:white;
	transition: 0.2s;
 }
 #td3 input{
	border-style: none;
	border-radius: 5px;
	padding: 5px;
	background-color: dodgerblue;
	width:70px;
 }

 #td3 input:hover{
	background-color: black;
	color:white;
	transition: 0.2s;
 }
 
 textarea{
/*border: 2px solid rgb(0, 0, 0);*/
	border-radius: 5px;
	padding: 5px;
}

.input1, textarea{
	 width: 500px;
	 text-align: left;
}
.input2 {
	text-align: left;
	border-style: none;
}
#td1 {
	text-align: center;
	display: flex;
	border-style: none;
	
}

#td2{
	padding-top: 20px;
	border-style: none;
}
#td3{	
	border-style: none;
}
#editorBox1{
	display: none;
	
}
#editorBox2{
	height: 300px;
	text-align: left;
}
#i_imageFileName{
	width: 704px;
	border-style: none;
	float: left;
}
#i_title.input1{
	width: 464px;
	border-style: none;
	color: black;	
	font-size: 18px;
	font-weight: 800;
	
}
.reg-writer{
	font-size: 16px;
	font-weight: 800;
}
.reg-date{
	font-weight: 800;
}

</style>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

</head>
<body>
	<div class="boundary1">
		<form name="frmArticle" action="${contextPath}" method="post" enctype="multipart/form-data">
			<div class="banner">
				<h2>자유게시판</h2>
			</div>
			<div class="tbl1">
			<table border="0" align="center">
				<tr>
					<td align="left" style="margin-top: 10px;"><input class="input1" type="text" value="${article.title}" name="title" id="i_title" disabled style="font-size: x-large; border-top: #000000;" /><br><br>
					<span class="reg-writer">**${article.id.substring(2)}</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<span class="reg-date">등록일자</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<i class="fa fa-clock-o" aria-hidden="true"></i><input class="input2"  type="text" value="<fmt:formatDate value='${article.writeDate }' />" disabled />
					<td colspan="2">
					<div id="social-share-buttons">
						<button id="facebook-share" style="padding: 0; border: 0;"><img width="24" height="24" alt="Like us on Facebook"
							src="http://cache1.artprintimages.com/images/jump_pages/rebrand/footer/fb.png"></button>
						<button id="twitter-share" style="padding: 0; border: 0;"><img width="24" height="24" alt="Follow us on Google+"
							src="http://cache1.artprintimages.com/images/jump_pages/rebrand/footer/gplus.png"></button>
						<button id="instagram-share" style="padding: 0; border: 0;"><img width="24" height="24" alt="Follow us on Instagram"
							src="http://cache1.artprintimages.com/images/jump_pages/rebrand/footer/instagram-badge.png"></button>
					  </div>
					</td>
					</td>
				</tr>			
				<tr>
					<td id="editorBox2" style="border: 0;">${article.content}</td>
					<td align="left" id="editorBox1"><textarea id="editorTxt" style=" font-weight: bold; font-size: 17px;" rows="15" name="content1" id="i_content" disabled>${article.content}</textarea>
					</td><input type="hidden" id="anotherTextarea" name="content" />
				</tr>
			<c:if test="${not empty article.imageFileName && article.imageFileName != 'null'}">
				<tr>
					<td align="left"><input type="hidden" value="${article.imageFileName }" name="originalFileName" />
						<img class="input1" src="${contextPath }/download.do?articleNO=
						${article.articleNO}&imageFileName=${article.imageFileName}" id="preview" /><br><br>
					</td>
				</tr>
			</c:if>
				<tr>
				<td colspan="2" style="border-top: 1px solid;">
					<input type="file" onchange="readURL(this);" id="i_imageFileName" name="imageFileName" disabled />
				</td>
				</tr>
				<tr id="tr_btn_modify">
					<td id="td1" colspan="2" align="center">
						<input type="hidden" value="${article.articleNO}" name="articleNO">
						<input type="button" value="수정하기" onclick="fn_modify_article(frmArticle)" />
	
						<input type="button" value="취소" onclick="cancle(frmArticle)" />
					</td>
				</tr>
				<tr id="tr_btn">
					<td id="td2" colspan="2" align="center">					
						<input type="button" value="목록보기" onclick="backToList(this.form)" />
						&nbsp;&nbsp;&nbsp;
						<input type="button" value="답글쓰기" onclick="fn_reply_form(('${contextPath}/board/replyForm.do?boardSort=${article.boardSort}'), ${article.articleNO})" >
						<div id="td3" colspan="2" style="float: right;">
							<c:if test="${ loginMode == 'admin' || article.id == sessionScope.id }">
							<input type="button" value="수정하기" onclick="fn_enable(this.form)" />
							&nbsp;&nbsp;&nbsp;
							<input type="button" value="삭제하기" onclick="fn_remove_article(('${contextPath}/board/removeArticle.do'), ${article.articleNO})">		
						</c:if>	
						</div>
					</td>
					
				</tr>
			</table>
		</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/board/comment.jsp"/>

	<script src="social-share.js"></script>

<script>
	 // Facebook 공유
	 document.getElementById('facebook-share').addEventListener('click', function() {
    var url = encodeURIComponent(window.location.href);
    var facebookUrl = 'https://www.facebook.com/sharer/sharer.php?u=' + url;
    window.open(facebookUrl, '_blank');
  });

  // Twitter 공유
  document.getElementById('twitter-share').addEventListener('click', function() {
    var url = encodeURIComponent(window.location.href);
    var twitterUrl = 'https://twitter.com/intent/tweet?url=' + url;
    window.open(twitterUrl, '_blank');
  });

  // Instagram 공유
  document.getElementById('instagram-share').addEventListener('click', function() {
    var url = encodeURIComponent(window.location.href);
    var instagramUrl = 'https://www.instagram.com/share?url=' + url;
    window.open(instagramUrl, '_blank');
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