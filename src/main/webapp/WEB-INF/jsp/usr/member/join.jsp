<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="회원가입"/>
<%@include file="../common/head.jspf" %>
<!-- lodash lib -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
<script>
	let MemberJoin_submitDone = false;
	let validLoginId="";
	function MemberJoin_submit(form) {
		if ( MemberJoin_submitDone ) {
			alert("처리중입니다..");
			return;
		}
		
		form.loginId.value = form.loginId.value.trim();
		
		if ( form.loginId.value.length == 0 ) {
			alert('아이디를 입력해주세요.');
			form.loginId.focus();
			return;
		}
		
		if ( form.loginId.value != validLoginId) {
			alert('해당 아이디는 올바르지 않습니다. 다른 아이디를 입력해주세요.');
			form.loginId.focus();
			return;
		}
		
<<<<<<< HEAD
		form.loginPw.value = form.loginPw.value.trim();
		
		if ( form.loginPw.value.length == 0 ) {
			alert('비밀번호를 입력해주세요.');
			form.loginPw.focus();
=======
		form.loginPwInput.value = form.loginPwInput.value.trim();
		
		if ( form.loginPwInput.value.length == 0 ) {
			alert('비밀번호를 입력해주세요.');
			form.loginPwInput.focus();
>>>>>>> 76b880be23bec569537ad31c681f97af0cc096e0
			return;
		}
		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
		
		if ( form.loginPwConfirm.value.length == 0 ) {
			alert('비밀번호 확인란을 입력해주세요.');
			form.loginPwConfirm.focus();
			return;
		}
<<<<<<< HEAD
		if ( form.loginPwConfirm.value != form.loginPw.value ) {
=======
		if ( form.loginPwConfirm.value != form.loginPwInput.value ) {
>>>>>>> 76b880be23bec569537ad31c681f97af0cc096e0
			alert('비밀번호가 일치하지 않습니다.');
			form.loginPwConfirm.focus();
			return;
		}
		
		form.name.value = form.name.value.trim();
		
		if ( form.name.value.length == 0 ) {
			alert('이름을 입력해주세요.');
			form.name.focus();
			return;
		}
		
		form.nickname.value = form.nickname.value.trim();
		
		if ( form.nickname.value.length == 0 ) {
			alert('닉네임을 입력해주세요.');
			form.nickname.focus();
			return;
		}
		
		form.email.value = form.email.value.trim();
		
		if ( form.email.value.length == 0 ) {
			alert('이메일 입력해주세요.');
			form.email.focus();
			return;
		}
		
<<<<<<< HEAD
		form.cellPhoneNo.value = form.cellPhoneNo.value.trim();
		
		if ( form.cellPhoneNo.value.length == 0 ) {
			alert('휴대전화번호 입력해주세요.');
			form.cellPhoneNo.focus();
			return;
		}
		
=======
		form.cellphoneNo.value = form.cellphoneNo.value.trim();
		
		if ( form.cellphoneNo.value.length == 0 ) {
			alert('휴대전화번호 입력해주세요.');
			form.cellphoneNo.focus();
			return;
		}
>>>>>>> 76b880be23bec569537ad31c681f97af0cc096e0
		form.loginPw.value = sha256(form.loginPwInput.value);
		form.loginPwInput.value = '';
		form.loginPwConfirm.value = '';
		
		
		MemberJoin__submitDone = true;
		form.submit();		
	}
	
	function checkLoginIdDup(el){
		const form = $(el).closest('form').get(0);
		
		if(form.loginId.value.length == 0 ){
			$(form.loginId).next().empty();
			validLoginId = '';
			return;
		}
		
		if(validLoginId == form.loginId.value) {
			return;
		}
		
		$('.loginId-msg').html('<div class="mt-2">체크중...</div>');
		
		
		$.get("../member/getLoginIdDup",{
			isAjax : 'Y',
			loginId : form.loginId.value
		}, function(data) {
			var $message = $(form.loginId).next();
			if(data.resultCode.substr(0,2)=="S-") {
				$message.empty().append('<div class="mt-2 text-green-500">' + data.msg + '</div>');
			}else {
				$message.empty().append('<div class="mt-2 text-red-500">' + data.msg + '</div>');
				validLoginId = '';
			}
			if(data.resultCode)
			if(data.success) {
				validLoginId = data.data1;
			}else {
				validLoginId = '';
			}
		},'json');
	}
	
	/* 로그인 아이디 입력 시, 1초 후 실행 */
	const checkLoginIdDupDebounced = _.debounce(checkLoginIdDup,1000);
	
</script>

<section class="mt-5">
  <div class="container mx-auto px-3">
	<form class="table-box-type-1" method="POST" action="../member/doJoin" onsubmit="MemberJoin_submit(this); return false;">
	<input type="hidden" name="afterJoinUri" value="${param.afterJoinUri }"/>
	<input type="hidden" name="loginPw"/>
      <table>
      <colgroup>
        <col width="200"/>
      </colgroup>
        <tbody>
          <tr>
            <th>로그인아이디</th>
            <td>
            	<input type="text" class="input input-bordered" name="loginId" placeholder="아이디를 입력해주세요." onkeyup="checkLoginIdDupDebounced(this);" autocomplete="off"/>
            	<div class="loginId-msg"></div>
            </td>
          </tr>
          <tr>
            <th>비밀번호</th>
            <td>
            <input type="password" class="input input-bordered" name="loginPwInput" placeholder="비밀번호를 입력해주세요."/>
            </td>
          </tr>
          <tr>
            <th>비밀번호 확인</th>
            <td>
            <input type="password" class="input input-bordered" name="loginPwConfirm" placeholder="비밀번호 확인을 입력해주세요."/>
            </td>
          </tr>
          <tr>
            <th>이름</th>
            <td>
            <input type="text" class="input input-bordered" name="name" placeholder="이름을 입력해주세요." />
            </td>
          </tr>
          <tr>
            <th>닉네임</th>
            <td>
            <input type="text" class="input input-bordered" name="nickname" placeholder="닉네임을 입력해주세요." />
            </td>
          </tr>
          <tr>
            <th>이메일</th>
            <td>
            <input type="email" class="input input-bordered" name="email" placeholder="이메일을 입력해주세요."/>
            </td>
          </tr>
          <tr>
            <th>휴대전화번호</th>
            <td>
            <input type="text" class="input input-bordered" name="cellphoneNo" placeholder="휴대전화번호를 입력해주세요." />
            </td>
          </tr>

          <tr>
            <th>회원가입</th>
            <td>
              <input type="submit" class="btn btn-primary" value="회원가입"/>
              <button type="button" class="btn btn-outline btn-primary" onclick="history.back();">뒤로가기</button>
            </td>
          </tr>
        </tbody>
      </table>
	</form>
  </div>
</section>
<%@include file="../common/foot.jspf" %>