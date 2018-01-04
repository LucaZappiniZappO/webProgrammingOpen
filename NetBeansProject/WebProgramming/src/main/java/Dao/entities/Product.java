package Dao.entities;

import Dao.ShopDao;

/**
 * @generated
 */
public class Product extends IdOwnerComparable {

    private String name;
    private String description;
    private double price;
    private String category;
    private Shop shop;
    private int retractable;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }
    
    public void setRetractable(int r)
    {
        retractable = r;
    }
    
    public int getRetractable()
    {
        return retractable;
    }

    
    @Override
    public boolean equals(Object o){
        if(!(o instanceof Product))
            return false;
        return this.id==((Product)o).getId();
    }
    
    
}
