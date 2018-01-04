/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.shop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.entities.Shop;
import Dao.ShopDao;
import Dao.entities.Picture;
import Dao.PictureDao;
import Dao.ReviewDao;
import Dao.UserDao;
import Dao.entities.Review;
import Dao.entities.User;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import system.Log;

/**
 *
 * @author zappi
 */
public class ShopServlet extends HttpServlet {

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String begin = null;
    Integer end;
    Integer len;

    private UserDao userDao;
    private ShopDao shopDao;
    private Shop shop;

    @Override
    public void init() throws ServletException {
        userDao = (UserDao) super.getServletContext().getAttribute("userDao");
        shopDao = (ShopDao) super.getServletContext().getAttribute("shopDao");
        if (userDao == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        if (shopDao == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher reqDes = null;
        try {
            ReviewDao reviewDao = (ReviewDao) super.getServletContext().getAttribute("reviewDao");
            PictureDao pictureDao = (PictureDao) super.getServletContext().getAttribute("pictureDao");
            begin = request.getParameter("begin");
            if (begin == null) {
                begin = "0";
            }
            shop = shopDao.getShopById(id);
            LinkedList<Review> reviews = reviewDao.getRecentReviewForShop(shop);
            len = reviews.size() - 1;
            Picture picture = pictureDao.getPictureShop(shop);
            User user = (User) request.getSession().getAttribute("user");
            if (user != null) {
                request.setAttribute("user", user);
            }
            request.setAttribute("reviews", reviews);
            request.setAttribute("shop", shop);
            request.setAttribute("len", len);
            if (Integer.parseInt(begin) + 3 < len) {
                end = Integer.parseInt(begin) + 3;
            } else {
                end = len;
            }
            if (picture != null) {
                request.setAttribute("picture", picture.getPath());
            } else {
                request.setAttribute("picture", "http://via.placeholder.com/350x150");
            }
            request.setAttribute("begin", begin);
            request.setAttribute("end", end);
            request.setAttribute("id", id);
            reqDes = request.getRequestDispatcher("/shop.jsp");
            reqDes.forward(request, response);

        } catch (Exception e) {
            Log.write(e.toString());
        }

        reqDes = request.getRequestDispatcher("/shop.jsp");
        reqDes.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        shop.setCity(request.getParameter("city"));
        shop.setRegion(request.getParameter("region"));
        shop.setStreet(request.getParameter("street"));
        shop.setWebSiteUrl(request.getParameter("site"));
        DateFormat sdf = new SimpleDateFormat("hh:mm:ss");
        try {
            Time ct = new Time(sdf.parse(request.getParameter("closeT")).getTime());
            Time ot = new Time(sdf.parse(request.getParameter("openT")).getTime());
            shop.setOpenTime(ot);
            shop.setCloseTime(ct);
        } catch (ParseException ex) {
            Logger.getLogger(ShopServlet.class.getName()).log(Level.SEVERE, null, ex);
        }        
        shop.setCloseDay(request.getParameter("closeD"));
        
        try {
            shopDao.updateDao(shop);
        } catch (Exception ex) {
            Logger.getLogger(ShopServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("shop?id=" + shop.getId());

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
