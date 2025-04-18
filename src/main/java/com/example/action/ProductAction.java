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
    
    private Product product;
    
    private int selectedType;  
    private int productId;

    public List<Product> getProducts() {
        return products;
    }
    
    public String getAllOrTypeProducts() {

        categories = categoryService.getAllCategories();
        System.out.println("👉 篩選的 selectedType: " + selectedType);       
        
        if (selectedType != 0) {
            products = productService.getProductsTypeById(selectedType);
        } else {
            products = productService.getAllProducts();
        }

        return SUCCESS;
    }
    public String getProductById() {
        System.out.println("🔍 查詢商品 ID：" + productId);
        product = productService.getProductById(productId);
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
    public int getProductId() {
        return productId;
    }
    public void setProductId(int productId) {
        this.productId = productId;
    }
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}   
}
