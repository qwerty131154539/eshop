<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>商品詳細資料</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">

    <!-- 🧑‍💼 使用者區塊 -->
    <div class="d-flex justify-content-end mb-3">
        <c:if test="${not empty sessionScope.session_user}">
            歡迎，<c:out value="${sessionScope.session_user.name}" />！
            <a href="<c:url value='/login/logout'/>" class="btn btn-outline-secondary btn-sm ms-2">登出</a>
        </c:if>
    </div>

    <div class="card mb-4">
        <div class="row g-0">
            <!-- 商品圖片 -->
            <div class="col-md-5">
                <img src="<s:property value='product.imageUrl'/>" class="img-fluid rounded-start" alt="<s:property value='product.name'/>">
            </div>

            <!-- 商品資訊 -->
            <div class="col-md-7">
                <div class="card-body">
                    <h3 class="card-title"><s:property value="product.name"/></h3>
                    <p class="card-text"><strong>商品編號：</strong> <s:property value="product.id"/></p>
                    <p class="card-text"><strong>說明：</strong> <s:property value="product.description"/></p>
                    <p class="card-text"><strong>價格：</strong> <span class="text-danger fw-bold">NT$ <s:property value="product.price"/></span></p>
                    <p class="card-text"><strong>庫存：</strong> <s:property value="product.stock"/></p>
                    <p class="card-text"><strong>類型：</strong> <s:property value="product.type"/></p>
                    <p class="card-text"><strong>分類：</strong> <s:property value="product.category.type"/></p>

                    <!-- 加入購物車表單 -->
                    <s:form action="/cart/add-to-cart" method="get" cssClass="mt-4">
                        <s:hidden name="productId" value="%{product.id}" />
                        <s:submit value="加入購物車" cssClass="btn btn-primary"/>
                    </s:form>
                </div>
            </div>
        </div>
    </div>

    <!-- 導覽按鈕 -->
    <div class="text-center">
        <a href="product/product-list" class="btn btn-secondary me-2">返回商品清單</a>
        <a href="cart/go-to-cart" class="btn btn-warning">前往購物車</a>
    </div>

</div>
</body>
</html>
