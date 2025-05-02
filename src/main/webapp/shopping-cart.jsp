<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, com.example.pojo.entity.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>購物車</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-4">
    <!-- 🧑‍💼 使用者區塊 -->
    <div class="d-flex justify-content-end mb-3">
        <c:if test="${not empty sessionScope.session_user}">
            歡迎，<c:out value="${sessionScope.session_user.name}" />！
            <a href="<c:url value='/login/logout'/>" class="btn btn-outline-secondary btn-sm ms-2">登出</a>
        </c:if>
    </div>

    <h2 class="text-center mb-4">🛒 我的購物車</h2>

    <%
        if (cart == null || cart.getItems().isEmpty()) {
    %>
        <div class="alert alert-warning text-center">目前購物車是空的</div>
    <%
        } else {
    %>
    <table class="table table-bordered table-striped bg-white">
        <thead class="table-dark text-center">
            <tr>
                <th>商品名稱</th>
                <th>價格</th>
                <th>數量</th>
                <th>小計</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (CartItem item : cart.getItems()) {
                    Product p = item.getProduct();
            %>
            <tr>
                <td><%= p.getName() %></td>
                <td>$<%= p.getPrice() %></td>
                <td>
                    <form action="cart/update-quantity" method="get" class="d-flex justify-content-center">
                        <input type="hidden" name="productId" value="<%= p.getId() %>" />
                        <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" class="form-control form-control-sm me-2" style="width: 70px;" />
                        <input type="submit" value="更新" class="btn btn-primary btn-sm" />
                    </form>
                </td>
                <td>$<%= item.getSubtotal() %></td>
                <td>
                    <form action="cart/remove-from-cart" method="get">
                        <input type="hidden" name="productId" value="<%= p.getId() %>" />
                        <input type="submit" value="刪除" class="btn btn-danger btn-sm" />
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            <tr class="fw-bold">
                <td colspan="3" class="text-end">總計：</td>
                <td colspan="2" class="text-start">$<%= cart.getTotal() %></td>
            </tr>
        </tbody>
    </table>

    <!-- 🧾 結帳按鈕 -->
    <div class="text-center my-4">
        <form action="order/create-order-insert" method="post">
            <input type="submit" value="🧾 結帳" class="btn btn-success px-4 py-2" />
        </form>
    </div>
    <%
        }
    %>

    <!-- 🔙 返回商品清單 -->
    <div class="text-center mt-4">
        <a href="<c:url value='/product/product-list'/>" class="btn btn-secondary">← 回商品清單</a>
    </div>
</div>

</body>
</html>
