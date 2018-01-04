/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.cart;

import Dao.*;
import Dao.entities.Cart;
import Dao.entities.Product;
import Dao.entities.User;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import servlets.product.ProductServlet;
import system.Log;

/**
 *
 * @author zappi
 */
public class CartServlet extends HttpServlet {

    private ProductDao productDao;
    private CartDao cartDao;
    private PictureDao pictureDao;

    @Override
    public void init() throws ServletException {
        productDao = (ProductDao) super.getServletContext().getAttribute("productDao");
        if (productDao == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        cartDao = (CartDao) super.getServletContext().getAttribute("cartDao");
        if (cartDao == null) {
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
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            Cart cart = null;
            if (user != null) 
                cart = cartDao.getByUser(user);
            else
                cart = (Cart) session.getAttribute("cart");

            if (cart == null) {
                if (user != null) {
                    cart = cartDao.getByUser(user);
                } else {
                    cart = new Cart();
                }
            }

            //request.setAttribute("cart", cart);
            request.setAttribute("pictureDao", pictureDao);
            request.setAttribute("productDao", productDao);
            session.setAttribute("cart", cart);
            RequestDispatcher reqDes = request.getRequestDispatcher("/cart.jsp");
            reqDes.forward(request, response);

        } catch (Exception ex) {
            Logger.getLogger(ProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher reqDes = null;
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            int pid = Integer.parseInt(request.getParameter("pid"));
            if (request.getParameter("delete") != null) {
                doDelete(request, response);
                return;
            }
            Product product = productDao.getProductById(pid);
            if (product != null) {
                Cart cart = (Cart) session.getAttribute("cart");
                boolean newCart = false;
                if (cart == null) {
                    cart = new Cart((User) request.getSession(false).getAttribute("user"));
                    newCart = true;
                }
                cart.addProduct(product);
                if (user != null) {
                    if (newCart) {
                        cartDao.insertDao(cart);
                    } else {
                        cartDao.updateDao(cart);
                    }
                }
                session.setAttribute("cart", cart);
            }
            reqDes = request.getRequestDispatcher("/cart.jsp?result=true");
        } catch (Exception ex) {
            reqDes = request.getRequestDispatcher("/cart.jsp?result=false");
        } finally {
            reqDes.forward(request, response);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher reqDes = null;
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            int pid = Integer.parseInt(request.getParameter("pid"));
            Product product = productDao.getProductById(pid);
            if (product != null) {
                Cart cart = (Cart) session.getAttribute("cart");
                if (cart == null) {
                    cart = new Cart((User) request.getSession(false).getAttribute("user"));
                }
                cart.removeProduct(product);

                if (user != null) {
                    cartDao.updateDao(cart);
                }
            }
            reqDes = request.getRequestDispatcher("/cart.jsp?result=true");
        } catch (Exception ex) {
            Log.write(ex.toString());
            reqDes = request.getRequestDispatcher("/cart.jsp?result=false");
        } finally {
            reqDes.forward(request, response);
        }
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
