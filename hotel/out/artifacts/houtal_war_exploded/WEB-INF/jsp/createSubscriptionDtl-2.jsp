<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/11/20
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/calendar.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css" />
    <style type="text/css">
        div.submit{
            text-align:center;
            margin-top: 15px;
            border: solid 1px #ffffff;
        }

        table{
            margin:auto;
            margin-top:3px;
            width:600px;
            border-collapse:collapse;
        }

        td{
            border:solid 1px #ffffff;
            padding:6px 1px;
            text-align:center;
        }

        fieldset{
            border: 0;
        }

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
            <p>下面是满足您预订条件的房间，请选择一个或多个然后点击完成按钮，点击上一步可以更改预定条件。</p>
            ${e.message}
            <form action="${pageContext.request.contextPath}/createSubscriptionDtl/two2?linkman=${subscription.linkman}">
                <fieldset>
                    <table>
                            ${NoRoom}
                        <tr>
                            <c:forEach items="${RoomNo}" var="room" varStatus="Status">
                                <td>
                                    <label for="room_${room.no}">${room.no}</label>
                                    <input type="checkbox" name="room_${room.no}" value="${room.id}" id="room_${room.no}" />
                                </td>
                               <c:if test="${(Status.index+1)%6 == 0}">
                                   <tr></tr>
                               </c:if>
                            </c:forEach>
                        </tr>
                    </table>
                </fieldset>

                <div class="submit">
                    <input type="button" value="上一步" onclick="location='${pageContext.request.contextPath}/createSubscriptionDtl-1?id=${creatSid}&linkman=${creatLinkman}'"/>
                    <input type="submit" value="完成" />
                </div>
            </form>
        </div>
    </div>
    <c:import url="/foot"></c:import>
</div>
</body>
</html>
