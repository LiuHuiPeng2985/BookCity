<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>个人主页</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/personal.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div>
    <div><p id="per" style="font-weight: bold">个人信息</p></div>
    <form action="${pageContext.request.contextPath}/updateInformation" method="post" id="form">
        <div id="user_name">用户名：<input id="name" type="text" value="${requestScope.user.name}" class="user" placeholder="用户名" name="name" required="required" disabled="disabled"></div>
        <div id="user_email">邮箱：<input id="email" ype="text" value="${requestScope.user.email}" class="user" name="email" required="required" disabled="disabled"></div>
        <div id="user_identity">身份：<select id="identity" type="text" class="user" name="identity" disabled="disabled">
                                                            <option>
                                                                <c:if test="${requestScope.user.identity == 0}">普通用户</c:if>
                                                                <c:if test="${requestScope.user.identity == 1}">管理员</c:if>
                                                            </option>
                                                        </select>
        </div>
        <div id="site">收货地址：
                <input id="user_province" type="text"value="${requestScope.user.province}" class="user" placeholder="省" name="province" required="required" disabled="disabled">
                <input id="user_city" type="text" value="${requestScope.user.city}" class="user" placeholder="市" name="city" required="required" disabled="disabled">
                <input id="user_county" type="text" value="${requestScope.user.county}" class="user" placeholder="县" name="county" required="required" disabled="disabled">
                <input id="user_place" type="text" value="${requestScope.user.place}" class="user" placeholder="具体地址" name="place" required="required" disabled="disabled">
        </div>
        <input id="update_user" type="button" value="点击修改">
        <input id="save_user" type="submit" value="保存">
    </form>
</div>

<script type="text/javascript">
    var updateDom = document.getElementById("update_user");
    updateDom.onclick = function (){
        document.getElementById("name").disabled=false;
        document.getElementById("user_province").disabled=false;
        document.getElementById("user_city").disabled=false;
        document.getElementById("user_county").disabled=false;
        document.getElementById("user_place").disabled=false;
    }
    document.getElementById("save_user").onclick = function () {
        var userProvince = $("#user_province").val();
        var userCity = $("#user_city").val();
        var userCounty = $("#user_county").val();
        var userPlace = $("#user_place").val();
        if (userProvince != "" && userCity != "" && userCounty != "" && userPlace != ""){
            alert("修改成功！");
        }
    }
</script>

</body>
</html>
