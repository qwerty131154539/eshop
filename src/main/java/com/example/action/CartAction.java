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
    private int quantity;
    private Map<String, Object> session;

    public String addToCart() {
    	System.out.println("🔍 加入商品 ID：" + productId);
    	if (quantity <= 0) quantity = 1; // 防呆
        cartService.addToCart(session, productId, quantity);
        return SUCCESS;
    }

    // 移除商品
    public String removeFromCart() {
        System.out.println("🗑 移除商品 ID：" + productId);
        cartService.removeFromCart(session, productId);
        return SUCCESS;
    }

    // 更新數量
    public String updateQuantity() {
        System.out.println("✏️ 更新商品 ID：" + productId + " 數量：" + quantity);
        cartService.updateQuantity(session, productId, quantity);
        return SUCCESS;
    }
    
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

    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

	public CartService getCartService() {
		return cartService;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	} 
}
