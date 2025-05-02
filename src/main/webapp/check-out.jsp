<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.example.pojo.entity.*, java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>結帳</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5 mb-5">
    <div class="card shadow">
        <div class="card-header bg-dark text-white text-center">
            <h3>🔐 結帳資訊</h3>
        </div>
        <div class="card-body px-4">

            <!-- 📝 訂單資訊表單 -->
            <s:form action="order/create-order">

                <!-- 📋 使用表格排列輸入欄位 -->
                <table class="table table-borderless align-middle" style="max-width: 600px; margin: auto;">
                    <tr>
                        <th class="text-end" style="width: 30%;">收件人姓名：</th>
                        <td><s:textfield name="order.receiverName" cssClass="form-control" required="true"/></td>
                    </tr>
                    <tr>
                        <th class="text-end">連絡電話：</th>
                        <td><s:textfield name="order.receiverPhone" cssClass="form-control" required="true"/></td>
                    </tr>
                    <tr>
                        <th class="text-end">收件地址：</th>
                        <td><s:textfield name="order.receiverAddress" cssClass="form-control" required="true"/></td>
                    </tr>
                </table>

                <!-- 🛒 購買商品清單 -->
                <h5 class="text-center mt-4 mb-3">🛒 購買商品列表</h5>

                <%
                    if (cart != null && !cart.getItems().isEmpty()) {
                %>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped text-center align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th>商品名稱</th>
                                <th>價格</th>
                                <th>數量</th>
                                <th>小計</th>
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
                                <td><%= item.getQuantity() %></td>
                                <td>$<%= item.getSubtotal() %></td>
                            </tr>
                            <%
                                }
                            %>
                            <tr class="fw-bold">
                                <td colspan="3" class="text-end">總計：</td>
                                <td>$<%= cart.getTotal() %></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <%
                    } else {
                %>
                <div class="alert alert-warning text-center">⚠️ 購物車是空的</div>
                <%
                    }
                %>

                <!-- ✅ 送出訂單按鈕 -->
                <div class="text-center mt-4">
                    <s:submit value="送出訂單" cssClass="btn btn-success px-4 py-2" />
                </div>
            </s:form>

        </div>
    </div>
</div>

</body>
</html>
