<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>註冊帳號</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            text-align: center;
            padding-top: 80px;
        }

        .register-box {
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

        input {
            padding: 6px;
            width: 200px;
        }

        button {
            padding: 8px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }

        a {
            margin-left: 10px;
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .message {
            margin-top: 10px;
            color: red;
        }
    </style>
</head>
<body>

<div class="register-box">
    <h2>註冊新帳號</h2>

    <form action="register/save" method="post">
        <table>
            <tr>
                <td>姓名：</td>
                <td><input type="text" name="name" required /></td>
            </tr>
            <tr>
                <td>登入帳號：</td>
                <td><input type="text" name="loginId" required /></td>
            </tr>
            <tr>
                <td>密碼：</td>
                <td><input type="password" name="password" required /></td>
            </tr>
            <tr>
                <td>電話號碼：</td>
                <td><input type="text" name="tel" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><br />
                    <button type="submit">送出註冊</button>
                    <a href="<c:url value='/login/login-page' />">回登入頁</a>
                </td>
            </tr>
        </table>
    </form>

    <c:if test="${not empty sessionScope['userMsg']}">
        <div class="message">${sessionScope['userMsg']}</div>
    </c:if>
</div>

</body>
</html>
