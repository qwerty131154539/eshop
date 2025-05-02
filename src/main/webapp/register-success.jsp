<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>註冊成功</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9f7ef;
            text-align: center;
            padding-top: 100px;
        }

        .box {
            display: inline-block;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            color: #28a745;
        }

        button {
            margin-top: 20px;
            padding: 10px 25px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .countdown {
            margin-top: 10px;
            color: #666;
        }
    </style>

    <script>
        let seconds = 10;
        function countdown() {
            const countdownSpan = document.getElementById("countdown");
            countdownSpan.innerText = seconds;
            if (seconds > 0) {
                seconds--;
                setTimeout(countdown, 1000);
            } else {
                window.location.href = "<c:url value='/home.jsp' />";
            }
        }

        window.onload = countdown;
    </script>
</head>
<body>

<div class="box">
    <h2>🎉 註冊成功！</h2>
    <p class="countdown">系統將在 <span id="countdown">10</span> 秒後自動跳轉到首頁。</p>
    <form action="<c:url value='/home.jsp' />" method="get">
        <button type="submit">立即回首頁</button>
    </form>
</div>

</body>
</html>
