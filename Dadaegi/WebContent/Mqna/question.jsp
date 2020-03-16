<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#registForm {
	width: 500px;
	height: 610px;
	margin: auto;
}

h2 {
	text-align: center;
}

table {
	font-size: 9pt;
	margin: auto;
	width: 450px;
}

.td_left {
	width: 150px;
	background: pink;
	text-align: center;
}

.td_right {
	width: 300px;
	background: lightgray;
}

#commandCell {
	text-align: center;
}

img {
	width: 100px;
	height: 100px;
}
</style>
</head>
<body>
	<section id="writeForm">
		<h2>문의 답변 등록</h2>
		<form action="questionReply.qn" method="post" name="questionform">
			<input type="hidden" name="page" value="${nowPage }" /> <input
				type="hidden" name="question_index" value="${question_index }">
			<input type="hidden" name="question_re_ref"
				value="${qnaDetailList.get(0).question_re_ref }"> <input type="hidden"
				name="question_re_lev" value="${qnaDetailList.get(0).question_re_lev }"> <input
				type="hidden" name="question_re_seq" value="${qnaDetailList.get(0).question_re_seq }">

			<table>
				<tr>
					<td class="td_left"><label for="question_name">작성자</label></td>
					<td class="td_right"><input type="text" name="question_name"
						id="question_name" value="${qnaDetailList.get(0).question_name }" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="question_subject">문의제목</label></td>
					<td class="td_right"><input type="text" name="question_name"
						id="question_name"
						value="${qnaDetailList.get(0).question_subject }" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="product_name">상품명</label></td>
					<td class="td_right"><input type="text" name="product_name"
						id="product_name" value="${qnaDetailList.get(0).product_name }" /></td>
				<tr>
					<td class="td_left"><label for="question_file">리뷰사진</label></td>
					<td class="td_right"><img src="${pageContext.request.contextPath}/images/${qnaDetailList.get(0).question_file}"/></td>
				</tr>
				<tr>
					<td class="td_left"><label for="question_date">작성날짜</label></td>
					<td class="td_right"><input type="text" name="question_date"
						id="question_date" value="${qnaDetailList.get(0).question_date }" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="question_content">문의내용</label></td>
					<td><textarea id="question_content" name="question_content"
							cols="40" rows="15">${qnaDetailList.get(0).question_content }</textarea></td>
				</tr>
				<tr>
					<td class="td_left"><label for="question_answer">문의답변</label></td>
					<td><textarea id="question_answer" name="question_answer"
							cols="40" rows="15"></textarea></td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="답변글등록" />&nbsp;&nbsp; <input
					type="reset" value="다시작성" />
			</section>
		</form>
	</section>
</body>
</html>