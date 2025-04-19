package com.example.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.ProductDAO;
import com.example.pojo.entity.Product;
import com.example.pojo.entity.ShoppingCart;
import com.example.service.CartService;

@Service
public class CartServiceImpl implements CartService{

    private static final String SESSION_CART_KEY = "cart";

    @Autowired
    private ProductDAO productDAO;

    public void addToCart(Map<String, Object> session, int productId) {
        ShoppingCart cart = getOrCreateCart(session);
        Product product = productDAO.findById(productId);
        if (product != null) {
            cart.addProduct(product);
        }
    }

    private ShoppingCart getOrCreateCart(Map<String, Object> session) {
        ShoppingCart cart = (ShoppingCart) session.get(SESSION_CART_KEY);
        if (cart == null) {
            cart = new ShoppingCart();
            session.put(SESSION_CART_KEY, cart);
        }
        return cart;
    }

    // 可擴充：removeFromCart(), updateQuantity()
}
