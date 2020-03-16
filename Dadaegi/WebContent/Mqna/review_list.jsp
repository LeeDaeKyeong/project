<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#listForm {
	width: 100%;
	border: 1px pink solid;
	margin: auto;
}

#pageList {
	text-align: center;
}

#reviewList {
	margin: auto 0;
	border: 1px solid #000000;
	width: 1000px;
	margin: auto;
	text-align: center;
}

.tr_top {
	background-color: pink;
	text-align: center;
}

img {
	width: 100px;
	height: 100px;
}
</style>
<body>
	<!-- 리뷰 리스트  -->
	<h2>리뷰 리스트</h2>
	<section id="listForm">
		<p>리뷰목록</p>
		<c:choose>
			<c:when test="${reviewList ne null }">
				<form method="post">
					<table id="reviewList" width="100%"
						class="table table-bordered table-hover text-center">
						<thead>
							<tr class="tr_top" height="40px">
								<td>리뷰번호</td>
								<td>리뷰제목</td>
								<td>리뷰사진</td>
								<td>작성자</td>
								<td>상품명</td>
								<td>작성날짜</td>
								<td>답변상태</td>
								<td>답변하기</td>
							</tr>
						</thead>
						<c:forEach items="${reviewList }" var="review">
							<tbody>
								<tr height="40px">
									<td
										style="${review.review_status eq '답변완료' ? 'background-color : lightgray' : 'background-color : white'  };">${review.review_index }</td>
									<td
										style="${review.review_status eq '답변완료' ? 'background-color : lightgray' : 'background-color : white'  };">${review.review_subject }</td>
									<td
										style="${review.review_status eq '답변완료' ?  'background-color : lightgray' : 'background-color : white'  };"><img
										src="${pageContext.request.contextPath}/images/${review.review_file }" /></td>
									<td
										style="${review.review_status eq '답변완료' ? 'background-color : lightgray' : 'background-color : white'  };">${review.review_name }</td>
									<td
										style="${review.review_status eq '답변완료' ? 'background-color : lightgray' : 'background-color : white'  };">${review.product_name }</td>
									<td
										style="${review.review_status eq '답변완료' ?  'background-color : lightgray' : 'background-color : white'  };">${review.review_date }</td>
									<td
										style="${review.review_status eq '답변완료' ?  'background-color : lightgray' : 'background-color : white'  };">${review.review_status }</td>
									<td
										style="${review.review_status eq '답변완료' ? 'background-color : lightgray' : 'background-color : white'  };"
										onClick="window.open('review.qn?review_index=${review.review_index}','new','width=550px,height=800px,location=no,status=no,scrollbars=no');">
										<c:choose>
											<c:when test="${review.review_status eq '답변완료' }">
										-
										</c:when>
											<c:otherwise>
												<input type="submit" value="답변하기" />
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
					<section id="pageList">
						<c:choose>
							<c:when test="${pageInfo.page <=1 }">
						[이전]&nbsp;
					</c:when>
							<c:otherwise>
								<a href="reviewlist.qn?page=${pageInfo.page-1 }">[이전]</a>&nbsp;
					</c:otherwise>
						</c:choose>
						<c:forEach var="a" begin="${pageInfo.startPage }"
							end="${pageInfo.endPage }" step="1">
							<c:choose>
								<c:when test="${a==pageInfo.page }">
							[${a }]
						</c:when>
								<c:otherwise>
									<a href="reviewlist.qn?page=${a }">[${a }] </a>&nbsp;
						</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pageInfo.page >= pageInfo.maxPage }">
						[다음]
					</c:when>
							<c:otherwise>
								<a href="reviewlist.qn?page=${pageInfo.page+1 }">[다음]</a>
							</c:otherwise>
						</c:choose>
					</section>
			</c:when>
			<c:otherwise>
				<table>
					<tr>
						<td align="center"><section id="emptyArea">등록된 리뷰가
								없습니다.</section></td>
					</tr>
				</table>
				</form>
			</c:otherwise>
		</c:choose>
	</section>
</body>
</html>