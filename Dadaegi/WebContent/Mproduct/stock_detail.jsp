<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
form {
	width: 29.17%;
	height: auto;
	float: left;
	margin-right: 1.5625%;
	margin-bottom: 20px;
	margin-top: 20px;
	padding: 0.5%;
	border: 1px dotted #333;
	border-radius: 10px;
}

table:first-child {
	margin-left: 2.083%
}

table h2 {
	padding-left: 30px;
}

tr {
	margin: 10px;
	height: 50px;
}

#sub {
	background-color: pink;
	width: 100px;
	text-align: center;
}

body {
	font-family: 'Malgun Gothic';
	font-size: 9pt;
}

form {
	
}

#bottom {
	border: none;
	clear: both;
	text-align: center;
}

a {
	text-decoration: none;
}

#subtable {
	padding: 0px;
	margin: 0px;;
}

#subtable td {
	background-color: white;
}

img {
	width: 30px;
	height: 40px;
}
td img{
	width : 100px;
	height : 100px;
}
</style>
</head>
<body>
	<form id="left">
		<h2>
			<img src="images/cake.png"> 재고정보
		</h2>
		<table>
			<tr>
				<td id="sub">상품코드</td>
				<td colspan="3">${stockDetailList.get(0).product_code }</td>
			</tr>
			<tr>
				<td id="sub">상품이름</td>
				<td colspan="3">${stockDetailList.get(0).product_name }</td>
			</tr>
			<tr>
				<td id="sub">상품이미지</td>
				<td colspan="3"><img
					src="${pageContext.request.contextPath}/images/${stockDetailList.get(0).product_image }"/></td>
			</tr>
			<tr>
				<td id="sub">상품가격</td>
				<td colspan="3">${stockDetailList.get(0).product_price}원</td>
			</tr>
		</table>
	</form>
	<form id="center">
		<h2>
			<img src="images/cupcake.png"> 입고정보
		</h2>
		<table>
			<c:forEach items="${stockDetailList }" var="stockDetail">
				<tr>
					<td id="sub">입고날짜</td>
					<td>${stockDetail.inout_date }</td>
				</tr>
				<tr>
					<td id="sub">입고수량</td>
					<td>${stockDetail.stock_quantity }</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	<form id="right">
		<h2>
			<img src="images/cupcake (1).png"> 출고정보
		</h2>
		<table>
			<c:forEach items="${stockDetailList }" var="stockDetail">
				<tr>
					<td id="sub">출고날짜</td>
					<td>${stockDetail.inout_date }</td>
				</tr>
				<tr>
					<td id="sub">출고수량</td>
					<td>${stockDetail.stock_quantity }</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>