<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>我的歷史訂單</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5 mb-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white text-center">
            <h3>📦 我的歷史訂單</h3>
        </div>
        <div class="card-body px-4">

            <c:if test="${empty orderList}">
                <p class="alert alert-info text-center">目前尚無訂單。</p>
            </c:if>

            <c:if test="${not empty orderList}">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped text-center align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th>訂單編號</th>
                                <th>日期</th>
                                <th>總金額</th>
                                <th>狀態</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orderList}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy/MM/dd HH:mm" /></td>
                                    <td>$${order.total}</td>
                                    <td>${order.status}</td>
                                    <td>
                                        <a href="<c:url value='/order/order-detail?orderId=${order.id}' />" class="btn btn-primary btn-sm">查看</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>

            <div class="text-center mt-4">
                <a href="<c:url value='/'/>" class="btn btn-secondary px-4 py-2">回首頁</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
