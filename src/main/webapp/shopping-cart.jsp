<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.example.pojo.entity.*" %>

<%
    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
%>

<html>
<head>
    <title>購物車</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f8f8f8; }
        table { border-collapse: collapse; width: 80%; margin: 30px auto; background: #fff; }
        th, td { padding: 10px; border: 1px solid #ccc; text-align: center; }
        h2 { text-align: center; margin-top: 40px; }
        .btn { padding: 5px 10px; margin: 5px; }
        .center { text-align: center; margin-top: 30px; }
    </style>
</head>
<body>

<h2>🛒 購物車</h2>

<%
    if (cart == null || cart.getItems().isEmpty()) {
%>
    <p style="text-align:center;">目前購物車是空的</p>
<%
    } else {
%>
    <form action="cart/update-quantity" method="post">
        <table>
            <tr>
                <th>商品名稱</th>
                <th>價格</th>
                <th>數量</th>
                <th>小計</th>
                <th>操作</th>
            </tr>

            <%
                for (CartItem item : cart.getItems()) {
                    Product p = item.getProduct();
            %>
            <tr>
                <td><%= p.getName() %></td>
                <td>$<%= p.getPrice() %></td>

                <!-- 修改數量 -->
                <td>
                    <form action="cart/update-quantity" method="get" style="display:inline;">
                        <input type="hidden" name="productId" value="<%= p.getId() %>" />
                        <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" style="width: 60px;" />
                        <input type="submit" value="更新" class="btn" />
                    </form>
                </td>

                <td>$<%= item.getSubtotal() %></td>

                <!-- 刪除 -->
                <td>
                    <form action="cart/remove-from-cart" method="get" style="display:inline;">
                        <input type="hidden" name="productId" value="<%= p.getId() %>" />
                        <input type="submit" value="刪除" class="btn" />
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            <tr>
                <td colspan="3" align="right"><strong>總計：</strong></td>
                <td colspan="2">$<%= cart.getTotal() %></td>
            </tr>
        </table>
    </form>
<%
    }
%>

    <div class="center">
        <a href="product/product-list">← 回商品清單</a>
    </div>

</body>
</html>
