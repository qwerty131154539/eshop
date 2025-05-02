<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>用戶登入</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f8f9fa;
            margin: 0;
            padding: 40px;
        }

        .login-box {
            display: inline-block;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        table {
            margin: 0 auto;
        }

        td {
            padding: 8px;
        }

        button {
            padding: 8px 20px;
            background-color: #007bff;
            border: none;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<div class="login-box">
    <h2>登入</h2>

    <c:if test="${not empty msg}">
        <div class="error"><c:out value="${msg}" /></div>
    </c:if>

    <form id="loginForm" action="<c:url value='/login/login' />" method="post">
        <table>
            <tr>
                <td>使用者名稱：</td>
                <td><input type="text" name="loginId" value='<c:out value="${loginId}"/>' required></td>
            </tr>
            <tr>
                <td>密碼：</td>
                <td><input type="password" name="password" required></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit">登入</button>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
