
<%--顶部导航栏--%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="header">
	<ul>
		<li><a href="#">帮助</a>
		</li>
	</ul>
</div>
<div id="menu">
	<ul>
		<li><a href="${pageContext.request.contextPath }/hotel">首页</a>
		</li>
		<li><a href="${pageContext.request.contextPath }/room/findAllCategories">设施与价格</a>
		</li>
		<li><a href="${pageContext.request.contextPath }/subscription/selectAllSubscription">会员中心</a>
		</li>
	</ul>
</div>