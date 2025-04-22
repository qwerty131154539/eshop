<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head><title>訂單明細</title></head>
<body>
    <h2>📋 訂單編號：<s:property value="order.id"/></h2>
    <p>收件人：<s:property value="order.receiverName"/></p>
    <p>地址：<s:property value="order.receiverAddress"/></p>
    <p>電話：<s:property value="order.receiverPhone"/></p>
    <p>狀態：<s:property value="order.status"/></p>

    <h3>商品清單</h3>
    <table border="1">
        <tr>
            <th>商品名稱</th>
            <th>數量</th>
            <th>單價</th>
            <th>小計</th>
        </tr>
        <s:iterator value="order.orderItems">
            <tr>
                <td><s:property value="product.name"/></td>
                <td><s:property value="quantity"/></td>
                <td>$<s:property value="price"/></td>
                <td>$<s:property value="price * quantity"/></td>
            </tr>
        </s:iterator>
    </table>
</body>
</html>
