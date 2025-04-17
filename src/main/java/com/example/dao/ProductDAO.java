package com.example.dao;

import java.util.List;
import com.example.pojo.entity.Product;

public interface ProductDAO {
    List<Product> getAllProducts();
    List<Product> getProductsById(int id);
}
