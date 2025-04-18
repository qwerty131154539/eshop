package com.example.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.dao.ProductDAO;
import com.example.pojo.entity.Product;
import com.example.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDAO productDAO;

    @Override
    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }
    
    @Override
    public List<Product> getProductsTypeById(int id) {
        return productDAO.getProductsTypeById(id);
    }
    
    @Override
    public Product getProductById(int id) {
        return productDAO.getProductById(id);
    }
}
