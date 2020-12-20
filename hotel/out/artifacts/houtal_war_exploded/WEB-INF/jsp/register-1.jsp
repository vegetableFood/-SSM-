<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/calendar.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css"></link>
  <style type="text/css">
    form{
      margin: 5px 0;
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
    
    #content div input{
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
    <div id="message"></div>
    <form action="#" method="post">
      <fieldset>
        <legend>登录信息[必选]</legend>
        <div>
          <label for="username">用户名</label>
          <input type="text" name="username" id="username" />
        </div>
        <div>
          <label for="password">密码</label>
          <input type="password" name="pwd" id="password" />
        </div>
        <div>
          <label for="repassword">重复密码</label>
          <input type="password" name="repassword" id="repassword" />
        </div>
      </fieldset>
      <fieldset>
        <legend>联系信息[可选]</legend>
        <div>
          <label for="name">联系人</label>
          <input type="text" name="name" id="name"/>
        </div>
        <div>
          <label for="phone">联系电话</label>
          <input type="text" name="phone" id="phone"/>
        </div>
        <div>
          <label for="email">电子邮件</label>
          <input type="text" name="email" id="email"/>
        </div>
      </fieldset>
      <fieldset class="buttons">
        <input type="submit" value="注册" />
      </fieldset>
    </form>
    ${e.message }
  </div>
  <c:import url="/foot"></c:import>
</div>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
  $(function () {
    let  button = 0;
    // 用户名;
    $("#username").blur(function () {
      let username = $("#username").val();
      if((username == null )|| (username == "")){
        $("#message").html("用户名不能为空");
      }else {
        button = button + 1;
      }
    })
    // 密码
    $("#password").blur(function () {
      let password = $("#password").val();
      if((password == null )|| (password == "")){
        $("#message").html("密码不能为空");
      }else {
        button = button + 1;
      }
    })
    // 二次密码
    $("#repassword").blur(function () {
      let repassword = $("#repassword").val();
      let password = $("#password").val();
      if(password != repassword ){
        $("#message").html("两次密码不一致");
      }else {
        button = button + 1;
        console.log(button);
        if(button >= 3){
          $("form").attr("action","${pageContext.request.contextPath }/member/regist");
        }
      }
    })


    // 手机号
    $("#phone").focus(function () {
      $("form").attr("action","#");
    })
    $("#phone").blur(function (){
       let phone = $("#phone").val();
       var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
       if(phone.length !=11){
          $("#message").html("请输入有效的手机号码");
        }else if(!myreg.test(phone)){
          $("#message").html("请输入有效的手机号码");
        }else{
          $("form").attr("action","${pageContext.request.contextPath }/member/regist");
        }
    })

    // 邮箱
    $("#email").focus(function () {
      $("form").attr("action","#");
    })
    $("#email").blur(function () {
      let email = $("#email").val();
      var isEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
      if(!(isEmail.test(email))){
        $("#message").html("邮箱格式不正确");
      }else {
        $("form").attr("action","${pageContext.request.contextPath }/member/regist");
      }

    })
  })
</script>
