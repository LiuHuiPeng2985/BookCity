<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>用户管理</title>
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
                <th>用户编号</th>
                <th>用户名</th>
                <th>邮箱</th>
            </tr>
            <c:forEach items="${pageInfo.list}" var="user">
                <tr style="height: 50px;background-color: #f6f6f6">
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<%--分页--%>
<div id="paging">
    <c:if test="${pageInfo.pageNum == 1}">当前为首页</c:if>
    <c:if test="${pageInfo.pageNum > 1}">
        <a href="managerUser?pageNum=1">首页</a>
        <a href="managerUser?pageNum=${pageInfo.prePage}">上一页</a>
    </c:if>

    <c:choose>
        <c:when test="${pageInfo.pages <= 5}">
            <c:forEach begin="1" end="${pageInfo.pages}" var="i">
                <c:if test="${i == pageInfo.pageNum}">
                    【${i}】
                </c:if>
                <c:if test="${i != pageInfo.pageNum}">
                    <a href="managerUser?pageNum=${i}">${i}</a>
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
                            <a href="managerUser?pageNum=${i}">${i}</a>
                        </c:if>
                    </c:forEach>
                </c:when>

                <c:when test="${pageInfo.pageNum >= pageInfo.pages-3}">
                    <c:forEach begin="${pageInfo.pages-4}" end="${pageInfo.pages}" var="i">
                        <c:if test="${i == pageInfo.pageNum}">
                            【${i}】
                        </c:if>
                        <c:if test="${i != pageInfo.pageNum}">
                            <a href="managerUser?pageNum=${i}">${i}</a>
                        </c:if>
                    </c:forEach>
                </c:when>

                <c:otherwise>
                    <c:forEach begin="${pageInfo.pageNum-2}" end="${pageInfo.pageNum+2}" var="i">
                        <c:if test="${i == pageInfo.pageNum}">
                            【${i}】
                        </c:if>
                        <c:if test="${i != pageInfo.pageNum}">
                            <a href="managerUser?pageNum=${i}">${i}</a>
                        </c:if>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </c:when>
    </c:choose>

    <c:if test="${pageInfo.pageNum < pageInfo.pages}">
        <a href="managerUser?pageNum=${pageInfo.nextPage}">下一页</a>
        <a href="managerUser?pageNum=${pageInfo.pages}">末页</a>
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
                location.href = getProjectPath()+"/managerUser";
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
