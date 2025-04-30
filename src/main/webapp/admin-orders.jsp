<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<title>訂單管理</title>
</head>
<body>
	<h2>🛠️ 所有訂單管理</h2>
	<table border="1">
		<tr>
			<th>訂單編號</th>
			<th>使用者</th>
			<th>日期</th>
			<th>總金額</th>
			<th>狀態</th>
			<th>操作</th>
		</tr>
		<s:iterator value="orderList">
			<tr>
				<td><s:property value="id" /></td>
				<td><s:property value="user.name" /></td>
				<td><s:property value="orderDate" /></td>
				<td>$<s:property value="totalAmount" /></td>
				<td><s:property value="status" /></td>
				<td><a
					href="order/viewOrderDetail?orderId=<s:property value='id'/>">查看</a>
					| <s:form action="order/updateStatus" method="post"
						style="display:inline;">
						<s:hidden name="orderId" value="%{id}" />
						<s:select name="order.status"
							list="#{'處理中':'處理中','已出貨':'已出貨','已完成':'已完成'}" />
						<s:submit value="更新" />
					</s:form></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>
