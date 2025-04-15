package com.example.dao.impl;

import com.example.dao.CategoryDAO;
import com.example.pojo.entity.Category;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<Category> getAllCategories() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Category")
                .list();
    }
}
