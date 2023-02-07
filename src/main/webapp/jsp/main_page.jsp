<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页轮播图</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slideshow.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/slideshow.js"></script>
</head>
<body>
<div class="container">
    <div class="left">
        <div id="left-dynamic">
            <h3 id="dynamic">最新动态</h3><br/>
            <ol id="dynamic-list">
                <li>青春文学，满1000减50</li><br/>
                <li>完结撒花!易中天中华史:24卷全</li><br/>
                <li>每位程序猿都阅读的经典书</li><br/>
                <li>失传的营养学，远离疾病</li>
            </ol>
        </div>
    </div>
    <div class="right">
        <ul id="notice-list">
            <li>欢迎您进入我们的网上书城!</li>
            <li>本书城初建立，书籍正在慢慢上传。</li>
            <li>书籍均为正版。</li>
            <li>书籍价格均为市面价值，不存在欺诈!</li>
            <li>如有问题，请加QQ:110110110。</li>
            <li>谢谢您的合作，祝您生活愉快。</li>
        </ul>
    </div>
    <div class="box">
        <div class="box-img"><img src="../img/slideshowImg/1.png" alt="" width="660" height="460"></div>
        <div class="box-img"><img src="../img/slideshowImg/2.png" alt="" width="660" height="460"></div>
        <div class="box-img"><img src="../img/slideshowImg/3.png" alt="" width="660" height="460"></div>
        <div class="box-img"><img src="../img/slideshowImg/4.png" alt="" width="660" height="460"></div>
        <div class="box-img"><img src="../img/slideshowImg/5.png" alt="" width="660" height="460"></div>
        <div class="box-img"><img src="../img/slideshowImg/6.png" alt="" width="660" height="460"></div>
        <div class="box-left">&lt;</div>
        <div class="box-right">&gt;</div>
        <div class="box-di">
            <ul>
                <li class="botton"></li>
                <li class="botton"></li>
                <li class="botton"></li>
                <li class="botton"></li>
                <li class="botton"></li>
                <li class="botton"></li>
            </ul>
        </div>
    </div>

</div>
</body>
</html>
