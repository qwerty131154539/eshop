<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>註冊帳號</title>
</head>
<body>
    <h1>註冊頁面</h1>

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
                <td colspan="2" align="center">
                    <br />
                    <button type="submit">送出註冊</button>
                    &nbsp;<a href="../login.jsp">回登入頁</a>
                </td>
            </tr>
        </table>
    </form>

    <!-- 顯示訊息（如：註冊成功、錯誤提示） -->
    <c:if test="${not empty sessionScope['userMsg']}">
        <p style="color:red;">${sessionScope['userMsg']}</p>
    </c:if>
</body>
</html>
