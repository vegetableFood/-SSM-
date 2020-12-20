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
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/style/style.css"></link>

    <style type="text/css">

        #content div{
            margin: 10px 0px;
        }

        div.submit{
            text-align:center;
        }

        label{
            width:80px;
            display:block;
            float:left;
        }

        fieldset{
            width:300px;
            margin:auto;
            margin-top:20px;
            display:block;
        }

        fieldset select{
            width:120px;
        }

        fieldset input{
            width:120px;
        }

    </style>
    <title>登录</title>
</head>
<body>
<div id="container">
    <c:import url="/header"></c:import>
    <div id="content">
        <form action="${pageContext.request.contextPath}/member/login">
            <fieldset>
                <legend>登录信息</legend>
                <div>
                    <label for="username">用户名</label>
                    <input type="text" name="username" id="username" />
                </div>
                <div>
                    <label for="password">密码</label>
                    <input type="password" name="pwd" id="password" />
                </div>
            </fieldset>
            <div class="submit">
                <input type="submit" value="登录" />
                <p>如果您还没注册，请<a href="${pageContext.request.contextPath}/register-1">点击这里注册</a>成为会员。</p>
            </div>
        </form>
        <div style="color: red">${e.message}${loginMessage}</div>
    </div>
    <c:import url="/foot"></c:import>
</div>
</body>
</html>
