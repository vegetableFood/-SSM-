<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/11/20
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/calendar.js"></script>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/style/style.css"/>
    <style type="text/css">

        table{
            margin:auto;
            margin-top:0;
            border-collapse:collapse;
            width: 90%;
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
            text-align: center;
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
            <p>
                下面是尚未确认的预定信息，您可以增加、修改或删除订单信息。
            </p>
            ${e.message}
            <table align="center">
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
                    <th>&nbsp;</th>
                </tr>
                <c:forEach items="${subscriptions }" var="subscription">
                    <tr>
                        <td>
                            <div>
                                <fmt:formatDate value="${subscription.cretime}" pattern="yyyy-MM-dd  HH:mm" />
                            </div><%--创建时间--%>
                        </td>
                        <div style="display: none">${subscription.id }</div>
                        <td>
                            <div>${subscription.no }</div><%--订单号--%>
                        </td>
                        <td>
                            <div>${subscription.linkman}</div><%--联系人--%>
                        </td>
                        <td>
                            <div>${subscription.phone }</div><%--联系电话--%>
                        </td>
                        <td>
                            <div>${subscription.email }</div><%--电子邮件--%>
                        </td>
                        <td>
                            <div>
                                <a href="${pageContext.request.contextPath}/subscription/deleteOneItem?id=${subscription.id}&mid=${member.id}"
                                   onclick="return confirm('真的要删除该订单及其明细信息吗？')">删除</a>
                                <a href="${pageContext.request.contextPath}/editSubscription?linkman=${subscription.linkman}&phone=${subscription.phone}&email=${subscription.email}&id=${subscription.id}">联系人信息</a>
                                <a href="${pageContext.request.contextPath}/subscriptionDtl/selectOrderRoom?id=${subscription.id}&linkman=${subscription.linkman}">客房信息</a>
                            </div>
                        </td>

                    </tr>
                </c:forEach>
            </table>
            <div class="button">
                <input type="button" value="新建订单" onclick="location='${pageContext.request.contextPath}/newSubscription'"/>
            </div>
        </div>
    </div>
    <c:import url="/foot"></c:import>
</div>
</body>
</html>

