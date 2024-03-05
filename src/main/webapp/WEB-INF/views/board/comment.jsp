<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value = "${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 창</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">



</script>

<c:choose>
	<c:when test="${empty member }">
		<script>
			document.addEventListener("DOMContentLoaded", function(){
                var commentTextarea = document.querySelector(".cmt-text");

                if(commentTextarea){
                    commentTextarea.addEventListener("click", function(){
                        alert("로그인이 필요합니다!");

                        if(confirm("로그인 페이지로 이동하시겠습니까?")){
                            var currentURL = encodeURIComponent(window.location.href);
                            window.location.href = "${contextPath}/member/loginForm.do?returnUrl="+ currentURL;
                            
                        } else{
                            event.preventDefault();
                        }
                    });
                }
            });

        </script>
        </c:when>
</c:choose>
<style>
   
    #comment-List li{
        text-align: left;
    }
    
    .cmt-ul{
        min-height: 70px auto;
        list-style: none;
        padding-left: 0;
        border-bottom: 1px solid darkgray;
    }

    .cmt-cont{
        width:100%;
    }

    .cmt-editor{
        height: auto;
        position: relative;
        text-align: left;
        padding: 0 0 10px 10px;
        border: 1px solid darkgray;
        border-radius: 12px;
    }

    .cmt-text{
        width: calc(100% - 90px);
        border: 1px solid darkgray;
        text-align: left;
        font-size: 1.0rem;
        min-height: 72px;
        overflow-x: auto;
        
    }

    .cmt-reg-btn{
        display: inline-block;
        top: 33px;
        right: 0px;
        width: 60px;
        height: 83px;
        position: absolute;
        background-color: #e3e3e3;
        color: black;
        border: 1px solid darkgray;
        border-radius: 5px;
        font-weight: 300;
        font-size: 1.0rem;
        margin-right: 7px;
        
    }
    .cmt-reg-btn:hover{
        border: 1px solid darkgray;
        background-color: rgba(66, 83, 90, 0.493);
        color:black;
        transition: 0.3s;
    }
    .edit-textarea{
        width: calc(100% - 90px);
        min-height: 72px;
        text-align: left;
        font-size: 1.0rem;
    }
    .cmt-edit-btn{
        position: absolute;
        display: inline-block;
        margin-left: 5px;
        width: 60px;
        height: 83px;
        background-color: #e3e3e3;
        color: black;
        border: 1px solid darkgray;
        border-radius: 5px;
        font-weight: 300;
        font-size: 1.0rem;
    }
    .edit-btn{
        border-style: none;
    }
    .dlt-btn{
        border-style: none;
    }
    .edit-btn:hover{
        color: dodgerblue;
        transition: 0.1s;
        font-weight: 800;
    }
    .dlt-btn:hover{
        color: red;
        transition: 0.1s;
        font-weight: 800;
    }
</style>
</head>
<body>
    <div class="comment-container" style="width:60%; margin:0 auto;">
        <div class="comment-container">
            <c:choose>
                <c:when test="${empty replyCmt}">
                    <br>
                    <p>작성된 댓글이 없습니다.</p>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${replyCmt}" var="replyCmt">                        
                    </c:forEach>
                </c:otherwise>
            </c:choose>
                <c:forEach items="${replyCmt}" var="replyCmt">
                <div id="comment-List">
                    <ul class="cmt-ul"> 
                        <li>
                        <div class="comment-div">
                            <div style="margin-bottom: 10px;">**${replyCmt.id.substring(2)} / <fmt:formatDate value="${replyCmt.writeDate}" pattern="yyyy-MM-dd" />
                        <c:if test="${sessionScope.id == replyCmt.id}">
                            <div style="float: right; font-size: 13px;">
                                <button type="button" class="edit-btn" onclick="showEditForm(${replyCmt.rno})">수정하기</button>&nbsp; | &nbsp;
                                <button type="button" class="dlt-btn" onclick="location.href='${contextPath}/reply/removeCmt.do?rno=${replyCmt.rno}&articleNO=${article.articleNO}'">삭제하기</button>
                            </div>
                        </c:if>
                            <div class="comment-content">${replyCmt.content}</div>
                            
                        </div>
                        </li>
                        <c:if test="${sessionScope.id == replyCmt.id}">
                        <li>

                            <div class="cmt-edit-cont" id="editForm${replyCmt.rno}" style="display: none;">
                            <form method="post" name="editCmt" action="${contextPath}/reply/modCmt.do">
                                <textarea class="edit-textarea" name="content" placeholder="댓글 수정하기"></textarea>                                    
                                <input type="hidden" name="rno" value="${replyCmt.rno}"/>
                                <input type="hidden" name="articleNO" value="${article.articleNO}"/>
                                <input type="submit" class="cmt-edit-btn" value="수정">
                            </form>
                            </div>
                            
                        </li>
                        </c:if>
                    </ul>
                </div>
                </c:forEach>
        </div>
    <c:choose>
	<c:when test="${!empty member }">
		<form method="post" action="${contextPath}/reply/insertCmt.do?articleNO=${article.articleNO}" name="cmt">
        <br><br>
                <div>
                    <div class="cmt-editor">
                        <div style="margin-top: 5px; margin-bottom: 5px;">
                            <span><strong style="padding: 5px; margin-top: 5px; margin-bottom: 5px;">댓글 쓰기</strong></span>
                        </div>
                        <div>
                            <div class="cmt-cont">                                
                                <input type="hidden" id="id" name="id" value="${member.id}">
                                <textarea class="cmt-text" name="content" placeholder="댓글을 입력하세요"></textarea>                                                               
                            </div>
                            <input type="submit" class="cmt-reg-btn" value="등록">
                        </div>
                        
                </div> 
            </div>
        </form>
        </c:when>
        <c:when test="${empty member }">
            <form method="post" action="${contextPath}/reply/insertCmt.do?articleNO=${article.articleNO}" name="cmt">
                <br><br>
                        <div>
                            <div class="cmt-editor">
                                <div style="margin-top: 5px; margin-bottom: 5px;">
                                    <span><strong style="padding: 5px; margin-top: 5px; margin-bottom: 5px;">댓글 쓰기</strong></span>
                                </div>
                                <div>
                                    <div class="cmt-cont">
                                        <!-- <input type="text" id="id" name="id" value="${member.id}" disabled> -->
                                        <input type="hidden" id="id" name="id" value="${member.id}">
                                        <textarea class="cmt-text" name="content" placeholder="로그인 후 입력가능합니다."></textarea>                                                               
                                    </div>
                                </div>
                                
                        </div> 
                    </div>
                </form>
            </c:when>
        </c:choose>
    </div>
    <script>
        function showEditForm(rno){
            var editForm = document.getElementById('editForm' + rno);
            if(editForm.style.display == 'none'){
                editForm.style.display = 'block';
                
            }else{
                editForm.style.display = 'none';
            }
        };

        
    </script>
</body>
