<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/11/20
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/calendar.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css" />
    <style type="text/css">
        h1{
            text-align: center;
            font-size: 1em;
            padding: 0.3em 0;
            margin-top: 20px;
        }

        div.submit{
            text-align:center;
            margin-top: 15px;
            border: solid 1px #ffffff;
        }

        table{
            margin:auto;
            margin-top:5px;
            width:720px;
            border-collapse:collapse;
        }

        th,td{
            border:solid 1px #000000;
            padding:6px 1px;
        }

        .category{
            text-align:center;
        }

        .date{
            text-align:center;
        }

        .opt{
            text-align:center;
        }

        td div{
            text-align: center;
            margin: 0;
            padding: 0;
        }

        .text{
            width:390px;
        }

    </style>
    <title>订单明细信息</title>
</head>
<body>
<div id="container">
    <c:import url="/header"></c:import>
    <div id="content">
        <c:import url="/left"></c:import>
        ${e.message}
        <div class="subcontent">
            <h1>订单明细信息管理</h1>
            <table>
                <colgroup>
                    <col class="category" />
                    <col class="no" />
                    <col />
                    <col />
                    <col span="2" class="date" />
                    <col class="opt" />
                </colgroup>
                <tr>
                    <th>房间类型</th>
                    <th>房间号</th>
                    <th>预定方式</th>
                    <th>单价</th>
                    <th>入住日期</th>
                    <th>退房日期</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${Subscription_dtls}" var="Subscription_dtl">
                    <tr>
                        <td><div>标准间</div></td>
                        <td><div>${Subscription_dtl.rooms[0].no}</div></td>
                        <td><div>
                            <c:if test="${Subscription_dtl.residetype == 2}">
                                整个房间
                            </c:if>
                            <c:if test="${Subscription_dtl.residetype == 1}">
                                单个床位
                            </c:if>
                        </div></td>
                        <td><div>${Subscription_dtl.price}</div></td>
                        <td>
                            <div>
                                <fmt:formatDate value="${Subscription_dtl.sdate}" pattern="yyyy-MM-dd hh:mm" />
                            </div>
                        </td>
                        <td>
                            <div>
                                <fmt:formatDate value="${Subscription_dtl.edate}" pattern="yyyy-MM-dd hh:mm" />
                            </div>
                        </td>
                        <td>
                            <div>
                                <a href="${pageContext.request.contextPath}/subscriptionDtl/deleteOrderRoom?id=${Subscription_dtl.id}&sid=${Subscription_dtl.sid}" onclick="return confirm('真的要删除该预定细信息吗？')">删除</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>

            </table>
            <div class="submit">
                <input type="button" value="返回" onclick="location='${pageContext.request.contextPath}/subscription/selectAllSubscription?id=${member.id}'"/>
                <input type="button" value="新增预定" onclick="location='${pageContext.request.contextPath}/createSubscriptionDtl-1?id=${param.id}&linkman=${param.linkman}'"/>
            </div>
        </div>
    </div>
    <c:import url="/foot"></c:import>
</div>
</body>
</html>
