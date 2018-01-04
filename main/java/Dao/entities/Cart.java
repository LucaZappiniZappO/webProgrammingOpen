package Dao.entities;

import java.util.LinkedList;

public class Cart extends IdOwnerComparable {

    private User user;
    private LinkedList<Product> products;
    private LinkedList<Product> oldProducts=null;

    public Cart() {
        products = new LinkedList<Product>();
    }

    public Cart(User user) {
        setUser(user);
        products = new LinkedList<Product>();
    }
    
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LinkedList<Product> getProducts() {
        return products;
    }
    
    public void addProduct(Product product) {
       if(oldProducts==null)
            setStatus(products);
        this.products.add(product);
    }

    public boolean removeProduct(Product product) {
        if(oldProducts==null)
            setStatus(products);
        return this.products.remove(product);
    }

    public void setProducts(LinkedList<Product> products) {
        if(oldProducts==null)
            setStatus(products);
        this.products = products;
    }
    
    public void flush(){
        oldProducts=null;
    }

    public int countProduct(Product product) {
        int res = 0;
        for (Product p : products) {
            if (p.equals(product)) 
                res++;  
        }
        return res;
    }

    public LinkedList<Product> getOldStatus() {
        if(oldProducts==null)
            return products;
        return oldProducts;
    }

    public void setStatus(LinkedList<Product> Products) {
        oldProducts = new LinkedList<Product>();
        Products.forEach((item)->{
            oldProducts.add(item);
        });
    }
    
    public double getTotal()
    {
        double res = 0;
        for(Product p:products)            
            res+=p.getPrice();
        return res;
    }
    
    public void emptyCart()
    {
        products.clear();
    }
    
    
    public int getRetract()
    {
        
        for(Product p:products)
        {
            if(!(p.getRetractable() > 0))
                return 0;
        }
        return 1;
    }
    
}
