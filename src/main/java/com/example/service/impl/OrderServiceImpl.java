package com.example.service.impl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.OrderDAO;
import com.example.pojo.entity.*;
import com.example.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDAO orderDAO;

    @Override
    public void createOrder(User user, Map<String, Object> session) {
        ShoppingCart cart = (ShoppingCart) session.get("cart");
        if (cart == null || cart.getItems().isEmpty()) return;

        Order order = new Order();
        order.setUser(user);
        order.setOrderDate(new Date());
        order.setStatus("處理中");

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
        order.setTotal(cart.getTotal());

        orderDAO.save(order);

        session.remove("cart"); // 清除購物車
    }

    @Override
    public List<Order> getOrdersByUser(int userId) {
        return orderDAO.findByUserId(userId);
    }

    @Override
    public List<Order> getAllOrders() {
        return orderDAO.findAll();
    }

    @Override
    public Order getOrderById(int orderId) {
        return orderDAO.findById(orderId);
    }

    @Override
    public void updateOrderStatus(int orderId, String status) {
        Order order = orderDAO.findById(orderId);
        if (order != null) {
            order.setStatus(status);
            orderDAO.update(order);
        }
    }
}
