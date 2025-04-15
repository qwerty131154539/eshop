package com.example.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.pojo.entity.Category;
import com.example.pojo.entity.Product;
import com.example.service.CategoryService;
import com.example.service.ProductService;
import com.opensymphony.xwork2.ActionSupport;

@Component
public class ProductAction extends ActionSupport {
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;

    private List<Product> products;
    
    private List<Category> categories;
    private String selectedType;      

    public List<Product> getProducts() {
        return products;
    }
    
    public String getAllProducts() {
        categories = categoryService.getAllCategories();
        
        if (selectedType != null && !selectedType.isEmpty()) {
            products = productService.getProductsByType(selectedType);
        } else {
            products = productService.getAllProducts();
        }
        return SUCCESS;
    }
    public List<Category> getCategories() {
        return categories;
    }

    public void setSelectedType(String selectedType) {
        this.selectedType = selectedType;
    }

    public String getSelectedType() {
        return selectedType;
    }
}
