<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="게시물 수정"/>
<%@include file="../common/head.jspf" %>
<%@include file="../../common/toastUiEditorLib.jspf" %>

<script>
	let ArticleModify_submitDone = false;
	function ArticleModify_submit(form) {
		if ( ArticleModify_submitDone ) {
			alert("처리중입니다.......");
			return;
		}    
		
		const editor = $(form).find('.toast-ui-editor').data('data-toast-editor');
		alert(editor);
		const markdown = editor.getMarkdown().trim();
		
		if ( markdown.length == 0 ) {
			alert('내용을 입력해주세요.');
			editor.focus();
			return;
		}
		
		form.body.value = markdown;
		
		ArticleModify_submitDone = true;
		form.submit();		
	}
</script>

<section class="mt-5">
	<div class="container mx-auto px-3">
	<form class="table-box-type-1" action="../article/doModify" method="POST" onsubmit="ArticleModify_submit(this); return false;">
	<input type="hidden" name="id" value="${article.id}"/>
	<input type="hidden" name="body"/>
      <table>
      <colgroup>
        <col width="200"/>
      </colgroup>
        <tbody>
          <tr>
            <th>번호</th>
            <td>${article.id}</td>
          </tr>
          <tr>
            <th>작성날짜</th>
            <td>${article.getRegDateForPrint()}</td>
          </tr>
          <tr>
            <th>수정날짜</th>
            <td>${article.getUpdateDateForPrint()}</td>
          </tr>
          <tr>
            <th>작성자</th>
            <td>${article.extra_writerName}</td>
          </tr>
           <tr>
            <th>조회수</th>
            <td>
            	<span class="text-blue-700 article-detail__hit-count">${article.hitCount}</span>
            </td>
          </tr>
          <tr>
            <th>추천</th>
            <td>
            	<span class="text-blue-700">${article.goodReactionPoint}</span>
            </td>
          </tr>
          <tr>
            <th>제목</th>
            <td>
            	<input type="text" class="w-96 input input-bordered" name="title" placeholder="제목" value="${article.title}" />
            </td>
          </tr>
          <tr>
            <th>내용</th>
            <td>
		 	   <div class="toast-ui-editor">
        		  <script type="text/x-template">${article.body}</script>
        	   </div>
            </td>
          </tr>
          <tr>
            <th>수정</th>
            <td>
              <input type="submit" class="btn btn-warning" value="수정" />
            </td>
          </tr>
        </tbody>
      </table>
    
	<div class="btns">
		<button class="btn btn-link" type="button" onclick="history.back();">뒤로가기</button>
		<a class="btn btn-link"  href="../article/modify?id=${article.id }">게시물 수정</a>
		<c:if test="${article.extra_actorCanDelete }">
		<a class="btn btn-link" onclick="if(confirm('정말 삭제하시겠습니까?')==false)return false;" href="../article/doDelete?id=${article.id }">게시물 삭제</a>
		</c:if>
	</div>
	
  </form>
</div>
	
</section>
<%@include file="../common/foot.jspf" %>