<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container">
    <div class="form-box">
        <%--注册--%>
        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="register-box hidden">
                <h1>register</h1>
                <input type="text" placeholder="用户名" name="name" required="required">
                <input id="email" type="text" placeholder="邮箱" name="email" required="required" onchange="checkEmail()">
                <input id="password" type="password" placeholder="密码" name="password" required="required" onchange="checkPwd()">
                <input id="password1" type="password" placeholder="确认密码" required="required" onchange="checkPwd1()">
                <button id="sure" type="submit">注册</button>
            </div>
        </form>
        <%--登录--%>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="login-box">
                <h1>login</h1>
                <span style="color: red">${msg}</span>
                <input type="text" placeholder="邮箱" name="email" required="required">
                <input type="password" placeholder="密码" name="password" required="required">
                <button type="submit">登录</button>
            </div>
        </form>
    </div>
    <div class="con-box left">
        <h2>欢迎来到<span>网上书城</span></h2>
        <p>快来购买你喜欢的<span>书籍</span>吧</p>
        <img src="${pageContext.request.contextPath}/img/login.png" alt="">
        <p>已有账号</p>
        <button id="login">去登录</button>
    </div>
    <div class="con-box right">
        <h2>欢迎来到<span>网上书城</span></h2>
        <p>快来看看你的专属<span>书城</span>吧</p>
        <img src="${pageContext.request.contextPath}/img/register.png" alt="">
        <p>没有账号？</p>
        <button id="register">去注册</button>
    </div>
</div>
<script>
    // 要操作到的元素
    let login=document.getElementById('login');
    let register=document.getElementById('register');
    let form_box=document.getElementsByClassName('form-box')[0];
    let register_box=document.getElementsByClassName('register-box')[0];
    let login_box=document.getElementsByClassName('login-box')[0];
    // 去注册按钮点击事件
    register.addEventListener('click',()=>{
        form_box.style.transform='translateX(80%)';
        login_box.classList.add('hidden');
        register_box.classList.remove('hidden');
    })
    // 去登录按钮点击事件
    login.addEventListener('click',()=>{
        form_box.style.transform='translateX(0%)';
        register_box.classList.add('hidden');
        login_box.classList.remove('hidden');
    })

    //校验密码是否一致
    function checkPwd1(){
        var p1 = $("#password").val();
        var p2 = $("#password1").val()
        if ( p1 != p2){
            alert("两次输入密码不一致")
            $("#password1").val("")
        }
    }

    //校验密码
    function checkPwd(){
        var checkPwdPwd = /^[\S]{6,16}$/;
        var password = $("#password").val();
        if (!checkPwdPwd.test(password)){
            alert("请输入6-16位的密码");
            $("#password").val("");
        }
    }

    //校验邮箱
    function checkEmail(){
        var myreg = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
        var email = $("#email").val();
        if (!myreg.test(email)){
            alert("邮箱格式错误");
            $("#email").val("");
        }
    }
</script>
</body>
</html>
