package com.example.service;

import java.util.Map;

public interface CartService {
    void addToCart(Map<String, Object> session, int productId, int quantity);
    void removeFromCart(Map<String, Object> session, int productId);
    void updateQuantity(Map<String, Object> session, int productId, int quantity);
}
