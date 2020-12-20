<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/11/20
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css"></link>
    <style type="text/css">

        table{
            margin:auto;
            margin-top:0;
            border-collapse:collapse;
            width: 90%;
        }

        caption{
            padding: 20px 0;
        }

        th,td{
            border:solid 1px #000000;
        }

        th{
            padding:6px 1px;
        }

        td{
            padding:8px 1px;
        }

        td div{
            text-align: center;
        }

        .date{
            width: 50px;
            text-align:center;
        }

        #content div.button{
            text-align:center;
            padding-top:15px;
        }

        #content p{
            margin: 20px 0;
            text-indent: 2em;
            line-height: 1.5em;
        }
    </style>
    <title>会员中心</title>
</head>
<body>
<div id="container">
    <c:import url="/header"></c:import>
    <div id="content" style="width:98%;position:relative">
        <c:import url="/left"></c:import>
        <div class="subcontent">
            <table align="center">
                <caption>历史预定信息</caption>
                <colgroup>
                    <col class="datetime" />
                    <col class="no" />
                    <col />
                    <col />
                    <col />
                    <col />
                </colgroup>
                <tr>
                    <th>创建时间</th>
                    <th>订单号</th>
                    <th>联系人</th>
                    <th>联系电话</th>
                    <th>电子邮件</th>
                    <th>状态</th>
                </tr>
            <c:forEach items="${selectHistoryOrders}" var="selectHistoryOrder">
                <tr>
                    <td><div><fmt:formatDate value="${selectHistoryOrder.cretime}" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate> </div></td>
                    <td><div><a href="subscriptionView.html">${selectHistoryOrder.no}</a></div></td>
                    <td><div>${selectHistoryOrder.linkman}</div></td>
                    <td>${selectHistoryOrder.phone}</td>
                    <td>@${selectHistoryOrder.email}</td>
                    <td><div>
                        <c:if test="${selectHistoryOrder.status == 2}">
                            以生效
                        </c:if>
                        <c:if test="${selectHistoryOrder.status == 3}">
                            已取消
                        </c:if>
                    </div></td>
                </tr>
            </c:forEach>
            </table>
        </div>
        <c:import url="/foot"></c:import>
    </div>
</body>
</html>