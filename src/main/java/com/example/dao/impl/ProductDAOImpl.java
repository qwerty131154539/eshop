package com.example.dao.impl;

import com.example.dao.ProductDAO;
import com.example.pojo.entity.Product;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDAOImpl implements ProductDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Product> getAllProducts() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Product", Product.class)
                .list();
    }

    @Override
    public List<Product> getProductsByType(String type) {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Product WHERE category.type = :type", Product.class)
                .setParameter("type", type)
                .list();
    }
}
