<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍详细信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/detail.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div id="main">
    <div id="left">
        <div id="leftHeader">
            <h3 id="leftTitle">${book.name}</h3>
        </div>
        <div id="leftMain">
            <div id="box">
                <div id="small">
                    <img src="${pageContext.request.contextPath}/${book.picture}" width="334px" height="269px" id="smallImg">
                    <div id="move"></div>
                </div>
                <div id="big">
                    <img src="${pageContext.request.contextPath}/${book.picture}" width="668px" height="538px" id="bigImg">
                </div>
            </div>
        </div>
        <div id="leftBack"><a href="${pageContext.request.contextPath}/allBooks"><img id="headerImg" src="../img/manager_back.png" width="50" height="50" title="返回"></a></div>
    </div>
    <div id="right">
        <div id="rightSummary">
            <p>${book.synopsis}</p>
        </div><hr style="color: #8e9aaf"/>
        <div id="rightAuthor">
            <span>作者:</span>
            <span style="color:royalblue;">${book.author}</span>
        </div>
        <div id="rightPrice">
            <span>售价￥:</span>
            <span style="color:red;">${book.price}</span>
        </div>
        <div id="rightType">
            <span>类型:</span>
            <span style="color:blue;">${book.type}</span>
        </div>
        <div id="rightNumber">
            <hr style="color: #8e9aaf"/>
            <span>库存:</span>
            <span style="color: blue">${book.number}</span>
        </div>
        <div id="rightSales">
            <span>销量:</span>
            <span style="color: blue">${book.sales}</span>
            <hr style="color: #8e9aaf"/>
        </div>
        <div id="rightNum">
            <input type="text" value="1" style="width: 30px;height: 30px" id="num" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')"}>
            <button style="height: 15px;width: 15px;" id="add">+</button>
            <button style="height: 15px;width: 15px;" id="sub">-</button>
            <div>
                <button id="addCart" onclick="addShoppingCart(${book.id})">加入购物车</button>
            </div>
            <div>
                <button id="buy" onclick="byNow(${book.id})">立即购买</button>
            </div>
        </div>
    </div>
</div>
<input id="address" type="hidden" value="${address}">
<script>
    function byNow(id) {
        if ($("#address").val().length==0){
            alert("当前收货地址为空，无法购买");
        }else if ($("#num").val() > ${book.number}){
            alert("库存不足")
        }else{
            var r = confirm("您确认要购买"+" ["+$("#num").val()+"] "+"本"+"【"+"${book.name}"+"】"+"吗？(当前地址为现地址)");
            var num = $("#num").val();
            var price = ${book.price};
            var prices = Number(num * price).toFixed(2);
            if (r) {
                var url = getProjectPath()+"/byNow?id="+id+"&num="+num+"&prices="+prices;
                $.get(url, function (response) {
                    alert("购买成功!")
                    location.href = getProjectPath()+"/order";
                })
            }
        }
    }

    function addShoppingCart(id) {
        if ($("#num").val() > ${book.number}){
            alert("您输入的数量大于库存，请重新输入")
        }else{
            var r = confirm("确认要加入购物车?");
            var num= $("#num").val();
            if (r) {
                var url = getProjectPath()+"/addShoppingCart?id=" + id + "&num=" +num;

                $.get(url, function (response) {
                    alert(response.message)
                })
            }
        }
    }

    $(function (){
        // $("#sub").attr("disabled",true);
        $("#add").click(function (){
            $("#num").val(parseInt($("#num").val())+1);
            // $("#sub").attr("disabled",false);
            if ($("#num").val() == ${book.number}){
                // $("#add").attr("disabled",true);
            }
            if ($("#num").val() > ${book.number}){
                // alert("输入错误!!!");
                $("#num").val(${book.number});
                // $("#add").attr("disabled",true);
                // $("#sub").attr("disabled",true);
            }
        })
        $("#sub").click(function (){
            $("#num").val(parseInt($("#num").val())-1);
            // $("#add").attr("disabled",false);
            if ($("#num").val() <= 1){
                $("#num").val(1);
                // $("#sub").attr("disabled",true);
            }
        })
    })

    var smallDiv = document.getElementById('small');
    var bigDiv = document.getElementById('big');
    var moveDiv = document.getElementById('move');
    var smallImg = document.getElementById('smallImg');
    var bigImg = document.getElementById('bigImg');

    //设置move的大小
    moveDiv.style.width = 334 / 2 * (350/334) + "px";
    moveDiv.style.height = 269 / 2 * (300/269) + "px";

    //鼠标移动的move是位置的设定
    smallDiv.onmousemove = function (e){
        var x = e.pageX - smallDiv.offsetLeft - moveDiv.offsetWidth/2 - 334;
        var y = e.pageY - smallDiv.offsetTop - moveDiv.offsetHeight/2;

        // console.log(x);
        // console.log(y);

        //边界处理
        if(x<0){
            x=0;
        }
        if(x>smallDiv.offsetWidth - moveDiv.offsetWidth){
            x= smallDiv.offsetWidth - moveDiv.offsetWidth;
        }
        if(y<0){
            y=0;
        }
        if(y>smallDiv.offsetHeight - moveDiv.offsetHeight){
            y= smallDiv.offsetHeight - moveDiv.offsetHeight;
        }
        //move div 的移动
        moveDiv.style.left = x + 'px';
        moveDiv.style.top = y + 'px';
        //大图的移动
        bigImg.style.left = -x * bigImg.offsetWidth/smallImg.offsetWidth + "px";
        bigImg.style.top = -y * bigImg.offsetHeight/smallImg.offsetHeight + "px";
    }
    //鼠标移入小图，大图显示
    smallDiv.onmouseover = function(){
        bigDiv.style.display = "block";
        moveDiv.style.display = "block";
    }
    smallDiv.onmouseout = function(){
        bigDiv.style.display = "none";
        moveDiv.style.display = "none";
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
