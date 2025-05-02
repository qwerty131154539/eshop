<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>首頁</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #f8f9fa, #e9ecef);
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .header {
            background-color: #343a40;
            color: white;
            padding: 20px;
            text-align: right;
        }

        .header span {
            float: left;
            font-size: 24px;
        }

        .header a {
            color: #ffc107;
            margin-left: 15px;
            text-decoration: none;
            font-weight: bold;
        }

        .header a:hover {
            text-decoration: underline;
        }

        .main {
            margin-top: 100px;
        }

        .main h1 {
            font-size: 48px;
            color: #343a40;
        }

        .buttons {
            margin-top: 40px;
        }

        .buttons a {
            display: inline-block;
            padding: 15px 30px;
            margin: 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        .buttons a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="header">
    <span>🛍️ 購物平台首頁</span>
    <c:if test="${not empty sessionScope.session_user}">
        歡迎，<c:out value="${sessionScope.session_user.name}" />！
        <a href="<c:url value='/login/logout'/>">登出</a>
        <a href="<c:url value='/order/my-orders' />">我的訂單</a>
    </c:if>
</div>

<div class="main">
    <h1>歡迎來到我們的線上商店！</h1>
    <div class="buttons">
        <a href="<c:url value='/login/login-page' />">登入</a>
        <a href="<c:url value='/register/register' />">註冊</a>
        <a href="<c:url value='/product/product-list' />">商品清單</a>
    </div>
</div>

</body>
</html>
