/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao.jdbc;

import Dao.IdOwner;
import Dao.PurchaseDao;
import Dao.entities.Purchase;
import Dao.entities.Shop;
import Dao.entities.User;
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
public class JdbcPurchaseDao extends JdbcUtilities implements PurchaseDao{
    HashMap<String, String> map;
    private String tableName="purchases";
    
    public JdbcPurchaseDao(){
        map=new HashMap<String, String>();
        map.put("product", "products_id");
        map.put("user", "users_id");
    }
    
    @Override
    public Purchase getPurchaseById(int id) throws Exception{
        HashMap<Object,String> mappa=new HashMap<Object,String>();
        mappa.put(id,"id");
        Purchase res=(Purchase)  super.getObject(Purchase.class, map, tableName, mappa).get(0);
        return res;
    }
    
    @Override
    public Purchase getPurchaseByIdAndUser(int id,User user) throws Exception{
        HashMap<Object,String> mappa=new HashMap<Object,String>();
        mappa.put(id,"id");
        mappa.put(user.getId(),"users_id");
        Purchase res=(Purchase)  super.getObject(Purchase.class, map, tableName, mappa).get(0);
        return res;
    }
    
    @Override
    public LinkedList<Purchase> getPurchaseByUser(User user) throws Exception{
        LinkedList<Purchase> res=new LinkedList<Purchase> ();
        HashMap<Object,String> mappa=new HashMap<Object,String>();
        mappa.put(user.getId(),"users_id");
        for(Object o:super.getObject(Purchase.class, map, tableName,mappa))
        {
            Purchase p = (Purchase)o;
            if(p != null)
            {
                res.add(p);
            }
        }
        return res;
    }

  
    @Override
    public int insertDao(Object o) throws SQLException {
        return super.insertDao(o, map, tableName);
    }

    @Override
    public int deleteDao(Object o) throws SQLException {
        return super.deleteDao(o, map, tableName, 0);
    }

    @Override
    public int updateDao(IdOwner o) throws SQLException {
         return super.updateDao(o, map, tableName);
    }

    @Override
    public Object getById(int id) {
        try {
            return getPurchaseById(id);
        } catch (Exception ex) {
            Logger.getLogger(JdbcPurchaseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
