<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>訂單明細</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5 mb-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white text-center">
            <h3>📄 訂單明細</h3>
        </div>
        <div class="card-body px-4">

            <div class="mb-4">
                <p><strong>訂單編號：</strong> ${order.id}</p>
                <p><strong>下單日期：</strong> <fmt:formatDate value="${order.orderDate}" pattern="yyyy/MM/dd HH:mm" /></p>
                <p><strong>訂單狀態：</strong> ${order.status}</p>
                <p><strong>總金額：</strong> $${order.total}</p>
            </div>

            <h5 class="mb-3">🛍 商品明細</h5>
            <div class="table-responsive">
                <table class="table table-bordered table-striped text-center align-middle">
                    <thead class="table-secondary">
                        <tr>
                            <th>圖片</th>
                            <th>商品名稱</th>
                            <th>單價</th>
                            <th>數量</th>
                            <th>小計</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${order.items}">
                            <tr>
                                <td>
                                    <img src="${item.product.imageUrl}" alt="${item.product.name}" width="60" height="60">
                                </td>
                                <td>${item.product.name}</td>
                                <td>$${item.product.price}</td>
                                <td>${item.quantity}</td>
                                <td>$${item.product.price * item.quantity}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="text-center mt-4">
                <a href="<c:url value='/member/history-orders'/>" class="btn btn-secondary px-4 py-2">回訂單列表</a>
            </div>

        </div>
    </div>
</div>

</body>
</html>
