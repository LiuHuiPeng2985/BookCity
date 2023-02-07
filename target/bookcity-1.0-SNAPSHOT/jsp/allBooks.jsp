<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>全部书籍</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/book_list.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div id="book_header">
    <div style="float:left">
        <a class="btn btn-primary btn_a" href="${pageContext.request.contextPath}/selectType/${"计算机"}">计算机</a>
        <a class="btn btn-primary btn_a" href="${pageContext.request.contextPath}/selectType/${"文学"}">文学</a>
        <a class="btn btn-primary btn_a" href="${pageContext.request.contextPath}/selectType/${"历史"}">历史</a>
        <a class="btn btn-primary btn_a" href="${pageContext.request.contextPath}/selectType/${"管理"}">管理</a>
        <a class="btn btn-primary btn_a" href="${pageContext.request.contextPath}/selectType/${"艺术"}">艺术</a>
        <a class="btn btn-primary btn_a" href="${pageContext.request.contextPath}/selectType/${"小说"}">小说</a>
        <a class="btn btn-primary btn_a" href="${pageContext.request.contextPath}/selectType/${"童书"}">童书</a>
        <a class="btn btn-primary btn_a" href="${pageContext.request.contextPath}/selectType/${"励志"}">励志</a>
        <a class="btn btn-primary btn_a" href="${pageContext.request.contextPath}/selectType/${"文艺"}">文艺</a>
        <a class="btn btn-primary btn_a" href="${pageContext.request.contextPath}/selectType/${"经营"}">经营</a>
        <a class="btn btn-primary btn_a" href="${pageContext.request.contextPath}/selectType/${"建筑"}">建筑</a>
        <a class="btn btn-primary btn_a" href="${pageContext.request.contextPath}/selectType/${"心理学"}">心理学</a>
        <a class="btn btn-primary btn_a" href="${pageContext.request.contextPath}/selectType/${"中小学用书"}">中小学用书</a>
        <a class="btn btn-primary btn_a" href="${pageContext.request.contextPath}/selectType/${"科普读物"}">科普读物</a>
    </div>
    <form action="${pageContext.request.contextPath}/findBookByName" method="post">
        <div id="search_book">
            <input id="search_bookName" type="text" placeholder="请输入要查找的书名" name="bookName" required="required">
            <input id="search" type="submit" value="搜索">
        </div>
    </form>
</div>
<hr id="hr_first"/>
<div id="main">
    <c:forEach items="${pageInfo.list}" var="book">
    <div id="book_body">
        <div>
            <img alt="" width="150px" height="200px" src="${pageContext.request.contextPath}/${book.picture}" />
        </div>
        <div>
            <div class="book_name">
                <span>书名:</span>
                <span>${book.name}</span>
            </div>
            <div class="book_author">
                <span>作者:</span>
                <span>${book.author}</span>
            </div>
            <div class="book_price">
                <span>价格:</span>
                <span>￥${book.price}</span>
            </div>
            <div class="book_number">
                <span>库存:</span>
                <span>${book.number}</span>
            </div>
            <div class="book_type">
                <span>类型:</span>
                <span>${book.type}</span>
            </div>
            <div class="book_detail">
                <button class="viewDetails"><a href="${pageContext.request.contextPath}/viewDetail/${book.id}" style="text-decoration:none;">查看详细</a></button>
            </div>
        </div>
    </div>
    </c:forEach>
</div>
    <div id="paging">
        <c:if test="${pageInfo.pageNum == 1}">当前为首页</c:if>
        <c:if test="${pageInfo.pageNum > 1}">
            <a href="allBooks?pageNum=1">首页</a>
            <a href="allBooks?pageNum=${pageInfo.prePage}">上一页</a>
        </c:if>

        <c:choose>
            <c:when test="${pageInfo.pages <= 5}">
                <c:forEach begin="1" end="${pageInfo.pages}" var="i">
                    <c:if test="${i == pageInfo.pageNum}">
                        【${i}】
                    </c:if>
                    <c:if test="${i != pageInfo.pageNum}">
                        <a href="allBooks?pageNum=${i}">${i}</a>
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
                                <a href="allBooks?pageNum=${i}">${i}</a>
                            </c:if>
                        </c:forEach>
                    </c:when>

                    <c:when test="${pageInfo.pageNum >= pageInfo.pages-3}">
                        <c:forEach begin="${pageInfo.pages-4}" end="${pageInfo.pages}" var="i">
                            <c:if test="${i == pageInfo.pageNum}">
                                【${i}】
                            </c:if>
                            <c:if test="${i != pageInfo.pageNum}">
                                <a href="allBooks?pageNum=${i}">${i}</a>
                            </c:if>
                        </c:forEach>
                    </c:when>

                    <c:otherwise>
                        <c:forEach begin="${pageInfo.pageNum-2}" end="${pageInfo.pageNum+2}" var="i">
                            <c:if test="${i == pageInfo.pageNum}">
                                【${i}】
                            </c:if>
                            <c:if test="${i != pageInfo.pageNum}">
                                <a href="allBooks?pageNum=${i}">${i}</a>
                            </c:if>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </c:when>
        </c:choose>

        <c:if test="${pageInfo.pageNum < pageInfo.pages}">
            <a href="allBooks?pageNum=${pageInfo.nextPage}">下一页</a>
            <a href="allBooks?pageNum=${pageInfo.pages}">末页</a>
        </c:if>
        &nbsp;&nbsp;&nbsp;
        共${pageInfo.pages}页,${pageInfo.total}条记录
        到第<input value="${pageInfo.pageNum}" name="pn" id="pn_input" style="width:30px" />页
        <input id="searchPage" type="button" value="确定">
    </div>

<script>
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
                // javaScript语言中提供了一个location地址栏对象
                // 它有一个属性叫href.它可以获取浏览器地址栏中的地址
                // href属性可读，可写
                // alert(location.href)
                location.href = getProjectPath()+"/allBooks?pageNum=" + pageNum;
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