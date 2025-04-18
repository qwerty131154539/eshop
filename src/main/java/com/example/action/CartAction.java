package com.example.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.example.service.CartService;
import com.opensymphony.xwork2.ActionSupport;

public class CartAction extends ActionSupport implements SessionAware {

    @Autowired
    private CartService cartService;

    private int productId;
    private Map<String, Object> session;

    public String addToCart() {
    	System.out.println("🔍 加入商品 ID：" + productId);
        cartService.addToCart(session, productId); // 💡邏輯交給 Service
        return SUCCESS;
    }
    
    public String removeFromCart() {
        cartService.removeFromCart(session, productId);
        return SUCCESS;
    }

    public String updateQuantity() {
        cartService.updateQuantity(session, productId, quantity);
        return SUCCESS;
    }

    // 加上 quantity 欄位
    private int quantity;

    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    // Getter/Setter
    public void setProductId(int productId) {
        this.productId = productId;
    }
    public int getProductId() {
        return productId;
    }
    
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
	public Map<String, Object> getSession() {
		return session;
	}

    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

	public CartService getCartService() {
		return cartService;
	}    
}
