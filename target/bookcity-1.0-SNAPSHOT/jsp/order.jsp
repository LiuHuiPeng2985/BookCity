<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>订单</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }
        table tr th,table tr td{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <table class="col-md-10" style="height: 50px">
            <tr style="height: 40px">
                <th>订单编号</th>
                <th>金额(元)</th>
                <th>状态</th>
                <th>日期</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${order}" var="order">
            <tr style="height: 60px;background-color: #f6f6f6">
                <td>${order.orderNum}</td>
                <td>￥${order.price}</td>
                <td id="state">
                    <c:if test="${order.state == 0}"><span style="color: orange" class="state">申请退单中</span></c:if>
                    <c:if test="${order.state == 1}"><span style="color: red" class="state">未发货</span></c:if>
                    <c:if test="${order.state == 2}"><span style="color: blue" class="state">已发货</span></c:if>
                    <c:if test="${order.state == 3}"><span style="color: green" class="state">已签收</span></c:if>
                    <c:if test="${order.state == 4}"><span style="color: black" class="state">已退单</span></c:if>
                </td>
                <td>${order.orderTime}</td>
                <td>
                    <button class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="orderDetail(${order.orderId})">查看详情</button>
                    <c:if test="${order.state == 1}">
                        <button class="btn btn-warning" onclick="applyForChargeback(${order.orderId})">申请退单</button>
                    </c:if>
                    <c:if test="${order.state == 2}">
                        <button class="btn btn-success" onclick="receivedGoods(${order.orderId})">已收货</button>
                    </c:if>
                    <c:if test="${order.state == 3 or order.state == 4}">
                        <button class="btn btn-danger" onclick="deleteOrder(${order.orderId})">删除</button>
                    </c:if>
                </td>
            </tr>
            </c:forEach>
        </table>
        <div class="col-md-1"></div>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px;">
        <div class="modal-content">
            <div class="modal-header">
                <h4>订单编号：<span id="orderNum"></span></h4>
            </div>
            <div class="modal-body text-left form-control input-lg pre-scrollable container" style="height: 280px;">
                <div class="row-fluid">
                    <table class="col-md-12 table-bordered" id="myTable">
                        <tr>
                            <th>书名</th>
                            <th>单价</th>
                            <th>数量</th>
                            <th>总价</th>
                        </tr>
                        <%--<c:forEach items="${order}" var="cart">
                        <tr id="myTable">
                            <td id="name"></td>
                            <td id="price"></td>
                            <td id="num"></td>
                            <td id="totalPrice"></td>
                        </c:forEach>--%>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <div class="lead" style="float: left">
                    <span style="font-weight: bold">收货地址：</span><span id="address"></span>
                </div>
                <button id="sure" type="button" class="btn btn-primary" data-dismiss="modal">确认</button>
            </div>
        </div>

    </div>
</div>
<script>
    function orderDetail(id) {
        var url = getProjectPath()+"/orderDetail?id=" + id;
        $.get(url, function (response) {
            $("#orderNum").text(response.data.orderNum);
            $("#address").text(response.data.address);
            var map=eval(response.data.cartList);
            for (var j=0;j<map.length;j++){
                var table=$("#myTable");
                var tr=document.createElement('tr');
                var name=document.createElement('td');
                name.innerHTML=map[j].book.name;
                var price=document.createElement('td');
                price.innerHTML=map[j].book.price;
                var num=document.createElement('td');
                num.innerHTML=map[j].cartNum;
                var totalPrice=document.createElement('td');
                totalPrice.innerHTML=Number(map[j].book.price * map[j].cartNum).toFixed(2);
                tr.append(name);
                tr.append(price);
                tr.append(num);
                tr.append(totalPrice);
                table.append(tr);
            }
        })
    }

    $(function (){
        $("#sure").click(function (){
            $("#myTable tr td").remove();
        })
    })

    function applyForChargeback(id) {
        var r = confirm("您确认退单吗?");
        if (r) {
            var url = getProjectPath()+"/applyForChargeback?id=" + id;
            $.get(url, function (response) {
                alert(response.message)
                location.href = getProjectPath()+"/order";
            })
        }
    }

    function receivedGoods(id) {
        var r = confirm("您确认已收货了吗?");
        if (r) {
            var url = getProjectPath()+"/receivedGoods?id=" + id;
            $.get(url, function (response) {
                alert(response.message)
                location.href = getProjectPath()+"/order";
            })
        }
    }

    function deleteOrder(id) {
        var r = confirm("您确认要删除吗?");
        if (r) {
            var url = getProjectPath()+"/deleteOrder?id=" + id;
            $.get(url, function (response) {
                alert(response.message)
                location.href = getProjectPath()+"/order";
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
