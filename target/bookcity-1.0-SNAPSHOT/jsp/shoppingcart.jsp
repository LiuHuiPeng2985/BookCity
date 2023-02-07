<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping_cart.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <table class="col-md-10" style="height: 50px">
            <tr style="height: 40px">
                <th >书籍名称</th>
                <th >单价(元)</th>
                <th >数量</th>
                <th >金额(元)</th>
                <th >操作</th>
            </tr>
            <c:forEach items="${cartlist}" var="cart">
            <tr style="height: 60px;background-color: #f6f6f6">
                <td>
                    <input type="checkbox"  name="checkboxBtn" id="${cart.bookId}" class="${cart.status}" onclick="updateStatus(${cart.bookId})">
                    <input type="hidden" name="status" id="${cart.status}">
                    <input type="hidden" id="bookNumber${cart.bookId}" value="${cart.book.number}">
                    <a href="${pageContext.request.contextPath}/viewDetail/${cart.bookId}" id="name${cart.bookId}">${cart.book.name}</a>
                </td>
                <td>￥<span id="price${cart.bookId}">${cart.book.price}</span></td>
                <td>
                    <button style="width: 25px;height: 25px"  onclick="sub(${cart.bookId})">-</button>
                    <input class="num" type="text" value="${cart.cartNum}" id="num${cart.bookId}" disabled="disabled">
                    <button style="width: 25px;height: 25px"  onclick="add(${cart.bookId})">+</button>
                </td>
                <td class="money">￥<fmt:formatNumber value="${cart.book.price*cart.cartNum}"  pattern="#.##"/></td>
                <td><button class="delete btn" onclick="deleteCartBook(${cart.bookId})">删除</button></td>
            </tr>
            </c:forEach>
        </table>
        <div class="col-md-1"></div>
    </div>
</div>
<div id="bottom" class="container table">
    <div class="row">
        <div class="col-md-2 chose"></div>
        <div class="col-md-3 chose">
            <span style="margin-right: 50px;">全部：
                <input type="checkbox" id="selectAll" onclick="updateAllStatus()">
            </span>
           <%-- <c:set var="totalNum" value="0"></c:set>
            <c:forEach items="${cartlist}" var="cart" varStatus="status">
                <c:set var="totalNum" value="${totalNum+(cart.cartNum)}"></c:set>
            </c:forEach>
            已选择<span id="num" style="color: red">${totalNum}</span>件商品--%>
            已选择<span id="num" style="color: red"></span>件商品
        </div>
        <div class="col-md-3 total">
            <%--<c:set var="totalPrice" value="0"></c:set>
            <c:forEach items="${cartlist}" var="cart" varStatus="status">
&lt;%&ndash;                <c:set var="totalPrice" value="${totalPrice+(cart.cartNum * (cart.book.price * cart.cartNum))}"></c:set>&ndash;%&gt;
                <fmt:formatNumber var="totalPrice" value="${totalPrice+ (cart.book.price * cart.cartNum)}" pattern="#.00"/>
            </c:forEach>
                总计<span style="color: red" id="prices">${totalPrice}</span>元--%>
            总计<span style="color: red" id="prices"></span>元
        </div>
        <div class="col-md-2 end">
            <button id="settlement" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" onclick="settlement()">结算</button>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h5 class="modal-title lead">请确认以下地址是否无误:</h5>
            </div>
            <div class="modal-body text-left form-control input-lg" style="height: 150px"
            >
                <div>
                    省:<input id="province" type="text"  disabled="disabled">
                </div>
                <div>
                    市:<input id="city" type="text"  disabled="disabled">
                </div>
                <div>
                    县:<input id="county" type="text"  disabled="disabled">
                </div>
                <div>
                    详:<input id="place" type="text" disabled="disabled">
                </div>
            </div>
            <div class="modal-footer">
                <a type="button" class="btn btn-default" style="float: left" href="${pageContext.request.contextPath}/personal">前往修改</a>
                <button id="sure" type="button" class="btn btn-primary" data-dismiss="modal">确认</button>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="hiddenNum" value="${totalCount}">
<script>
    function  updateStatus(id){
        var t = true;
        if (t) {
            var url = getProjectPath()+"/updateStatus?id=" + id;
            $.get(url, function () {
                location.href = getProjectPath()+"/shoppingcart";
            })
        }
    }

    function  updateAllStatus() {
        var flag = $("#selectAll").prop("checked");//获取全选的状态
        if (flag) {
            var status = 1;
        } else
            var status = 0;
        var url = getProjectPath() + "/updateAllStatus?status=" + status;
        $.get(url, function () {
            location.href = getProjectPath() + "/shoppingcart";
        })
    }

    $(function(){
        var selectedNum = 0;
        var prices = 0;
        $(":checkbox[name='checkboxBtn']").each(function() {
            var status = $(this).attr("class");
            var id = $(this).attr("id");
            if (status == 1){
                selectedNum = (selectedNum) + parseInt($("#num"+id).val());
                prices = prices + (parseInt($("#num"+id).val()) * parseFloat($("#price"+id).text()));
                Number(prices).toFixed(2);
                $(this).prop('checked',true);
            }else {
                $(this).prop('checked',false);
            }
        });
        $("#selectAll").click(function() {
            var flag = $(this).prop("checked");//获取全选的状态
            $("input[type='checkbox']").prop("checked", flag);//让所有条目的复选框与参数flag同步
            if(!flag){
                $("#num").text(0);
            }else{
                $("#num").text($("#hiddenNum").val());
            }
        });
        var selectedCount = $(":checkbox[name='checkboxBtn']:checked").length;//被勾选复选框个数
        var allCount = $(":checkbox[name='checkboxBtn']").length;//所有条目复选框个数
        if (selectedCount == allCount && selectedCount != 0){
            $("#selectAll").prop("checked", true);//勾选全选复选框
        }else {
            $("#selectAll").prop("checked", false);//不勾选全选复选框
        }
        $("#num").text(selectedNum);
        $("#prices").text(Number(prices).toFixed(2));
        if($("#num").text() == 0){
            $("#settlement").attr("disabled",true);
        }
    });

    $(function (){
        $("#sure").click(function (){
            //获取被勾选中的书id,书数量放到Array中
            var bookIdArray=new Array();
            var bookNumArray=new Array();
            $(":checkbox[name='checkboxBtn']:checked").each(function() {
                var bookId=$(this).attr("id")
                var bookNum=$("#num"+bookId).val();
                bookIdArray.push(bookId);
                bookNumArray.push(bookNum);
            });
            //获取总价
            var prices = $("#prices").text();
            var url = getProjectPath()+"/addOrderByCart?prices="+prices+"&bookIdArray="+bookIdArray+"&bookNumArray="+bookNumArray;
            $.get(url, function (response) {
                alert("结算成功!")
                location.href= getProjectPath()+"/order";
            })
        })
    })

    function settlement() {
        if ($("#province").val() == "" || $("#province").val() == null || $("#province").val() == undefined){
            $("#sure").attr("disabled",true);
        }
        var bookNameArray=new Array();
        $(":checkbox[name='checkboxBtn']:checked").each(function() {
            var bookId=$(this).attr("id")
            var bookNum=$("#num"+bookId).val();
            var bookNumber=$("#bookNumber"+bookId).val();
            var bookname='【'+$("#name"+bookId).text()+'】';
            if(parseInt(bookNum)>parseInt(bookNumber)){
                bookNameArray.push(bookname);
            }
        });
        if (bookNameArray.length == 0){
            var url = getProjectPath()+"/settlement";
            $.get(url, function (response) {
                $("#province").val(response.data.province);
                $("#city").val(response.data.city);
                $("#county").val(response.data.county);
                $("#place").val(response.data.place);
                if ($("#province").val() == "" || $("#province").val() == null || $("#province").val() == undefined){
                    alert($("#province").val().length)
                    $("#sure").attr("disabled",true);
                }else {
                    $("#sure").attr("disabled",false);
                }
            })
        }else {
            alert(bookNameArray+"库存不足，无法结算！");
            $("#myModal").remove();
        }
    }

    function  add(id){
        var t = true;
        if (t) {
            var url = getProjectPath()+"/addCartBookNum?id=" + id;
            $.get(url, function () {
                location.href = getProjectPath()+"/shoppingcart";
            })
        }
    }

    function  sub(id){
        var i=parseInt($("#num"+id).val());
        if(parseInt(i)==1){
            alert("已达最低数量")
        }else{
            var t = true;
            if (t) {
                var url = getProjectPath()+"/subCartBookNum?id=" + id;
                $.get(url, function () {
                    location.href = getProjectPath()+"/shoppingcart";
                })
            }
        }
    }

    function deleteCartBook(id) {
        var r = confirm("确认要删除吗?");
        if (r) {
            var url = getProjectPath()+"/deleteCartBook?id=" + id;
            $.get(url, function (response) {
                alert(response.message)
                location.href = getProjectPath()+"/shoppingcart";
            })
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
