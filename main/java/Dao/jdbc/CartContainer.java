/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao.jdbc;

import Dao.entities.Product;
import Dao.entities.User;

/**
 *
 * @author Alvise
 */
public class CartContainer {

    private User user;
    private Product product;

    public CartContainer() {
    }
    
    public CartContainer(User user,Product product) {
        this.user = user;
        this.product = product;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
