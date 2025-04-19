package com.example.pojo.entity;

import java.util.*;

import com.example.pojo.entity.*;

public class ShoppingCart {

    private Map<Integer, CartItem> items = new LinkedHashMap<>();

    public void addProduct(Product product) {
        CartItem item = items.get(product.getId());
        if (item == null) {
            item = new CartItem(product, 1);
            items.put(product.getId(), item);
        } else {
            item.setQuantity(item.getQuantity() + 1);
        }
    }

    public void updateQuantity(int productId, int quantity) {
        if (quantity <= 0) {
            items.remove(productId);
        } else {
            CartItem item = items.get(productId);
            if (item != null) {
                item.setQuantity(quantity);
            }
        }
    }

    public void remove(int productId) {
        items.remove(productId);
    }

    public Collection<CartItem> getItems() {
        return items.values();
    }

    public double getTotal() {
        return items.values().stream()
                .mapToDouble(CartItem::getSubtotal)
                .sum();
    }

    public int getItemCount() {
        return items.values().stream().mapToInt(CartItem::getQuantity).sum();
    }

	public void setItems(Map<Integer, CartItem> items) {
		this.items = items;
	}   
}
