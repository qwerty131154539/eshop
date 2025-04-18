<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
            <label>價格：</label>
            $<s:property value="product.price" />
        </div>

        <div class="field">
            <label>產品類型(type)：</label>
            <s:property value="product.type" />
        </div>

        <div style="text-align:center; margin-top:30px;">
            <a href="product-list.jsp">← 返回商品清單</a>
        </div>
    </div>
</body>
</html>
