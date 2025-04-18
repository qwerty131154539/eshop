package com.example.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.CartDAO;
import com.example.pojo.entity.Product;
import com.example.pojo.entity.ShoppingCart;
import com.example.service.CartService;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDAO cartDAO;

    @Override
    public void addToCart(Map<String, Object> session, int productId) {
        Product product = cartDAO.getProductById(productId);
        if (product == null) {
            throw new RuntimeException("找不到商品 ID: " + productId);
        }

        ShoppingCart cart = (ShoppingCart) session.get("cart");
        if (cart == null) {
            cart = new ShoppingCart();
            session.put("cart", cart);
        }

        cart.addProduct(product); // ✅ 將商品加入購物車                
    }
    @Override
    public void removeFromCart(Map<String, Object> session, int productId) {
        ShoppingCart cart = (ShoppingCart) session.get("cart");
        if (cart != null) {
            cart.removeProductById(productId);
        }
    }

    @Override
    public void updateQuantity(Map<String, Object> session, int productId, int quantity) {
        ShoppingCart cart = (ShoppingCart) session.get("cart");
        if (cart != null) {
            cart.updateQuantity(productId, quantity);
        }
    }

}
