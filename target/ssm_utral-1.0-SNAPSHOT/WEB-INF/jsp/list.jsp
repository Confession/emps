<%--
  Created by IntelliJ IDEA.
  User: 23886
  Date: 2020/7/24
  Time: 0:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-2.1.3.min.js"></script>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 搭建显示页面 -->
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>员工信息管理系统</h1>
        </div>
    </div>
    <!-- 新增 删除 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button type="button" class="btn btn-primary">新增</button>
            <button type="button" class="btn btn-danger">删除</button>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped">
                <tr>
                    <th>ID</th>
                    <th>empname</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list }" var="emp">
                    <tr>
                        <th>${emp.empId }</th>
                        <th>${emp.empName }</th>
                        <th>${emp.gender}</th>
                        <th>${emp.empEmail }</th>
                        <th>${emp.dept.deptName }</th>
                        <th>
                            <button type="button" class="btn btn-primary btn-sm">
                                修改 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            </button>
                            <button type="button" class="btn btn-danger btn-sm">
                                删除 <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            </button>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <!-- 显示分页信息 -->
    <div class="row">
        <!-- 分页文字信息 -->
        <div class="col-md-6">
            当前第${pageInfo.pageNum }页,总${pageInfo.pages }页,总共有${pageInfo.total }条记录
        </div>
        <!-- 分页条信息 -->
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PATH }/emps?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li><a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous"> <span
                                aria-hidden="true">&laquo;</span>
                        </a></li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums }" var="currentPageNum">
                        <c:if test="${currentPageNum == pageInfo.pageNum }">
                            <li class="active"><a href="#">${currentPageNum}</a></li>
                        </c:if>
                        <c:if test="${currentPageNum != pageInfo.pageNum }">
                            <li><a href="${APP_PATH }/emps?pn=${currentPageNum}">${currentPageNum}</a></li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${pageInfo.hasNextPage }">
                        <li><a href="${APP_PATH }/emps?pn=${pageInfo.pageNum+1}" aria-label="Next"> <span
                                aria-hidden="true">&raquo;</span>
                        </a></li>
                    </c:if>
                    <li><a href="${APP_PATH }/emps?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
