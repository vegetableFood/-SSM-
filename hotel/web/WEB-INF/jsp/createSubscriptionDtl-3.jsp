<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/11/20
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/calendar.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css" />
    <style type="text/css">
        #content p{
            text-align: center;
            margin-top: 20px;
        }

    </style>
    <title>预定客房</title>
</head>
<body>
<div id="container">
    <c:import url="/header"></c:import>
    <div id="content">
        <c:import url="/left"></c:import>
        <div class="subcontent">
            <p>
                恭喜你，房间预订成功，我们会及时与您联系并再次确认预定信息。在系统确认之前，您仍然可以修改所有预定信息。
            </p>
            <p>
                <a href="${pageContext.request.contextPath}/subscriptionDtl/selectOrderRoom?id=${creatSid}">继续预定</a>
            </p>
        </div>
        <div style="height:130px;"></div>
    </div>
    <c:import url="/foot"></c:import>
</div>
</body>
</html>
