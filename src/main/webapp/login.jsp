<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>用戶登入</title>
    <script src="public/jquery-3.4.1.min.js"></script>
</head>
<body>
    <h1>登入頁面</h1>
    
    <!-- 頁面右上角顯示用戶名稱與登出連結 -->
	<div style="position: absolute; top: 10px; right: 20px;">
	    <c:if test="${not empty sessionScope.session_user}">
	        歡迎，<c:out value="${sessionScope.session_user.name}" />！
	        <a href="<c:url value='/login/logout'/>">登出</a>
	    </c:if>
	</div>

    <form id="loginForm" action="<c:url value='/login/login' />" method="post">
        <table>
            <c:if test="${not empty msg}">
                <tr>
                    <td colspan="2" style="color: red;">
                        <c:out value="${msg}" />
                    </td>
                </tr>
            </c:if>
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
                    <br />
                    <button type="button" onclick="validateAndSubmit()">登入</button>
                </td>
            </tr>
        </table>
    </form>
    
    <!-- 把註冊超連結放在 form 外面 -->
	<div style="text-align: center; margin-top: 10px;">
	    <a href="<c:url value='/register/register'/>">註冊</a>
	</div>

    <br>
    <!-- 商品清單超連結 -->
    <div style="text-align: center;">
        <a href="<c:url value='/product/product-list' />">商品清單</a>
    </div>

    <script>
        function validateAndSubmit() {
            const loginId = document.querySelector("input[name='loginId']").value.trim();
            const password = document.querySelector("input[name='password']").value.trim();

            if (!loginId) {
                alert("使用者名稱不能為空");
                return;
            }
            if (!password) {
                alert("密碼不能為空");
                return;
            }

            document.getElementById("loginForm").submit();
        }
    </script>
</body>
</html>
