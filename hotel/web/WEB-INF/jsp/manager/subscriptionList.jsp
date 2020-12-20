<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/11/29
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/calendar.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css" />
    <style type="text/css">

        #content div{
            margin: 10px 0px;
        }

        table{
            margin:auto;
            margin-top:20px;
            width:700px;
            border-collapse:collapse;
        }

        th,td{
            border:solid 1px #000000;
            padding:6px 1px;
        }

        .index{
            width: 50px;
            text-align:center;
        }

        .no{
            text-align:center;
        }

        .shortname{
            text-align:center;
        }

        .phone{
        }

        .email{
        }

        .status{
        }

        .opt{
            text-align:center;
        }

        #content div{
            text-align:center;
            margin:0;
            padding:0;
        }

        #content div.button{
            text-align:center;
            padding-top:15px;
        }

    </style>
    <title>订单列表</title>
</head>
<body>
<div id="container">
    <c:import url="/manager/managerHeader"></c:import>
    <div id="content">
        <table>
            <colgroup>
                <col class="index" />
                <col class="no" />
                <col class="shortname" />
                <col class="phone" />
                <col class="email" />
                <col class="status" />
                <col class="opt" />
            </colgroup>
            <tr>
                <th>序号</th>
                <th>订单号</th>
                <th>联系人</th>
                <th>联系电话</th>
                <th>电子邮件</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${managerQueryOrders}" var="managerQueryOrder" varStatus="s">
                <tr>
                    <td><div>${s.index +1}</div></td>
                    <td><div><a href="${pageContext.request.contextPath}/ManagerQueryDetail/selectUserRoomDetail?no=${managerQueryOrder.no}">${managerQueryOrder.no}</a></div></td>
                    <td><div>${managerQueryOrder.linkman}</div></td>
                    <td>${managerQueryOrder.phone}</td>
                    <td>${managerQueryOrder.email}</td>
                    <td>
                        <div>
                            <c:if test="${managerQueryOrder.status == 1}">
                                待确认
                            </c:if>
                            <c:if test="${managerQueryOrder.status == 2}">
                                已确认
                            </c:if>
                            <c:if test="${managerQueryOrder.status == 3}">
                                已取消
                            </c:if>
                        </div>
                    </td>
                    <td>
                        <div>
                            <c:if test="${managerQueryOrder.status == 1}">
                                <a href="${pageContext.request.contextPath}/ManagerQueryDetail/deleteOrderRoom?id=${managerQueryOrder.id}&no=${managerQueryOrder.no}">删除</a>
                            </c:if>
                            <c:if test="${managerQueryOrder.status == 2}">
                                &nbsp;
                            </c:if>
                            <c:if test="${managerQueryOrder.status == 3}">
                                <a href="#">删除</a>
                            </c:if>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <c:import url="/foot"></c:import>
</div>
</body>
</html>