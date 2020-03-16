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
img{
	width : 100px;
	height : 100px;
}
</style>
</head>
<body>
	<section id="writeForm">
		<h2>리뷰 답변 등록</h2>
		<form action="questionReply.qn" method="post" name="questionform">
			<input type="hidden" name="page" value="${nowPage }" /> <input
				type="hidden" name="review_index" value="${review_index }">
			<input type="hidden" name="review_re_ref" value="${review_re_ref }">
			<input type="hidden" name="review_re_lev" value="${review_re_lev }">
			<input type="hidden" name="review_re_seq" value="${review_re_seq }">

			<table>
				<tr>
					<td class="td_left"><label for="review_name">작성자</label></td>
					<td class="td_right"><input type="text" name="review_name"
						id="review_name" value="${reviewDetailList.get(0).review_name }" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="review_subject">리뷰제목</label></td>
					<td class="td_right"><input type="text" name="review_subject"
						id="review_subject"
						value="${reviewDetailList.get(0).review_subject }" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="product_name">상품명</label></td>
					<td class="td_right"><input type="text" name="product_name"
						id="product_name" value="${reviewDetailList.get(0).product_name }" /></td>
				<tr>
					<td class="td_left"><label for="review_file">리뷰사진</label></td>
					<td class="td_right"><img src="${pageContext.request.contextPath}/images/${reviewDetailList.get(0).review_file}"/></td>
				</tr>
				<tr>
					<td class="td_left"><label for="review_date">작성날짜</label></td>
					<td class="td_right"><input type="text" name="review_date"
						id="review_date" value="${reviewDetailList.get(0).review_date }" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="review_content">리뷰내용</label></td>
					<td><textarea id="review_content" name="review_content"
							cols="40" rows="15">${reviewDetailList.get(0).review_content }</textarea></td>
				</tr>
				<tr>
					<td class="td_left"><label for="review_answer">리뷰답변</label></td>
					<td><textarea id="review_answer" name="review_answer"
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