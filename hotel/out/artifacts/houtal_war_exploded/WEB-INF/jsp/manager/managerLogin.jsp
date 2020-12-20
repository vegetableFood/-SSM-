<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css" />
  <style type="text/css">

    #content div{
  	  margin: 10px 0px;
  	}

  	form{
  	  margin-top: 20px;
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
  	}

  	fieldset select{
  	  width:120px;
  	}

  	fieldset input{
  	  width:120px;
  	}

  </style>
  <title>管理员登录</title>
</head>
<body>
<div id="container">
  <div id="header">
  </div>
  <div id="menu">
  </div>
  <div>${e.message}</div>
  <div id="content">
    <form action="${pageContext.request.contextPath}/managers/login">
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
      </div>
    </form>
  </div>
  <hr />
    <c:import url="/foot"></c:import>
</div>
</body>
</html>