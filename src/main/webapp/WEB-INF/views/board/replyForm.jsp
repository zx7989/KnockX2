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
<title>글쓰기 창</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
<title>답글쓰기 창</title>
<style>
	*{
		padding:0 auto;
		margin:0 auto;
	}
	
	h1 {
		padding-top: 10px;
		padding-bottom: 10px;
	}

	form {
		width: 1000px;
	}

	table {
    width: 60%;
    border-collapse: collapse;
	border-radius: 10px;
}

td {
    padding: 10px;
}
	 #tr_btn_modify{
		 display:none;
	 }
	 
.input1, textarea{
	 width: 700px;
}

input, textarea{
	border: 2px solid rgb(226, 226, 228);
	border-radius: 5px;
}
h1.reply-title{
	
	text-align: center;
	font-size: 24px;
}
.td-head{
	border-top: 2px solid black;
}
.td-head input{
	border-style: none;
	font-size: 18px;
	font-weight: 800;
}
.td-id input{
	border-style: none;
}
#reply-submit-td input{
	border-style: none;
	border-radius: 5px;
	padding: 5px;
	background-color: #dad1d1;
	width:70px;
}
#reply-submit-td input:hover{
	background-color: black;
	transition: 0.2s;
	color: white;
}
</style>
</head>
<body>
	<h1 class="reply-title">답글쓰기</h1>
	<form name="frmReply" action="${contextPath}/board/addReply.do" method="post" enctype="multipart/form-data">
		<table border="0" align="center">	
			<tr>
				<td id="write-header1" style="text-align: left;">
					<input type="text" value="${boardSort}" name="boarSort">
				</td>
			  </tr>
		  <tr>		
			<tr>
				<td class="td-head"><input class="input1" type="text" maxlength="50" name="title" placeholder="제목을 입력하세요" /></td>
				</td>
			</tr>
			<tr>
				<td class="td-id" style="text-align: left;">
					<input type="text" value="${memInfo.id}" name="id" disabled/>
					<input type="hidden" value="${memInfo.id}" name="id" >
					<input type="hidden" value="${memInfo.memberSort}" name="memberSort" >
				</td>
			</tr>
			<tr>
				<td><textarea rows="15" maxlength="4000" name="content" placeholder="내용을 입력하세요"></textarea></td>
			</tr>
			<tr>
				<td><input class="input1" width="5px" type="file" onchange="readURL(this);" name="imageFileName" />
				</td>
			</tr>
			<tr>
				<td id="reply-submit-td">
				<input type="submit" value="답글쓰기" />
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="취소" onclick="backToList(this.form)" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>