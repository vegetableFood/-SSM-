<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/style/style.css"></link>
<style type="text/css">
img {
	margin-right: 5px;
	margin-bottom: 5px;
	border: 0;
	float: right;
}

p {
	margin: 0;
	padding: 0;
	padding-top: 15px;
	border: solid 1px #ffffff;
}

table {
	padding: 0;
	margin: 0;
}

td {
	padding: 3px 1px;
	border: solid 1px #ffffff;
}

form {
	margin: 0;
	padding: 0;
}

label {
	width: 70px;
}

input.field {
	width: 90px;
}

div.buttons {
	padding: 5px 0;
	text-align: center;
	border: solid 1px #ffffff;
}

div.login {
	width: 160px;
	border: dashed 1px #00FFCC;
	float: left;
	margin: 15px 8px 5px 0;
}
</style>
<title>腾达宾馆</title>
</head>
<body>
	<div id="container">
		<c:import url="/header"></c:import>
		<div id="content">
			<div class="login">
				<form action="${pageContext.request.contextPath}/member/login">
					<table>
						<tr>
							<td><label for="username">用户名</label></td>
							<td><input type="text" name="username" id="username"
								class="field" /></td>
						</tr>
						<tr>
							<td><label for="password">密码</label></td>
							<td><input type="password" name="pwd" id="password"
								class="field" /></td>
						</tr>
					</table>
					<div class="buttons">
						<input type="submit" value="登录" /> <input type="button"
							value="注册" onclick="location='${pageContext.request.contextPath}/register-1'" />
					</div>
				</form>
			</div>
			<p>腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，
				腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区 腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，
				腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区</p>
			<img src="${pageContext.request.contextPath }/images/hotel001.jpg" />
			<p>腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，
				腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区 腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，
				腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区 腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，
				腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区 腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，
				腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区 腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，
				腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区 腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，
				腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区 腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，
				腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区 腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，
				腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区 腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，
				腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区</p>
		</div>
		<c:import url="/foot"></c:import>
	</div>
</body>
</html>
