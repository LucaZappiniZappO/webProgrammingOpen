/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao.jdbc;

import Dao.IdOwner;
import Dao.ReviewDao;
import Dao.entities.Product;
import Dao.entities.Review;
import Dao.entities.Shop;
import Dao.entities.User;
import Dao.jdbc.utilities.JdbcUtilities;
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
public class JdbcReviewDao extends JdbcUtilities implements ReviewDao {

    HashMap<String, String> map;
    private String tableName = "reviews";

    public JdbcReviewDao() {
        map = new HashMap<String, String>();
        map.put("product", "products_id");
        map.put("creator", "creator_id");
    }

    @Override
    public Review getReviewById(int id) throws Exception {
        HashMap<Object, String> mappa = new HashMap<Object, String>();
        mappa.put(id, "id");
        Review res = (Review) super.getObject(Review.class, map, tableName, mappa).get(0);
        return res;
    }

    @Override
    public LinkedList<Review> getRewiewByCreator(User user) throws Exception {
        HashMap<Object, String> mappa = new HashMap<Object, String>();
        mappa.put(user.getId(), "creator_id");
        LinkedList<Review> res = new LinkedList<Review>();
        for (Object o : super.getObject(Review.class, map, tableName, mappa)) {
            res.add((Review) o);
        }
        return res;
    }

    @Override
    public LinkedList<Review> getRewiewByProduct(Product product) throws Exception {
        if (!checkConnection()) {
            return null;
        }
        LinkedList<Review> res = new LinkedList<>();
        String query = "select distinct R.* from reviews R join products p on R.products_id = ? order by R.creation_date desc";
        PreparedStatement stmt = connection.prepareStatement(query);
        stmt.setDouble(1, product.getId());
        for (Object o : super.fillResult(Review.class, map, stmt.executeQuery())) {
            res.add((Review) o);
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
            return getReviewById(id);
        } catch (Exception ex) {
            Logger.getLogger(JdbcReviewDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public LinkedList<Review> getRecentReviewForShop(Shop shop) throws Exception {
        if (!checkConnection()) {
            return null;
        }
        LinkedList<Review> res = new LinkedList<>();
        String query = "select R.id, R.global_value, R.quality, R.service, R.description, R.description, R.creation_date, R.creator_id, R.products_id from reviews R join products P on P.id = R.products_id where P.shops_id = ? order by R.creation_date desc";
        PreparedStatement stmt = connection.prepareStatement(query);
        stmt.setInt(1, shop.getId());
        for (Object o : super.fillResult(Review.class, map, stmt.executeQuery())) {
            res.add((Review) o);
        }
        return res;
    }

    @Override
    public LinkedList<Review> getRecentReviewForShopForNotify(User user) throws Exception {
        if (!checkConnection()) {
            return null;
        }
        LinkedList<Review> res = new LinkedList<>();
        String query = "SELECT R.* FROM web.reviews R join products P on R.products_id = P.id join shops S on P.shops_id = S.id join users U on U.id = S.owner_id where R.status like 'not read' and U.id = ?";
        PreparedStatement stmt = connection.prepareStatement(query);
        stmt.setInt(1, user.getId());
        for (Object o : super.fillResult(Review.class, map, stmt.executeQuery())) {
            res.add((Review) o);
        }
        return res;
    }

    @Override
    public LinkedList<Review> getRewiewByCreatorAndProduct(User user, Product product) throws Exception {
        HashMap<Object, String> mappa = new HashMap<Object, String>();
        mappa.put(user.getId(), "creator_id");
        mappa.put(product.getId(), "products_id");
        LinkedList<Review> res = new LinkedList<Review>();
        for (Object o : super.getObject(Review.class, map, tableName, mappa)) {
            res.add((Review) o);
        }
        return res;
    }
}
