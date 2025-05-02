package com.example.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.example.pojo.entity.CartItem;
import com.example.pojo.entity.Order;
import com.example.pojo.entity.OrderItem;
import com.example.pojo.entity.ShoppingCart;
import com.example.pojo.entity.User;
import com.example.service.OrderService;
import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport implements SessionAware {

    private Map<String, Object> session;

    @Autowired
    private OrderService orderService;

    private Order order;
    private int orderId;
    private List<Order> orderList;

    /** 1. 建立訂單（從購物車建立） */
    public String createOrder() {
        User user = (User) session.get("session_user");
        if (user == null) return "login";

        // 檢查購物車
        ShoppingCart cart = (ShoppingCart) session.get("cart");
        if (cart == null || cart.getItems().isEmpty()) {
            return "error";
        }

        // 直接使用 Struts2 綁定進來的 Order 物件
        order.setUser(user);
        order.setOrderDate(new Date());
        order.setStatus("處理中");
        order.setTotal(cart.getTotal());

        List<OrderItem> items = new ArrayList<>();
        for (CartItem ci : cart.getItems()) {
            OrderItem item = new OrderItem();
            item.setProduct(ci.getProduct());
            item.setQuantity(ci.getQuantity());
            item.setSubtotal(ci.getSubtotal());
            item.setOrder(order);
            items.add(item);
        }

        order.setItems(items);

        // 呼叫 service 儲存訂單（這邊記得改成傳入 order，不要再傳 user+session）
        orderService.createOrder(order);
        
        session.put("last_order_id", order.getId());
        
        session.put("last_order", order);

        // 清空購物車
        session.remove("cart");

        return "success";
    }



    /** 2. 查看自己的訂單清單 */
    public String listUserOrders() {
        User user = (User) session.get("session_user");
        if (user == null) return "login";

        orderList = orderService.getOrdersByUser(user.getId());
        return "myOrders"; // 導向 my-orders.jsp
    }

    /** 3. 管理者查看所有訂單 */
    public String adminOrderList() {
        orderList = orderService.getAllOrders();
        return "adminOrders"; // 導向 admin-orders.jsp
    }

    /** 4. 查看訂單明細 */
    public String viewOrderDetail() {
        order = orderService.getOrderById(orderId);
        return "orderDetail"; // 導向 order-detail.jsp
    }

    /** 5. 更新訂單狀態（例如：改成已出貨） */
    public String updateStatus() {
        orderService.updateOrderStatus(orderId, order.getStatus());
        return "redirectList"; // 可設 redirect:/admin-orders.jsp
    }

    // Getters & Setters
    public void setSession(Map<String, Object> session) { this.session = session; }
    public Order getOrder() { return order; }
    public void setOrder(Order order) { this.order = order; }
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }
    public List<Order> getOrderList() { return orderList; }

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
    
}
