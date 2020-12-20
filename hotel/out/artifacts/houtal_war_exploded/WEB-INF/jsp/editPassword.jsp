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
    <meta http-equiv="Content-Type" content="${pageContext.request.contextPath}/text/html; charset=utf-8" />
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
    <title>修改密码</title>
</head>
<body>
<div id="container">
    <c:import url="/header"></c:import>
    <div id="content" style="width:98%;position:relative">
        <c:import url="/left"></c:import>
        <div class="subcontent">
            <form action="#">
                <fieldset>
                    <legend>密码信息</legend>
                    <div>
                        <label for="password">原密码</label>
                        <input type="password" name="password" id="password" />
                    </div>
                    <div>
                        <label for="newPassword">新密码</label>
                        <input type="password" name="newPassword" id="newPassword"/>
                    </div>
                    <div>
                        <label for="reNewPassword">重复新密码</label>
                        <input type="password" name="reNewPassword" id="reNewPassword" />
                    </div>
                    <div><label id="errorMessage" style="color: red">${passWardMessage}</label></div>
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
        let inform = false;
        $("#password").blur(function () {
            let sessionPass = ${member.pwd};
            let firstPass = $("#password").val();
            if (sessionPass != firstPass){
                $('#errorMessage').html("原密码不正确！！");
            }else {
                inform = true;
            }
        });
        $('#newPassword').blur(function () {
            let newPassword = $("#newPassword").val();
            if((newPassword == null) || (newPassword == "")){
                $('#errorMessage').html("新密码不能为空！！");
            }
        })
        $('#reNewPassword').blur(function () {
            let newPassword = $('#newPassword').val();
            let reNewPassword = $('#reNewPassword').val();
            if (newPassword != reNewPassword){
                $('#errorMessage').html("两次密码不一致！！");
            }else {
                if(inform == true ){
                    $("form").attr('action','${pageContext.request.contextPath}/member/updatePassWard')
                }
            }

        });
    })
</script>
