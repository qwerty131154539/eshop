package com.example.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.OrderDAO;
import com.example.pojo.entity.CartItem;
import com.example.pojo.entity.Order;
import com.example.pojo.entity.OrderItem;
import com.example.pojo.entity.ShoppingCart;
import com.example.pojo.entity.User;
import com.example.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDAO orderDAO;

    @Override
    public void createOrder(Order order) {
        // 直接儲存，因為 Order 物件已經在 Action 裡準備好了（包含 User、Items 等）
        orderDAO.save(order);
    }

    @Override
    public List<Order> getOrdersByUser(String userId) {
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

