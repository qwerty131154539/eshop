package com.example.service;

import java.util.Map;

public interface CartService {
    void addToCart(Map<String, Object> session, int productId);
}
