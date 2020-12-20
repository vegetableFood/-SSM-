<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/11/20
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="../js/calendar.js"></script>
    <link rel="stylesheet" type="text/css" href="style/style.css"></link>
    <style type="text/css">
        form{
            margin: 15px 0;
        }

        fieldset{
            padding: 0 1em 1em 1em;
            margin: auto;
            width: 400px;
        }

        fieldset div{
            margin: 5px 0;
        }

        legend {
            padding: 1em;
        }

        label{
            float: left;
            width: 100px;
        }

        fieldset div input{
            width: 200px;
        }

        fieldset.buttons{
            border: solid 1px #ffffff;
            text-align: center;
            display:block;
            margin-top: 20px;
        }

        div.label{
            margin:auto;
            width: 400px;
            margin-top: 20px;
        }

    </style>
    <title>修改订单</title>
</head>
<body>
<div id="container">
    <c:import url="/header"></c:import>
    <div id="content">
        <c:import url="/left"></c:import>
        <div class="subcontent">
            <form action="${pageContext.request.contextPath}/subscription/updateOderMessage">
                <fieldset>
                    <legend>联系人信息</legend>
                    <div style="display:none">
                        <label for="id"></label>
                        <input type="text" name="id" id="id" value="${param.id}"/>
                    </div>
                    <div>
                        <label for="linkman">联系人</label>
                        <input type="text" name="linkman" id="linkman" value="${param.linkman}"/>
                    </div>
                    <div>
                        <label for="phone">联系电话</label>
                        <input type="text" name="phone" id="phone" value="${param.phone}"/>
                    </div>
                    <div>
                        <label for="email">电子邮件</label>
                        <input type="text" name="email" id="email" value="${param.email}"/>
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <input type="button" value="取消" onclick="location='${pageContext.request.contextPath}/subscription/selectAllSubscription?id=${member.id}'"/>
                    <input type="submit" value="保存" />
                </fieldset>
            </form>
        </div>
    </div>
    <c:import url="/foot"></c:import>
</div>
</body>
</html>
