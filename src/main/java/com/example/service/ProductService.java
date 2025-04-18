package com.example.service;

import java.util.List;
import com.example.pojo.entity.Product;

public interface ProductService {
    List<Product> getAllProducts();
    List<Product> getProductsTypeById(int id);
    Product getProductById(int id);
}
