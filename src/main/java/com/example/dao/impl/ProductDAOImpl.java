package com.example.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dao.ProductDAO;
import com.example.pojo.entity.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

    @Autowired
    private SessionFactory sessionFactory;
    
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Product> getAllProducts() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Product", Product.class)
                .list();
    }
    @Override
    public List<Product> getProductsTypeById(int id) {
        return sessionFactory.getCurrentSession()
                .createQuery("SELECT p FROM Product p JOIN FETCH p.category c WHERE c.id = :id", Product.class)
                .setParameter("id", id)
                .list();
    }
    
    @Override
    public Product getProductById(int id) {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Product p LEFT JOIN FETCH p.category WHERE p.id = :id", Product.class)
                .setParameter("id", id)
                .uniqueResult();
    }

    @Override
    public Product findById(int id) {
        return entityManager.find(Product.class, id);
    }
}
