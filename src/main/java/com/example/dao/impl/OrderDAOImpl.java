package com.example.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.example.dao.OrderDAO;
import com.example.pojo.entity.Order;

@Repository
public class OrderDAOImpl implements OrderDAO {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void save(Order order) {
        entityManager.persist(order);
    }

    @Override
    public void update(Order order) {
        entityManager.merge(order);
    }

    @Override
    public Order findById(int orderId) {
        return entityManager.find(Order.class, orderId);
    }

    @Override
    public List<Order> findByUserId(int userId) {
        return entityManager.createQuery(
            "SELECT o FROM Order o WHERE o.user.id = :uid", Order.class)
            .setParameter("uid", userId)
            .getResultList();
    }

    @Override
    public List<Order> findAll() {
        return entityManager.createQuery("FROM Order", Order.class).getResultList();
    }
}
