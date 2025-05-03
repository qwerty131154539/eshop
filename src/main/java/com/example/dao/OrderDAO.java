package com.example.dao;

import java.util.List;

import com.example.pojo.entity.Order;

public interface OrderDAO {
    void save(Order order);
    void update(Order order);
    Order findById(int orderId);
    Order findByIdWithItemsAndProducts(int orderId);
    List<Order> findByUserId(String userId);
    List<Order> findAll();
}
