<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>商品清單</title>
</head>
<body>

    <h1>商品清單</h1>
    
    <div style="position: absolute; top: 10px; right: 20px;">
	    <c:if test="${not empty sessionScope.session_user}">
	        歡迎，<c:out value="${sessionScope.session_user.name}" />！
	        <a href="<c:url value='/login/logout'/>">登出</a>
	    </c:if>
	</div>

    <!-- 🟡 篩選表單區塊 -->
    <form action="product/product-list" method="get">
        <label for="type">選擇類型：</label>
        <select name="selectedType" id="type">
            <option value="">-- 全部 --</option>
            <s:iterator value="categories">
			    <option value="<s:property value='id' />"
			        <s:if test="id == selectedType">selected="selected"</s:if>>
			        <s:property value="type" />
			    </option>
			</s:iterator>
        </select>
        <input type="submit" value="篩選" />
    </form>

    <br>

    <!-- 🔵 商品清單表格 -->
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>名稱</th>
            <th>類型</th>
            <th>價格</th>
        </tr>
        <s:iterator value="products">
            <tr>
                <td><s:property value="id" /></td>
                <td>
				    <a href="product/product-detail?productId=<s:property value='id'/>">
					    <s:property value="name" />
					</a>
				</td>
                <td><s:property value="type" /></td>
                <td><s:property value="price" /></td>
            </tr>
        </s:iterator>
    </table>

    <br>
    <div style="text-align: center;">
        <a href="product/return">回登入頁</a>
    </div>
    <div style="text-align:center; margin-top:30px;">
        <a href="cart/go-to-cart">購物車</a>
    </div>
</body>
</html>


