<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.example.pojo.entity.*, java.util.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
%>

<html>
<head>
    <title>結帳</title>
    <style>
        body {
            font-family: Arial;
            background: #f8f8f8;
        }
        .form-container {
            width: 80%;
            margin: auto;
            padding: 30px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-field {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .form-field label {
            width: 120px;
            text-align: right;
            margin-right: 10px;
            font-weight: bold;
        }
        .form-field input {
            flex: 1;
            padding: 5px;
            font-size: 14px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        h2, h3 {
            text-align: center;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>🔐 結帳資訊</h2>

    <s:form action="order/create-order">
        <div class="form-field">
            <label>收件人姓名：</label>
            <s:textfield name="order.receiverName" required="true" cssStyle="width: 100%;" />
        </div>
        <div class="form-field">
            <label>收件地址：</label>
            <s:textfield name="order.receiverAddress" required="true" cssStyle="width: 100%;" />
        </div>
        <div class="form-field">
            <label>連絡電話：</label>
            <s:textfield name="order.receiverPhone" required="true" cssStyle="width: 100%;" />
        </div>

        <h3>🛒 購買商品列表</h3>

        <%
            if (cart != null && !cart.getItems().isEmpty()) {
        %>
        <table>
            <tr>
                <th>商品名稱</th>
                <th>價格</th>
                <th>數量</th>
                <th>小計</th>
            </tr>
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
            <tr>
                <td colspan="3" style="text-align:right;"><strong>總計：</strong></td>
                <td>$<%= cart.getTotal() %></td>
            </tr>
        </table>
        <%
            } else {
        %>
            <p style="text-align:center;">⚠️ 購物車是空的</p>
        <%
            }
        %>

        <div style="text-align:center; margin-top: 20px;">
            <s:submit value="送出訂單" cssClass="btn" />
        </div>
    </s:form>
</div>

</body>
</html>
