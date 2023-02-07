<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看或编辑图书</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-3"></div>
        <form class="col-md-6" id="form" action="${pageContext.request.contextPath}/updateBook/${book.id}" method="post">
            <div class="col-md-4 lead">
                <div style="height: 200px;">书籍图片：</div>
                <div style="height: 40px;">书名：</div>
                <div style="height: 40px;">作者：</div>
                <div style="height: 40px;">价格：</div>
                <div style="height: 130px;">书籍介绍：</div>
                <div style="height: 40px;">库存：</div>
                <div style="height: 40px;">销量：</div>
                <div style="height: 40px;">图书类型：</div>
            </div>
            <div class="col-md-8">
                <div style="height: 200px;"><img src="${pageContext.request.contextPath}/${book.picture}" height="190px" name="picture"></div>
                <div style="height: 40px;"><input class="form-control" type="text" value="${book.name}" name="name" required id="name"></div>
                <div style="height: 40px;"><input class="form-control" type="text" value="${book.author}" name="author" required id="author"></div>
                <div style="height: 40px;"><input class="form-control" type="text" value="${book.price}" name="price" required id="price"></div>
                <div style="height: 130px;"><textarea class="form-control" style="width: 340px;height: 125px;" name="synopsis" required id="synopsis">${book.synopsis}</textarea></div>
                <div style="height: 40px;"><input class="form-control" type="text" value="${book.number}" name="number" required id="number"></div>
                <div style="height: 40px;"><input class="form-control" type="text" value="${book.sales}" name="sales" required id="sales"></div>
                <div style="height: 40px;">
                    <input class="form-control" type="text" value="${book.type}" name="type" required id="type" list="list">
                    <datalist id="list">
                        <option>计算机</option>
                        <option>文学</option>
                        <option>历史</option>
                        <option>管理</option>
                        <option>艺术</option>
                        <option>小说</option>
                        <option>童书</option>
                        <option>励志</option>
                        <option>文艺</option>
                        <option>经营</option>
                        <option>建筑</option>
                        <option>心理学</option>
                        <option>中小学用书</option>
                        <option>科普读物</option>
                    </datalist>
                </div>
            </div>
            <button id="sure" type="submit" class="btn btn-primary" style="margin-top: 10px;margin-right: 15px;float: right">确认</button>
        </form>
        <div class="col-md-3"></div>
    </div>
</div>
<script>
    $(function (){
        $("#sure").click(function (){
            var name = $("#name").val();
            var author = $("#author").val();
            var price = $("#price").val();
            var synopsis = $("#synopsis").val();
            var number = $("#number").val();
            var sales = $("#sales").val();
            var type = $("#type").val();
            if (name != "" && author != "" && price != "" && synopsis != "" && number != "" && sales != "" && type != ""){
                alert("操作成功！");
            }
        })
    })

    //获取当前项目的名称
    function getProjectPath() {
        var pathName = window.document.location.pathname;
        var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
        return  projectName;
    }
</script>
</body>
</html>
