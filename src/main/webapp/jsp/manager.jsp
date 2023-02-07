<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员界面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager.css">
</head>
<body>
<div id="header">
    <div id="headerLoge"><img src="../img/manager_logo.png" width="108" height="75.3"></div>
    <div id="headerTitle">网上书城后台管理</div>
    <div id="headerBack"><a href="${pageContext.request.contextPath}/logout"><img id="headerImg" src="../img/manager_back.png" width="50" height="50" title="退出"></a></div>
</div>
<div id="main">
    <div id="sidebar">
        <div id="sidebarUser" >
            <a id="sidebarUserNow" target="frame" href="${pageContext.request.contextPath}/managerUser">用户管理</a>
        </div><hr/>
        <div id="sidebarBook" >
            <a id="sidebarBookNow" target="frame" href="${pageContext.request.contextPath}/managerBook">书籍管理</a>
        </div><hr/>
        <div id="sidebarOrder" >
            <a id="sidebarOrderNow" target="frame" href="${pageContext.request.contextPath}/managerOrder">订单管理</a>
        </div><hr/>
    </div>
    <div id="shop">
        <iframe id="shopIframe" name="frame" src="${pageContext.request.contextPath}/managerUser">

        </iframe>
    </div>
</div>
<div id="footer"></div>
</body>
</html>
