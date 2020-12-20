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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css"></link>
    <style type="text/css">

        form{
            margin: 10px 0;
        }

        fieldset{
            padding: 0 1em 1em 1em;
            margin: auto;
            width: 400px;
            display: block;
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
    <title>会员中心</title>
</head>
<body>
<div id="container">
    <c:import url="/header"></c:import>
    <div id="content" style="width:98%;position:relative">
        <c:import url="/left"></c:import>
        <div class="subcontent">
            <div id="message"></div>
            <form action="${pageContext.request.contextPath}/member/updateUserMessage">
                <fieldset>
                    <legend>联系信息</legend>
                    <div style="display: none">
                        <input type="text" name="id" id="id" value="${member.id}"/>
                    </div>
                    <div>
                        <label for="name">联系人</label>
                        <input type="text" name="name" id="name" value="${member.name}"/>
                    </div>
                    <div>
                        <label for="phone">联系电话</label>
                        <input type="text" name="phone" id="phone" value="${member.phone}"/>
                    </div>
                    <div>
                        <label for="email">电子邮件</label>
                        <input type="text" name="email" id="email" value="${member.email}"/>
                    </div>
                    <div><label style="color: red">${updateUserMessage}</label></div>
                </fieldset>
                <fieldset class="buttons">
                    <input type="submit" value="保存" />
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
        // 手机号
        $("#phone").focus(function () {
            $("form").attr("action","#");

        })
        $("#phone").blur(function (){
            let phone = $("#phone").val();
            let myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
            if(phone.length !=11){
                $("#message").html("请输入有效的手机号码");
            }else if(!myreg.test(phone)){
                $("#message").html("请输入有效的手机号码");
            }else{
                $("form").attr("action","${pageContext.request.contextPath}/member/updateUserMessage");
            }
        })

        // 邮箱
        $("#email").focus(function () {
            $("form").attr("action","#");
        })
        $("#email").blur(function () {
            let email = $("#email").val();
            console.log(email)
            let isEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            if(!(isEmail.test(email))){
                $("#message").html("邮箱格式不正确");
            }else {
                $("form").attr("action","${pageContext.request.contextPath}/member/updateUserMessage");
            }
    })
    })
</script>