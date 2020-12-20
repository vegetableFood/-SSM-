
<%--页面左侧导航栏--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="submenu">
    <ul>
        <li><a href="${pageContext.request.contextPath}/subscription/selectAllSubscription?id=${member.id}">客房预订</a></li>
        <li><a href="${pageContext.request.contextPath}/subscription/selectHistoryOrder?id=${member.id}">历史订单</a></li>
        <li><a href="${pageContext.request.contextPath}/editMember">修改信息</a></li>
        <li><a href="${pageContext.request.contextPath}/editPassword">修改密码</a></li>
        <li><a href="${pageContext.request.contextPath}/member/outSystem">退出系统</a></li>
    </ul>
</div>
