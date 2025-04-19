package com.example.dao.impl;

import javax.persistence.*;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.CartDAO;
import com.example.pojo.entity.*;

@Repository
@Transactional
public class CartDAOImpl implements CartDAO {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void addToCart(int userId, int productId) {
        ShoppingCart cart = findCartByUserId(userId);

        if (cart == null) {
            cart = new ShoppingCart();
            cart.setUserId(userId);
            entityManager.persist(cart);
        }

        Product product = entityManager.find(Product.class, productId);
        if (product == null) {
            throw new IllegalArgumentException("商品不存在");
        }

        cart.addProduct(product); // 加入或增加數量
        entityManager.merge(cart); // 儲存購物車和內部的 cart item
    }

    @Override
    public ShoppingCart findCartByUserId(int userId) {
        try {
            return entityManager.createQuery(
                "SELECT c FROM ShoppingCart c WHERE c.userId = :userId", ShoppingCart.class)
                .setParameter("userId", userId)
                .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
}
