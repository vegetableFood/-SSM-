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
    <p>恭喜你，注册成功，请<a href="login.html">登录</a>。</p>
  </div>
  <c:import url="/foot"></c:import>
</div>
</body>
</html>