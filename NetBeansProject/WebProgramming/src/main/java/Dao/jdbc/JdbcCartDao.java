/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao.jdbc;

import Dao.CartDao;
import Dao.IdOwner;
import Dao.entities.*;
import Dao.jdbc.utilities.JdbcUtilities;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Alvise
 */
public class JdbcCartDao extends JdbcUtilities implements CartDao {

    HashMap<String, String> map;
    private String tableName = "cart";

    public JdbcCartDao() {
        map = new HashMap<String, String>();
        map.put("user", "users_id");
        map.put("product", "products_id");
    }

    @Override
    public Object getById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Cart getByUser(User user) throws Exception {
        HashMap<Object, String> mappa = new HashMap<Object, String>();
        mappa.put(user.getId(), "users_id");
        Cart res = new Cart();
        for (Object o : super.getObject(CartContainer.class, map, tableName, mappa)) {
            if (o != null) {
                CartContainer cc = (CartContainer) o;
                res.setUser(cc.getUser());
                res.getProducts().add(cc.getProduct());
            } else {
                return null;
            }
        }
        return res;
    }

    @Override
    public int insertDao(Object o) throws SQLException {
        Cart c = (Cart) o;
        for (Product p : c.getProducts()) {
            return super.insertDao(new CartContainer(c.getUser(), p), map, tableName);
        }
        return 0;
    }

    @Override
    public int updateDao(IdOwner o) throws SQLException {
        Cart c = (Cart) o;
        LinkedList<Product> oldP = c.getOldStatus();
        LinkedList<Product> newP = c.getProducts();
        Integer res = 0;

        for (Product p : oldP) {
            for(int i=0;i<countInList(oldP,p)-countInList(newP,p);i++)
                res += super.deleteDao(new CartContainer(c.getUser(), p), map, tableName, 1);
        }
        for (Product p : newP) {
            for(int i=0;i<countInList(newP,p)-countInList(oldP,p);i++)
                res += super.insertDao(new CartContainer(c.getUser(), p), map, tableName);
        }
        c.flush();
        return res;
    }

    @Override
    public int deleteDao(Object o) throws SQLException {
        Cart c = (Cart) o;
        c.flush();
        return super.deleteDao(new CartContainer(c.getUser(), null), map, tableName, 0);
    }
    
    private int countInList(LinkedList l,Object o){
        int res=0;
        for(Object p:l)
            if(p==o)
                res++;
        return res;
    }

}
