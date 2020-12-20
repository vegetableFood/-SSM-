<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/calendar.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/style/style.css"></link>
<style type="text/css">
caption {
	padding: 20px 0;
}

table {
	margin: auto;
	width: 800px;
	border-collapse: collapse;
}

th,td {
	border: solid 1px #000000;
	padding: 6px 1px;
}

.type {
	width: 120px;
}

.price {
	width: 100px;
}

.description {
	
}

td div {
	text-align: center;
	padding: 0;
	margin: 0;
}

#content div.button {
	text-align: center;
	padding-top: 15px;
}
</style>
<title>客房价格</title>
</head>
<body>
	<div id="container">
		
		<c:import url="/header"></c:import>
		
		<div id="content">
			<table>
				<colgroup>
					<col class="type" />
					<col span="2" class="price" />
					<col class="description" />
				</colgroup>

				<caption>
					房间价格及设施说明
					</cation>

					<tr>
						<th rowspan="2">客房类型</th>
						<th colspan="2">价格</th>
						<th rowspan="2">房间概况</th>
					</tr>

					<tr>
						<th>床位价格</th>
						<th>整间价格</th>
					</tr>


					<c:forEach items="${categories }" var="category">
						<tr>
							<td><div>${category.name }</div>
							</td>
							<td><div>${category.bedprice }</div>
							</td>
							<td><div>${category.roomprice }</div>
							</td>
							<td>${category.description }</td>
						</tr>
					</c:forEach>
			</table>
		</div>
		<c:import url="/foot"></c:import>
	</div>
</body>
</html>