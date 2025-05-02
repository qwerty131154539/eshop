package com.example.service;

import java.util.List;
import java.util.Map;

import com.example.pojo.entity.Order;
import com.example.pojo.entity.User;

public interface OrderService {
	void createOrder(Order order);
    List<Order> getOrdersByUser(String userId);
    List<Order> getAllOrders();
    Order getOrderById(int orderId);
    void updateOrderStatus(int orderId, String status);
}
