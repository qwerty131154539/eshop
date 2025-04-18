package com.example.pojo.entity;

import java.util.LinkedHashMap;
import java.util.Map;
import com.example.pojo.entity.Product;

public class ShoppingCart {

    private Map<Product, Integer> items = new LinkedHashMap<>();

    public void addProduct(Product product) {
        items.put(product, items.getOrDefault(product, 0) + 1);
    }

    public void removeProductById(int productId) {
        items.keySet().removeIf(p -> p.getId() == productId);
    }

    public void updateQuantity(int productId, int quantity) {
        if (quantity <= 0) {
            removeProductById(productId);
            return;
        }

        for (Product p : items.keySet()) {
            if (p.getId() == productId) {
                items.put(p, quantity);
                return;
            }
        }
    }

    public void clear() {
        items.clear();
    }

    public double getTotal() {
        return items.entrySet().stream()
                .mapToDouble(e -> e.getKey().getPrice() * e.getValue())
                .sum();
    }

    public Map<Product, Integer> getItems() {
        return items;
    }

    public int getItemCount() {
        return items.values().stream().mapToInt(i -> i).sum();
    }
}
