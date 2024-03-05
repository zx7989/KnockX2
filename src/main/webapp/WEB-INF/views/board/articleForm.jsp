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
<c:set var="articlesList" value="${articlesMap.articlesList}" ></c:set>
<c:set var="contextPath" value="${pageContext.request.contextPath }" ></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 창</title>

<script type="text/javascript">
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
</script>


<title>새글쓰기 창</title>
<style>

	form {
		width: 100%;
	}

	#content {
		background-color: #ffffff;
		border-radius: 5px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	}

	table {
    border-collapse: collapse;
	border-radius: 10px;
}

td {
    padding: 10px;
}
	 #tr_btn_modify{
		 display:none;
	 }
	 


textarea{
	border: 2px solid rgb(0, 0, 0);
	border-radius: 5px;
}

.write01 table{
	display: flex;
	width: 100%;
	text-align: center;
	margin:0 auto;
	padding:0 auto;
	justify-content: center;

	td{
		width:900px;
		text-align: center;
		border-top: 1px solid #b3b3b3;
		
	}
	#write-header1 input{
		width:50px;
		text-align: center;
		
	}
	.input1{
		width:100%;
		border-style:none;
		float:left;
		font-size:18px;
		
	}
	.input2{
		width:60%;
		border-style:none;
		float:left;
		}
	}
#editorTxt{
	width:99%;
	text-align: center;
	justify-content: center;	
}
#write-header1 input {
	border-style: none;
}
#brd-write-btn input{
	border-style: none;
	border-radius: 5px;
	padding: 5px;
	background-color: #dad8d8;
	width:70px;
}
#brd-write-btn input:hover{
	background-color: black;
	color:white;
	transition: 0.2s;
}

.brd-notice{
	width: 900px;
	height: 150px;
	font-size: 18px;
	margin: 0 auto;
	position: relative;
    padding: 1.75rem 2rem;
    margin-top: 1rem;
    background: #fff;
	
}
.brd-notice::after{
	height: 100%;
	vertical-align: middle;
}
.brd-notice img{
	float: left;	
	vertical-align:middle;

}
.list_st1{
	display: block;
	list-style-type: none;
	margin-left: 3.6rem;
	padding-left: 1.6rem;
}
.list_st1 li{
	display: list-item;
    text-align: left;
	padding-left: 4.6rem;
    color: #2b2828;
	
}

.brd-notice-txt{
    width: calc(100% - 50px);
}
input[type=radio]{
	margin:0;
}
</style>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
</script>
</head>
<body>
	<div class="brd-notice">
		<img src="${contextPath}/resources/image/brd-notice-ico.png">
		<div class="brd-notice-txt">
			<ul class="list_st1">
				<li>개인정보가 게시되어 노출될 경우 해당 게시물 작성자가 관련 법령에 따라 처분을 받을 수 있으니 유의하시기 바랍니다.</li>
				<br>
				<li><strong>폰트(글꼴), 영상, 이미지, 화면 캡처, 인쇄물 스캔본</strong> 등 저작권 위반 관련 소송 발생 사례가 있으니 자료 탑재 시 유의하시기 바랍니다.</li>
			</ul>
		</div>
	</div>
	<div class="write01">
	<form name="articleForm" action="${contextPath}/board/addNewArticle.do" method="post" enctype="multipart/form-data">
		<table border="0" align="center">
			<tr>
				<td id="write-header1" style="text-align: left;">
					<c:if test="${member.memberSort == 'admin'}">
					<label for="admin1">공지사항</label>
				  <input type="radio" id="admin1" value="admin" name="boardSort" >
				  <a>|</a>
				</c:if>
				<c:if test="${member.memberSort == 'member'}">
					<label for="free1">회원게시판</label>
				  <input type="radio" id="free1" value="free" name="boardSort" checked>
				  <a>|</a>
				</c:if>
				  <c:if test="${member.memberSort == 'shop'}">
				  <label for="free1">사업자게시판</label>
				<input type="radio" id="shop" value="shop" name="boardSort" >
				  <a>|</a>
				</c:if>
					<label for="samsung1">삼성게시판</label>
				  <input type="radio" id="samsung1" value="samsung" name="boardSort" >
				  <a>|</a>
				  <label for="apple1">애플게시판</label>
				<input type="radio" id="apple1" value="apple" name="boardSort" >
				<a>|</a>
				<label for="qna1">문의게시판</label>
			  <input type="radio" id="qna1" value="inquiry" name="boardSort" >
				</td>
			  </tr>
		  <tr>
			<td id="write-header1" style="text-align: left;">
			  <input type="text" value="${memInfo.id}" name="id" disabled/>
			  <input type="hidden" value="${memInfo.id}" name="id" >
			  <a>|</a>
			  <input type="text" value="${memInfo.memberSort}" name="memberSort" disabled/>
			  <input type="hidden" value="${memInfo.memberSort}" name="memberSort" >
			  <a>|</a>
			  <input type="text" value="${memInfo.name}" name="name" disabled/>
			  <input type="hidden" value="${memInfo.name}" name="name" >
			</td>
		  </tr>
		  <tr>        
			<td><input class="input1" type="text" maxlength="50" name="title" placeholder="제목을 입력하세요" /></td>
		  </tr>
		  <tr>
			<td><textarea id="editorTxt" rows="15" maxlength="4000" name="content1" placeholder="내용을 입력하세요"></textarea></td>
		  </tr><input type="hidden" id="anotherTextarea" name="content" />
		  <tr>
			<td><input class="input2" width="5px" type="file" onchange="readURL(this);" name="imageFileName" /></td>
		  </tr>
		  <tr>
			<td id="brd-write-btn">
			  <input type="submit" value="글쓰기" onclick="getEditorContent()"/>
			  <input type="button" value="목록보기" onclick="backToList(this.form)" />
			</td>
		  </tr>
		</table>
	  </form>

		<script>
		  function getEditorContent() {
			oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
			var content = oEditors.getById["editorTxt"].getIR();
			document.getElementById("anotherTextarea").value = content;
		  }
		</script>
	  
</body>
</html>