<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>商品清單</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">

    <!-- 🧑‍💼 歡迎使用者區塊 -->
    <div class="d-flex justify-content-end mb-3">
        <c:if test="${not empty sessionScope.session_user}">
            歡迎，<c:out value="${sessionScope.session_user.name}" />！
            <a href="<c:url value='/login/logout'/>" class="btn btn-outline-secondary btn-sm ms-2">登出</a>
        </c:if>
    </div>

    <h2 class="mb-4">商品清單</h2>

    <!-- 🟡 篩選表單 -->
    <form action="product/product-list" method="get" class="mb-4">
        <div class="row g-3 align-items-center">
            <div class="col-auto">
                <label for="type" class="col-form-label">選擇類型：</label>
            </div>
            <div class="col-auto">
                <select name="selectedType" id="type" class="form-select">
                    <option value="">-- 全部 --</option>
                    <s:iterator value="categories">
                        <option value="<s:property value='id' />"
                            <s:if test="id == selectedType">selected="selected"</s:if>>
                            <s:property value="type" />
                        </option>
                    </s:iterator>
                </select>
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary">篩選</button>
            </div>
        </div>
    </form>

    <!-- 🔵 商品卡片列表 -->
    <div class="row">
        <s:iterator value="products">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <a href="product/product-detail?productId=<s:property value='id'/>">
					    <img src="<s:property value='imageUrl'/>" class="card-img-top" alt="<s:property value='name'/>">
					</a>

                    <div class="card-body">
                        <h5 class="card-title">
                            <a href="product/product-detail?productId=<s:property value='id'/>" class="text-decoration-none text-dark">
                                <s:property value="name"/>
                            </a>
                        </h5>
                        <p class="card-text">類型：<s:property value="type" /></p>
                        <p class="card-text text-danger fw-bold">NT$ <s:property value="price"/></p>
                    </div>
                </div>
            </div>
        </s:iterator>
    </div>

    <!-- 🔙 返回 & 購物車連結 -->
    <div class="text-center mt-4">
        <a href="<c:url value='/home.jsp' />" class="btn btn-secondary me-2">回首頁</a>
        <a href="<c:url value='/cart/go-to-cart'/>" class="btn btn-warning">前往購物車</a>
    </div>

</div>
</body>
</html>
