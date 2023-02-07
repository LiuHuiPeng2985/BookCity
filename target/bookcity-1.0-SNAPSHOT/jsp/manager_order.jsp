<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>订单管理</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
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
<div class="container-fluid">
    <div class="row">
        <table class="col-md-12" style="height: 50px">
            <tr style="height: 40px">
                <th>订单编号</th>
                <th>下单时间</th>
                <th>下单人</th>
                <th>收货地址</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageInfo.list}" var="order">
                <tr style="height: 50px;background-color: #f6f6f6">
                    <td>${order.orderNum}</td>
                    <td>${order.orderTime}</td>
                    <td>${order.user.name}</td>
                    <td>${order.address}</td>
                    <td>
                        <c:if test="${order.state == 0}"><span style="color: orange">申请退单中</span></c:if>
                        <c:if test="${order.state == 1}"><span style="color: red">未发货</span></c:if>
                        <c:if test="${order.state == 2}"><span style="color: blue">已发货</span></c:if>
                        <c:if test="${order.state == 3}"><span style="color: black">已签收</span></c:if>
                        <c:if test="${order.state == 4}"><span style="color: black">已退单</span></c:if>
                    </td>
                    <td>
                        <c:if test="${order.state == 0}">
                            <button class="btn btn-info" onclick="agreeChargeback(${order.orderId})">同意</button>
                        </c:if>
                        <c:if test="${order.state == 1}">
                            <button class="btn btn-success" onclick="deliverGoods(${order.orderId})">发货</button>
                        </c:if>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="orderDetail(${order.orderId})">查看详情</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<%--查看详情--%>
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
<%--                        <tr>--%>
<%--                            <td>三国演义</td>--%>
<%--                            <td>￥50</td>--%>
<%--                            <td>2</td>--%>
<%--                            <td>￥100</td>--%>
<%--                        </tr>--%>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <div class="lead" style="float: left;">合计：<span id="price"></span>元</div>
                <button id="sure" type="button" class="btn btn-primary" data-dismiss="modal" style="margin-right: 30px;">确认</button>
            </div>
        </div>

    </div>
</div>
<%--分页--%>
<div id="paging">
    <c:if test="${pageInfo.pageNum == 1}">当前为首页</c:if>
    <c:if test="${pageInfo.pageNum > 1}">
        <a href="managerOrder?pageNum=1">首页</a>
        <a href="managerOrder?pageNum=${pageInfo.prePage}">上一页</a>
    </c:if>

    <c:choose>
        <c:when test="${pageInfo.pages <= 5}">
            <c:forEach begin="1" end="${pageInfo.pages}" var="i">
                <c:if test="${i == pageInfo.pageNum}">
                    【${i}】
                </c:if>
                <c:if test="${i != pageInfo.pageNum}">
                    <a href="managerOrder?pageNum=${i}">${i}</a>
                </c:if>
            </c:forEach>
        </c:when>

        <c:when test="${pageInfo.pages >= 5}">
            <c:choose>

                <c:when test="${pageInfo.pageNum <= 3}">
                    <c:forEach begin="1" end="5" var="i">
                        <c:if test="${i == pageInfo.pageNum}">
                            【${i}】
                        </c:if>
                        <c:if test="${i != pageInfo.pageNum}">
                            <a href="managerOrder?pageNum=${i}">${i}</a>
                        </c:if>
                    </c:forEach>
                </c:when>

                <c:when test="${pageInfo.pageNum >= pageInfo.pages-3}">
                    <c:forEach begin="${pageInfo.pages-4}" end="${pageInfo.pages}" var="i">
                        <c:if test="${i == pageInfo.pageNum}">
                            【${i}】
                        </c:if>
                        <c:if test="${i != pageInfo.pageNum}">
                            <a href="managerOrder?pageNum=${i}">${i}</a>
                        </c:if>
                    </c:forEach>
                </c:when>

                <c:otherwise>
                    <c:forEach begin="${pageInfo.pageNum-2}" end="${pageInfo.pageNum+2}" var="i">
                        <c:if test="${i == pageInfo.pageNum}">
                            【${i}】
                        </c:if>
                        <c:if test="${i != pageInfo.pageNum}">
                            <a href="managerOrder?pageNum=${i}">${i}</a>
                        </c:if>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </c:when>
    </c:choose>

    <c:if test="${pageInfo.pageNum < pageInfo.pages}">
        <a href="managerOrder?pageNum=${pageInfo.nextPage}">下一页</a>
        <a href="managerOrder?pageNum=${pageInfo.pages}">末页</a>
    </c:if>
    &nbsp;&nbsp;&nbsp;
    共${pageInfo.pages}页,${pageInfo.total}条记录
    到第<input value="${pageInfo.pageNum}" name="pn" id="pn_input" style="width:30px" />页
    <input id="searchPage" type="button" value="确定">
</div>
<script>
    function agreeChargeback(id) {
        var r = confirm("您确认同意该用户退单吗?");
        if (r) {
            var url = getProjectPath()+"/agreeChargeback?id=" + id;
            $.get(url, function (response) {
                alert(response.message)
                location.href = getProjectPath()+"/managerOrder";
            })
        }
    }

    function orderDetail(id) {
        var url = getProjectPath()+"/orderDetail?id=" + id;
        $.get(url, function (response) {
            $("#orderNum").text(response.data.orderNum);
            $("#price").text(response.data.price);
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

    function deliverGoods(id) {
        var r = confirm("是否进行发货?");
        if (r) {
            var url = getProjectPath()+"/deliverGoods?id=" + id;
            $.get(url, function (response) {
                alert(response.message)
                location.href = getProjectPath()+"/managerOrder";
            })
        }
    }

    $(function (){
        $("#searchPage").click(function (){
            var pageNum = $("#pn_input").val();
            var pageTotal = ${pageInfo.pages};
            if (pageNum < 1){
                alert("输入错误")
            }
            if (pageNum > pageTotal){
                alert("不存在该页码")
            }
            else {
                location.href = getProjectPath() + "/managerOrder?pageNum=" + pageNum;
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
