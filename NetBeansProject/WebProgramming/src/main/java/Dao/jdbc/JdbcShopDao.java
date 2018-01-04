/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao.jdbc;

import Dao.IdOwner;
import Dao.*;
import Dao.entities.Shop;
import Dao.entities.User;
import Dao.jdbc.utilities.JdbcUtilities;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;



/**
 *
 * @author Alvise
 */
public class JdbcShopDao extends JdbcUtilities implements ShopDao{
    HashMap<String, String> map;
    private String tableName="shops";
    
    public JdbcShopDao(){
        map=new HashMap<String, String>();
        map.put("owner", "owner_id");
        map.put("creator", "owner_id");
    }

    @Override
    public Shop getShopById(int id) throws Exception {
        HashMap<Object,String> mappa=new HashMap<>();
        mappa.put(id,"id");
        Shop res=(Shop)  super.getObject(Shop.class, map, tableName, mappa).get(0);
        return res;
    }

    @Override
    public Shop getShopByName(String name) throws Exception {
        HashMap<Object,String> mappa=new HashMap<Object,String>();
        mappa.put(name,"name");
        Shop res=(Shop) super.getObject(Shop.class, map, tableName , mappa).get(0);
        return res;
    }

    @Override
    public Shop getShopByOwner(User owner) throws Exception {
        HashMap<Object,String> mappa=new HashMap<Object,String>();
        mappa.put(owner.getId(),"owner_id" );
        Shop res=(Shop) super.getObject(Shop.class, map, tableName, mappa).get(0);
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
            return getShopById(id);
        } catch (Exception ex) {
            Logger.getLogger(JdbcShopDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
