<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>商品詳細資料</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.container {
	margin: 50px auto;
	width: 500px;
	border: 1px solid #ccc;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 2px 2px 10px #ddd;
}

h2 {
	text-align: center;
}

.field {
	margin-bottom: 15px;
}

.field label {
	font-weight: bold;
}
</style>
</head>
<body>

	<div style="position: absolute; top: 10px; right: 20px;">
		<c:if test="${not empty sessionScope.session_user}">
	        歡迎，<c:out value="${sessionScope.session_user.name}" />！
	        <a href="<c:url value='/login/logout'/>">登出</a>
		</c:if>
	</div>

	<div class="container">
		<h2>商品詳細資料</h2>

		<div class="field">
			<label>商品編號：</label>
			<s:property value="product.id" />
		</div>

		<div class="field">
			<label>商品名稱：</label>
			<s:property value="product.name" />
		</div>

		<div class="field">
			<label>價格：</label> $
			<s:property value="product.price" />
		</div>

		<div class="field">
			<label>產品類型(type)：</label>
			<s:property value="product.type" />
		</div>

		<s:form action="/cart/add-to-cart" method="get">
			<s:hidden name="productId" value="%{product.id}" />
			<div style="text-align: center; margin-top: 20px;">
				<s:submit value="加入購物車" />
			</div>
		</s:form>

		<div style="text-align: center; margin-top: 30px;">
			<a href="product/product-list">返回商品清單</a>
		</div>
		<div style="text-align: center; margin-top: 30px;">
			<a href="product/product-list">購物車</a>
		</div>
	</div>
</body>
</html>
