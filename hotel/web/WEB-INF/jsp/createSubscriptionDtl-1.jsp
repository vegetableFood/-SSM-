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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css"></link>
    <style type="text/css">
        div.submit{
            text-align:center;
            margin-top: 15px;
            border: solid 1px #ffffff;
        }

        label{
            float: left;
            width: 80px;
            text-align: left;
        }

        fieldset{
            position:relative;
            width:300px;
            margin:auto;
            margin-top:20px;
        }

        fieldset select{
            width:120px;
        }

        fieldset input{
            width:120px;
        }

        div.row{
            position: relative;
            padding:8px 0;
            border: solid 1px #ffffff;
        }

        div.column{
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
            <p>请输入您要预定的房间类型以及预订的起始日期，系统会显示可用的房间并供您选择。</p>
            <form action="${pageContext.request.contextPath}/createSubscriptionDtl/two">
                <fieldset>
                    <div style="display:none;"><input type="text" name="linkman" value="${param.linkman}"/></div>
                    <div style="display:none;"><input type="text" name="sid" value="${param.id}"/></div>
                    <div class="row">
                        <div class="column">
                            <label for="rootType">客房类型</label>
                            <select name="rootType" id="rootType">
                                <option value="1">单人间</option>
                                <option value="2">标准间</option>
                                <option value="3">豪华标准间</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="column">
                            <label for="bookType">预定方式</label>
                            <select name="bookType" id="bookType">
                                <option value="1">单个床位</option>
                                <option value="2">整个房间</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="column">
                            <label for="startDate">开始日期</label>
                            <input type="text" name="startDate" id="startDate" readonly="readonly"
                                   onclick="new Calendar().show(this)"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="column">
                            <label for="endDate">结束日期</label>
                            <input type="text" name="endDate" id="endDate" readonly="readonly"
                                   onclick="new Calendar().show(this)"/>
                        </div>
                    </div>
                </fieldset>
                <div class="submit">
                    <input type="button" value="返回" onclick="location='${pageContext.request.contextPath}/subscriptionDtl/selectOrderRoom?id=${param.id}'"/>
                    <input type="submit" value="下一步" />
                </div>
            </form>
        </div>
    </div>
    <c:import url="/foot"></c:import>
</div>
</body>
</html>
