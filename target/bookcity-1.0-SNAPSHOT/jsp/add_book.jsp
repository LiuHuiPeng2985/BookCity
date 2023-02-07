<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增图书</title>
    <meta http-equiv="Content-Type" content="multipart/form-data;charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-3"></div>
        <form class="col-md-6" id="bookForm" enctype="multipart/form-data">
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
            <div class="col-md-8" id="now">
                <div style="height: 200px;"><input type="file" name="file" id="file" value="上传" onchange="getFileContent()"><div class="img-content"><img src="" height="150px" width="150px"/></div></div>
                <div style="height: 40px;"><input class="form-control" type="text" name="name" id="name"></div>
                <div style="height: 40px;"><input class="form-control" type="text" name="author" id="author"></div>
                <div style="height: 40px;"><input class="form-control" type="text" name="price" id="price"></div>
                <div style="height: 130px;"><textarea class="form-control" style="width: 340px;height: 125px;" name="synopsis" id="synopsis"></textarea></div>
                <div style="height: 40px;"><input class="form-control" type="text" name="number" id="number"></div>
                <div style="height: 40px;"><input class="form-control" type="text" name="sales" id="sales"></div>
                <div style="height: 40px;">
                    <input class="form-control" type="text" name="type" id="type" list="list">
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
            <input id="btn" type="button" class="btn btn-primary" style="margin-top: 10px;margin-right: 15px;float: right" value="确定并提交">
        </form>
        <div class="col-md-3"></div>
    </div>
</div>



<script>

    $("#btn").click(function () {
        var name = $("#name").val();
        var author = $("#author").val();
        var price = $("#price").val();
        var synopsis = $("#synopsis").val();
        var number = $("#number").val();
        var sales = $("#sales").val();
        var type = $("#type").val();
        if (name == "" || author == "" || price == "" || synopsis == "" || number == "" || sales == "" || type == ""){
            alert("请将信息继续完善");
        }
        else {
            var formData = new FormData($("#bookForm")[0]); //表单对象
            $.ajax({
                url:"${pageContext.request.contextPath}/addBook",
                type:"post",
                data:formData,
                cache:false,    //缓存 get请求
                processData:false,
                contentType:false,
                success:function (response) {
                    alert(response.message)
                }
            })
        }
    });


    <%--将上传的图片展示出来--%>
    function getFileContent(){
        //1 创建文件读取对象
        let reader = new FileReader();
        //2 读取文件，获取DataURL
        var file = document.querySelector('#file').files[0];
        reader.readAsDataURL(file);
        //3 当文件读取成功完成
        reader.onload = function(){
            //3.1 设置图片的src属性为获取文件的 URL格式的Base64字符串
            document.querySelector('img').src = reader.result;
        }
    }

    //获取当前项目的名称
    function getProjectPath() {
        var pathName = window.document.location.pathname;
        var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
        return  projectName;
    }
</script>
</body>
</html>
