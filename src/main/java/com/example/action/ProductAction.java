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
    private int selectedType;      

    public List<Product> getProducts() {
        return products;
    }
    
    public String getAllOrTypeProducts() {

        categories = categoryService.getAllCategories();
        System.out.println("👉 篩選的 selectedType: " + selectedType);       
        
        if (selectedType != 0) {
            products = productService.getProductsById(selectedType);
        } else {
            products = productService.getAllProducts();
        }
//        for (Product p : products) {
//            System.out.println("✅ 產品: " + p.getName() + ", 類型: " + (p.getCategory() != null ? p.getCategory().getType() : "NULL"));
//        }
        return SUCCESS;
    }
    public List<Category> getCategories() {
        return categories;
    }

    public void setSelectedType(int selectedType) {
        this.selectedType = selectedType;
    }
    public int getSelectedType() {
        return selectedType;
    }
}
