/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao.jdbc;

import Dao.IdOwner;
import Dao.PictureDao;
import Dao.jdbc.utilities.JdbcUtilities;
import Dao.entities.Picture;
import Dao.entities.Product;
import Dao.entities.Shop;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Alvise
 */
public class JdbcPictureDao extends JdbcUtilities implements PictureDao {

    HashMap<String, String> map;
    private String tableName = "pictures";

    public JdbcPictureDao() {
        map = new HashMap<String, String>();
        map.put("product", "products_id");
        map.put("shop", "shops_id");
    }

    @Override
    public Picture getPictureById(int id) throws Exception {
        HashMap<Object, String> mappa = new HashMap<Object, String>();
        mappa.put(id, "id");
        return (Picture) super.getObject(Picture.class, map, tableName, mappa).get(0);
    }

    @Override
    public LinkedList<Picture> getPictureByProduct(Product product) throws Exception {
        HashMap<Object, String> mappa = new HashMap<Object, String>();
        mappa.put(product.getId(), "products_id");
        LinkedList<Picture> res = new LinkedList<Picture>();
        for (Object o : super.getObject(Picture.class, map, tableName, mappa)) {
            res.add((Picture) o);
        }
        return res;
    }

    @Override
    public LinkedList<Picture> getPictureByShop(Shop shop) throws Exception {
        HashMap<Object, String> mappa = new HashMap<Object, String>();
        mappa.put(shop.getId(), "shops_id");
        LinkedList<Picture> res = new LinkedList<Picture>();
        for (Object o : super.getObject(Picture.class, map, tableName, mappa)) {
            res.add((Picture) o);
        }
        return res;
    }

    @Override
    public Picture getPictureShop(Shop shop) throws Exception {
        if (!checkConnection()) {
            return null;
        }
        
        String query = "SELECT * FROM web.pictures where products_id IS NULL AND shops_id = ?;";
        PreparedStatement stmt = connection.prepareStatement(query);
        stmt.setDouble(1, shop.getId());
        LinkedList<Object> o = super.fillResult(Picture.class, map, stmt.executeQuery());
        Picture res = (Picture) o.get(0);
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
            return getPictureById(id);
        } catch (Exception ex) {
            Logger.getLogger(JdbcPictureDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
