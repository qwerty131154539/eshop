<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>訂單成功</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5 mb-5">
    <div class="card shadow">
        <div class="card-header bg-success text-white text-center">
            <h3>✅ 訂單成功！</h3>
        </div>
        <div class="card-body px-4">

            <p class="text-center">您的訂單已送出，感謝您的購買。</p>

            <s:if test="#session.last_order != null">
                <s:set var="order" value="#session.last_order" />

                <h5>訂單編號：<s:property value="#order.id" /></h5>
                <p>收件人：<s:property value="#order.receiverName" /></p>
                <p>地址：<s:property value="#order.receiverAddress" /></p>
                <p>電話：<s:property value="#order.receiverPhone" /></p>
                <p>狀態：<s:property value="#order.status" /></p>
                <p>總金額：$<s:property value="#order.total" /></p>

                <h5>商品清單</h5>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped text-center align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th>商品名稱</th>
                                <th>數量</th>
                                <th>單價</th>
                                <th>小計</th>
                            </tr>
                        </thead>
                        <tbody>
                            <s:iterator value="#order.items" var="item">
                                <tr>
                                    <td><s:property value="#item.product.name" /></td>
                                    <td><s:property value="#item.quantity" /></td>
                                    <td>$<s:property value="#item.product.price" /></td>
                                    <td>$<s:property value="#item.subtotal" /></td>
                                </tr>
                            </s:iterator>
                        </tbody>
                    </table>
                </div>
            </s:if>

            <s:else>
                <p class="alert alert-warning text-center">⚠ 無法取得訂單資訊。</p>
            </s:else>

            <div class="text-center mt-4">
                <a href="product/product-list" class="btn btn-primary px-4 py-2">繼續購物</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
