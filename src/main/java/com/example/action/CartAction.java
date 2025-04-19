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
        cartService.addToCart(session, productId);
        return SUCCESS;
    }

    // 其他：removeFromCart(), updateQuantity() 可用同一模式擴充

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
	
}
