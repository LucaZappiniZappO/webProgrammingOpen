/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.myOrders;

import Dao.entities.*;
import Dao.*;
import java.io.IOException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import servlets.product.ProductServlet;

/**
 *
 * @author zappi
 */
public class MyOrdersServlet extends HttpServlet {

    private PurchaseDao purchaseDao;
    private PictureDao pictureDao;

    @Override
    public void init() throws ServletException {
        purchaseDao = (PurchaseDao) super.getServletContext().getAttribute("purchaseDao");
        if (purchaseDao == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }

        pictureDao = (PictureDao) super.getServletContext().getAttribute("pictureDao");
        if (pictureDao == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
            User user = (User) session.getAttribute("user");
            LinkedList<Purchase> ll = purchaseDao.getPurchaseByUser(user);
            //request.setAttribute("cart", cart);
            request.setAttribute("purchaseList", ll);
            request.setAttribute("pictureDao", pictureDao);
        } catch (Exception ex) {
            Logger.getLogger(ProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        RequestDispatcher reqDes = request.getRequestDispatcher("/loggedUsers/myOrders.jsp");
        reqDes.forward(request, response);

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
