<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 회원 가입 페이지</title>
<style>
table {
	margin: auto;
	width: 500px;
	border: 1px solid gray;
	text-align: center;
}

.td_title {
	font-weight: bold;
	font-size: x-large;
}
</style>
</head>
<script>
var chkId=false;
var idcheck;

function chkForm(f){
	if(!chkId || idcheck!=f.id.value.trim()){
		alert("아이디 중복확인을 하세요!");
		return false;
	}
	if(f.pass.value.trim()==""){
		alert("비밀번호를 입력하세요.");
		f.pass.focus();
		return false;
	}
	if(f.pass.value.trim()!=f.passChk.value.trim()){
		alert("비밀번호가 일치하지 않습니다.");
		f.pass.value="";
		f.passChk.value="";
		f.pass.focus();
		return false;
	}
	f.submit();
}
</script>
<body>
	<form name="joinform" action="memberJoinProcess.mem" method="post" onsubmit="return chkForm(this);">
		<table border=1>
			<tr>
				<td colspan="2" class="td_title">회원 가입 페이지</td>
			</tr>
			<tr>
				<td><label for="id">아이디 : </label></td>
				<td align=left><input type="text" name="member_id" id="member_id" required />
				<input type="button" name="idCheck" value="아이디 중복확인" id="idCheck"
				onclick="window.open('idCheck.mem?openInit=true','','width=300,height=200')"/>
				</td>
			</tr>
			<tr>
				<td><label for="pass">비밀번호 : </label></td>
				<td align=left><input type="password" name="member_pw" id="member_pw" /></td>
			</tr>
			<tr>
				<td><label for="name">이름 : </label></td>
				<td align=left><input type="text" name="member_name" id="member_name" /></td>
			</tr>
			<tr>
				<td><label for="name">전화번호 : </label></td>
				<td align=left><input type="text" name="member_phone" id="member_phone" /></td>
			</tr>
			<tr>
				<td><label for="name">생년월일 : </label></td>
				<td align=left><input type="text" name="member_birth" id="member_birth" /></td>
			</tr>
			<tr>
				<td><label for="gender1"></label>성별 :</td>
				<td align=left>
					<input type="radio" name="member_gender" value="남" id="member_gender" />남자 
					<input type="radio" name="member_gender" value="여" checked id="member_gender" />여자
				</td>
			</tr>
			<tr>
				<td><label for="email">이메일 주소 : </label></td>
				<td align=left><input type="text" name="member_email" id="member_email" /></td>
			</tr>
			<tr>
				<td><label for="doro">우편번호 : </label></td>
				<td align=left><input type="text" name="member_zip" id="member_zip" required />
				<input type="button" name="zip" value="검색" id="zip"
				onclick="window.open('zipCode?openInit=true','','width=450,height=600')"/>
				</td>
			</tr>
			<tr>
				<td><label for="address">주소 : </label></td>
				<td align=left><input type="text" name="member_addr" id="member_addr" /></td>
			</tr>
			<tr>
				<td><label for="address1">주소상세 : </label></td>
				<td align="left"><input type="text" name="member_addr_detail" id="member_addr_detail" /></td>
			</tr>
			<tr>
				<td colspan="2">
				<a href="javascript:joinform.submit()">회원가입</a>&nbsp;&nbsp; 
				<a href="javascript:joinform.reset()">다시작성</a></td>
			</tr>
		</table>
	</form>
</body>
</html>