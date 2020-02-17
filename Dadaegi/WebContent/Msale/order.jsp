<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript"
	src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<style>
#listForm {
	width: 100%;
	border: 1px pink solid;
	margin: auto;
}

#pageList {
	text-align: center;
}

#orderList {
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
</style>

<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript">
	function checkAll(theForm) {
		if (theForm.remove.length == undefined) {
			theForm.remove.checked = theForm.allCheck.checked;
		} else {
			for (var i = 0; i < theForm.remove.length; i++) {
				theForm.remove[i].checked = theForm.allCheck.checked;
			}
		}
	}
	window.onload = function() {

		// 테이블의 Row 클릭시 값 가져오기
		$("#reservationList tr")
				.click(
						function() {
							alert('aaa');
							var a = document.getElementById("s").value;
							window.open('AAAA.aaa?id='+a+'&', '', '');
							/*
							var str = ""
							var tdArr = new Array(); // 배열 선언

							// 현재 클릭된 Row(<tr>)
							var tr = $(this);
							var td = tr.children();

							// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
							console.log("클릭한 Row의 모든 데이터 : " + tr.text());

							// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
							td.each(function(i) {
								tdArr.push(td.eq(i).text());
							});

							console.log("배열에 담긴 값 : " + tdArr);

							// td.eq(index)를 통해 값을 가져올 수도 있다.
							var no = td.eq(0).text();
							var userid = td.eq(1).text();
							var name = td.eq(2).text();
							var email = td.eq(3).text();

							str += " * 클릭된 Row의 td값 = No. : <font color='red'>"
									+ no + "</font>"
									+ ", 아이디 : <font color='red'>" + userid
									+ "</font>" + ", 이름 : <font color='red'>"
									+ name + "</font>"
									+ ", 이메일 : <font color='red'>" + email
									+ "</font>";

							$("#ex1_Result1").html(
									" * 클릭한 Row의 모든 데이터 = " + tr.text());
							$("#ex1_Result2").html(str);
							*/
						});

	}
</script>
</head>
<body onload="init()">
	<h2>주문 리스트</h2>

	<section id="listForm">
		<p>주문목록</p>
		<c:choose>
			<c:when test="${orderList ne null }">
				<form method="post">
					<table id="orderList" width="100%"
						class="table table-bordered table-hover text-center">
						<thead>
							<tr class="tr_top" height="40px">
								<td>주문일자</td>
								<td>주문번호</td>
								<td>주문자명</td>
								<td>주문방법</td>
								<td>주문금액</td>
								<td>결제상태</td>
								<td>주문상태</td>
							</tr>
						</thead>
						<c:forEach items="${orderList }" var="order">
							<tbody>
								<tr  height="40px"
									style="cursor: pointer;"
									onClick="window.open('orderdetail.sa?order_num=${order.order_num }&member_name=${order.member_name }&member_phone=${order.member_phone }&member_email=${order.member_email }&member_birth=${order.member_birth }&member_gender=${order.member_gender }','new','width=1300px,height=550px,location=no,status=no,scrollbars=no');">
									<td style = "${order.order_status eq '주문완료' || order.payment_status eq '결제완료' ? 'background-color : lightgray' : 'background-color : white'  };">${order.order_date }</td>
									<td style = "${order.order_status eq '주문완료' ? 'background-color : lightgray' : 'background-color : white'  };">${order.order_num }</td>
									<td style = "${order.order_status eq '주문완료' ? 'background-color : lightgray' : 'background-color : white'  };">${order.member_name }</td>
									<td style = "${order.order_status eq '주문완료' ? 'background-color : lightgray' : 'background-color : white'  };">${order.order_way }</td>
									<td style = "${order.order_status eq '주문완료' ? 'background-color : lightgray' : 'background-color : white'  };">${order.total_price }</td>
									<td style = "${order.payment_status eq '결제완료' ? 'background-color : lightgray' : 'border : solid 1px pink'  };">${order.payment_status }</td>
									<td style = "${order.order_status eq '주문완료' ? 'background-color : lightgray' : 'border : solid 1px pink'  };">${order.order_status }</td>
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
								<a href="order.sa?page=${pageInfo.page-1 }">[이전]</a>&nbsp;
					</c:otherwise>
						</c:choose>
						<c:forEach var="a" begin="${pageInfo.startPage }"
							end="${pageInfo.endPage }" step="1">
							<c:choose>
								<c:when test="${a==pageInfo.page }">
							[${a }]
						</c:when>
								<c:otherwise>
									<a href="order.sa?page=${a }">[${a }] </a>&nbsp;
						</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pageInfo.page >= pageInfo.maxPage }">
						[다음]
					</c:when>
							<c:otherwise>
								<a href="order.sa?page=${pageInfo.page+1 }">[다음]</a>
							</c:otherwise>
						</c:choose>
					</section>
			</c:when>
			<c:otherwise>
				<table>
					<tr>
						<td align="center"><section id="emptyArea">등록된 예약이
								없습니다.</section></td>
					</tr>
				</table>
				</form>
			</c:otherwise>
		</c:choose>
	</section>
	<div class="col-lg-12" id="ex1_Result1"></div>
	<div class="col-lg-12" id="ex1_Result2"></div>
</body>
</html>