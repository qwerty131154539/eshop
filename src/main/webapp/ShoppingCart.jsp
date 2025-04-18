<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.example.pojo.entity.Product, com.example.pojo.entity.ShoppingCart" %>
<%
    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
%>
<html>
<head>
    <title>購物車</title>
    <style>
        body { font-family: Arial, sans-serif; }
        table { border-collapse: collapse; width: 80%; margin: 20px auto; }
        th, td { padding: 10px; border: 1px solid #ccc; text-align: center; }
        h2 { text-align: center; }
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
            Map<Product, Integer> items = cart.getItems();
    %>
        <table>
            <tr>
                <th>商品名稱</th>
                <th>價格</th>
                <th>數量</th>
                <th>小計</th>
            </tr>
            <%
                for (Map.Entry<Product, Integer> entry : items.entrySet()) {
                    Product p = entry.getKey();
                    int qty = entry.getValue();
                    double subtotal = p.getPrice() * qty;
            %>
                <tr>
                    <td><%= p.getName() %></td>
                    <td>$<%= p.getPrice() %></td>
                    <td><%= qty %></td>
                    <td>$<%= subtotal %></td>
                </tr>
                <td>
				    <form action="update-quantity" method="post">
				        <input type="hidden" name="productId" value="<%= p.getId() %>" />
				        <input type="number" name="quantity" value="<%= qty %>" min="1" />
				        <input type="submit" value="更新" />
				    </form>
				    <form action="remove-from-cart" method="post" style="display:inline;">
				        <input type="hidden" name="productId" value="<%= p.getId() %>" />
				        <input type="submit" value="刪除" />
				    </form>
				</td>
                
            <%
                }
            %>
            <tr>
                <td colspan="3" align="right"><strong>總計：</strong></td>
                <td>$<%= cart.getTotal() %></td>
            </tr>
        </table>
    <%
        }
    %>

</body>
</html>
