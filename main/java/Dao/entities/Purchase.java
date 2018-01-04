package Dao.entities;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @generated
 */
public class Purchase extends IdOwnerComparable {

    private int id;
    private int status;
    private Product product;
    private User user;
    private Date date;
    private double price;

    public Purchase() {

    }

    public Purchase(Product p, User u, int s, Date d,double price) {
        setProduct(p);
        setUser(u);
        setStatus(s);
        setDate(d);
        setPrice(price);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * @return the price
     */
    public double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }

    public String strDate() {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date da = date;
        return df.format(da);
    }

    public String strStatus() {
        String stts = "";

        switch (status) {
            case 0:
                stts = "Ordered";
                break;
            case 1:
                stts = "Sent";
                break;
            case 2:
                stts = "Arrived";
                break;
            case 3:
                stts = "In Shop";
                break;
        }

        return stts;
    }
}
