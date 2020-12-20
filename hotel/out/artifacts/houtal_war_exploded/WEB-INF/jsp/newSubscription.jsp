<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/11/20
  Time: 14:49
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

    </style>
    <title>新建订单</title>
</head>
<body>
<div id="container">
    <c:import url="/header"></c:import>
    <div id="content">
        <c:import url="/left"></c:import>
        <div class="subcontent">
            <form action="#">
                <fieldset>
                    <legend>联系人信息</legend>
                    <div>
                        <label for="name">联系人</label>
                        <input type="text" name="linkman" id="name"/>
                    </div>
                    <div>
                        <label for="phone">联系电话</label>
                        <input type="text" name="phone" id="phone"/>
                    </div>
                    <div>
                        <label for="email">电子邮件</label>
                        <input type="text" name="email" id="email"/>
                    </div>
                    <center><div id="errorMessage"></div></center>
                </fieldset>
                <fieldset class="buttons">
                    <input type="submit" value="创建" />
                </fieldset>
            </form>
        </div>
    </div>
    <c:import url="/foot"></c:import>
</div>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
    $(function () {
        let flag = false;
        $("#name").blur(function () {
            if($("#name").val() == null||$("#name").val() == ''){
                $('#errorMessage').html("姓名不能为空");
                flag = false;
            }else {
                flag = true;
            }
        })
        $("#phone").blur(function () {
            if($("#phone").val() == null||$("#phone").val() == ''){
                $('#errorMessage').html("手机号不能为空");
                flag = false;
            }else {
                flag = true;
            }
        })
        $("#email").blur(function () {
            if($("#email").val() == null||$("#email").val() == ''){
                $('#errorMessage').html("邮箱不能为空");
                flag = false;
            }else {
                if(flag == true){
                    $('form').attr("action","${pageContext.request.contextPath}/subscription/newSubscription")
                }
            }
        })
    })
</script>