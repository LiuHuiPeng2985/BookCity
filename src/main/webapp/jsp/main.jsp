<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
<div class="q">
    <h1 class="h1">网上书城</h1>
    <div id="page">
        <div id="top">
            <div id="top_left">
                <p class="site">欢迎来到你的专属书城！</p>
            </div>
            <input type="hidden" name="message" id="messages" value="${message}">
            <div id="top_right">
                |<a href="main_page.jsp" target="frame">首页</a>
                |<a href="${pageContext.request.contextPath}/allBooks" target="frame">全部书籍</a>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
                <a href="${pageContext.request.contextPath}/order" target="frame">订单</a>|
                <a href="${pageContext.request.contextPath}/shoppingcart" target="frame">购物车</a>|
                <a href="${pageContext.request.contextPath}/personal" target="frame">我的账户</a>|
                <a href="${pageContext.request.contextPath}/logout">注销</a>|
            </div>
        </div>
    </div>

    <div>
        <div class="clear"></div>
        <div id="menu">

        </div>

    </div>
    <div id="content">

        <div id="content_bottom">

            <iframe name="frame" src="main_page.jsp" width="100%" height="98%" >

            </iframe>
    </div>
</div>
</div>
<div id="bottom">
    我是有底线的！
</div>
</div>
</body>
</html>

