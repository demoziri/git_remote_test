<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="비밀번호 확인"/>
<%@include file="../common/head.jspf" %>

<script>
	let MemberCheckPassword_submitDone = false;
	function MemberCheckPassword_submit(form) {
		if ( MemberCheckPassword_submitDone ) {
			return;
		}    
		
		form.loginPwInput.value = form.loginPwInput.value.trim();
		if(form.loginPwInput.value == 0){
			alert('비밀번호를 입력해주세요.');
			form.loginPwInput.focus();
			return;
		}
		
		form.loginPw.value = sha256(form.loginPwInput.value); 
		form.loginPwInput.value='';
		
		MemberCheckPassword_submitDone = true;
		form.submit();		
	}
</script>


<section class="mt-5">
  <div class="container mx-auto">
  	<form class="table-box-type-1" action="../member/doCheckPassword" method="POST" onsubmit="MemberCheckPassword_submit(this); return false;">
  	<input type="hidden" name="replaceUri" value="${param.replaceUri }"/>
  	<input type="hidden" name="loginPw" value=""/>
	  <table>
	  <colgroup>
	  	<col width="200"/>
	  </colgroup>
	  	<tbody>
	  		<tr>
	  			<th>로그인 아이디</th>
	  			<td>${rq.loginedMember.loginId }</td>
	  		</tr>
	  		<tr>
	  			<th>로그인 비밀번호</th>
	  			<td><input required="required" type="password" class="w-96 input input-bordered" name="loginPwInput" placeholder="로그인비밀번호" /></td>
	  		</tr>
	  		<tr>
	  			<th>비밀번호 확인</th>
	  			<td>
	  				<input type="submit" class="btn btn-primary" value="비밀번호 확인"/>
	  				<button type="button" class="btn btn-success" onclick="history.back();">뒤로가기</button>
	  			</td>
	  		</tr>
	  	</tbody>
	  </table>
  	</form>
  </div>
</section>

<%@include file="../common/foot.jspf" %>