<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<title>我的訂單</title>
</head>
<body>
	<h2>🧾 我的歷史訂單</h2>
	<table border="1">
		<tr>
			<th>訂單編號</th>
			<th>訂單日期</th>
			<th>總金額</th>
			<th>狀態</th>
			<th>操作</th>
		</tr>
		<s:iterator value="orderList">
			<tr>
				<td><s:property value="id" /></td>
				<td><s:property value="orderDate" /></td>
				<td>$<s:property value="totalAmount" /></td>
				<td><s:property value="status" /></td>
				<td><a
					href="order/viewOrderDetail?orderId=<s:property value='id'/>">查看</a></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>
