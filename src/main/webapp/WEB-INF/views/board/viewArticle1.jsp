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
*{
	padding:0 auto;
	margin:0 auto;
}

table {
    width: 60%;
    border-collapse: collapse;
}

td {
	border-bottom: 1px solid #dad8d8;
	font-size: small;
	color: rgb(12, 12, 12);
    padding: 10px;
}


 #tr_btn_modify{
 	display:none;
 }
 #tr_btn_modify #td1 input{	 
	margin-right: 10px;
	border-style: none;
	border-radius: 5px;
	padding: 5px;
	background-color: #dad8d8;
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
	width:90%;
	opacity: 0.8;
 }

 #td2 input{
	border-style: none;
	border-radius: 5px;
	padding: 5px;
	background-color: #dad8d8;
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
	background-color: #dad8d8;
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
.reg-date{
	font-weight: 800;
}

</style>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

</head>
<body>
	<div class="boundary1">
	<form name="frmArticle" action="${contextPath}" method="post" enctype="multipart/form-data">
		<table border="0" align="center">
			<tr>
				<td class="class1">글번호 </td>
				<td align="left"><input type="text" value="${article.articleNO }" disabled style="border-style: none;"/>
				<input type="hidden" value="${article.articleNO }" name="articleNO" />
				</td>
			</tr>
			<tr>
				<td class="class1">제목 </td>
				<td align="left"><input class="input1" type="text" value="${article.title}" name="title" id="i_title" disabled />
				</td>
			</tr>
			<tr>
				<td class="class1">작성자 </td>
				<td align="left"><input class="input2" type="text" value="${article.id}" name="writer" disabled />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="reg-date">등록일자</span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<i class="fa fa-clock-o" aria-hidden="true"></i><input class="input2"  type="text" value="<fmt:formatDate value='${article.writeDate }' />" disabled />
				</td>
				
			</tr>
			
			<tr>
				<td class="class1">내용 </td>
				<td id="editorBox2">${article.content}</td>
				<td align="left" id="editorBox1"><textarea id="editorTxt" style=" font-weight: bold; font-size: 17px;" rows="15" name="content1" id="i_content" disabled>${article.content}</textarea>
				</td><input type="hidden" id="anotherTextarea" name="content" />
			</tr>
			
		<c:if test="${not empty article.imageFileName && article.imageFileName != 'null'}">
			<tr>
				<td class="class1" rowspan="2">이미지</td>
				<td align="left"><input type="hidden" value="${article.imageFileName }" name="originalFileName" />
					<img class="input1" src="${contextPath }/download.do?articleNO=
					${article.articleNO}&imageFileName=${article.imageFileName}" id="preview" /><br><br>
				</td>
			</tr>
		</c:if>
			<tr>
			<td colspan="2">
				<input type="file" onchange="readURL(this);" id="i_imageFileName" name="imageFileName" disabled />
			</td>
			</tr>
			<tr id="tr_btn_modify">
				<td id="td1" colspan="2" align="center">
					<input type="button" value="수정하기" onclick="fn_modify_article(frmArticle)" />

					<input type="button" value="취소" onclick="cancle(frmArticle)" />
				</td>
			</tr>
			<tr id="tr_btn">
				<td id="td2" colspan="2" align="center">					
					<input type="button" value="목록보기" onclick="backToList(this.form)" />
					&nbsp;&nbsp;&nbsp;
					<input type="button" value="답글쓰기" onclick="fn_reply_form(('${contextPath}/board/replyForm.do'), ${article.articleNO})" >
					<div id="td3" colspan="2" style="float: right;">
						<c:if test="${ loginMode == 'admin' }">
						<input type="button" value="수정하기" onclick="fn_enable(this.form)" />
						&nbsp;&nbsp;&nbsp;
						<input type="button" value="삭제하기" onclick="fn_remove_article(('${contextPath}/board/removeArticle.do'), ${article.articleNO})">		
					</c:if>	
					</div>
				</td>
				
			</tr>
		</table>
	</form>
</div>
<script>
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