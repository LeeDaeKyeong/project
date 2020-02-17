<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.Member, java.util.*" %>
<%@ page import="vo.PageInfo" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	margin: auto;
	width: 400px;
	border: 1px solid gray;
	text-align: center;
}
</style>
</head>
<body>
<table>
		<tr>
			<td>아이디 : </td>
			<td>${member.member_id }</td>
		</tr>
		<tr>
			<td>비밀번호 : </td>
			<td>${member.member_pw }</td>
		</tr>
		<tr>
			<td>이름 : </td>
			<td>${member.member_name }</td>
		</tr>
		<tr>
			<td>생년월일 : </td>
			<td>${member.member_birth }</td>
		</tr>
		<tr>
			<td>성별 : </td>
			<td>${member.member_gender }</td>
		</tr>
		<tr>
			<td>전화번호 : </td>
			<td>${member.member_phone }</td>
		</tr>
		<tr>
			<td>이메일 주소:</td>
			<td>${member.member_email }</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="main.cup">메인으로 돌아가기</a>
			</td>
		</tr>
	</table>
</body>
</html>