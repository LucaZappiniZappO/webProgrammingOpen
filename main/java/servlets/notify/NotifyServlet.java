/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.notify;

import Dao.AnomaliesDao;
import Dao.ReviewDao;
import Dao.ShopDao;
import Dao.UserDao;
import Dao.entities.Anomalies;
import Dao.entities.Review;
import Dao.entities.User;
import java.io.IOException;
import java.util.Enumeration;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author zappi
 */
public class NotifyServlet extends HttpServlet {

    private AnomaliesDao anomaliesDao;
    private UserDao userDao;
    private ReviewDao reviewDao;
    private ShopDao shopDao;
    private static LinkedList<Review> reviews;
    private static LinkedList<Anomalies> anomalie;

    @Override
    public void init() throws ServletException {
        anomaliesDao = (AnomaliesDao) super.getServletContext().getAttribute("anomaliesDao");
        if (anomaliesDao == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        userDao = (UserDao) super.getServletContext().getAttribute("userDao");
        if (userDao == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        reviewDao = (ReviewDao) super.getServletContext().getAttribute("reviewDao");
        if (reviewDao == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }

        shopDao = (ShopDao) super.getServletContext().getAttribute("shopDao");
        if (shopDao == null) {
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
        RequestDispatcher reqDes = null;
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        try {
            if (user != null) {
                if (user.getPrivileges().equals("seller") || user.getPrivileges().equals("admin")) {
                    anomalie = anomaliesDao.getBySeller(user);
                    reviews = reviewDao.getRecentReviewForShopForNotify(user);
                    request.setAttribute("user", user);
                    request.setAttribute("anomalie", anomalie);
                    request.setAttribute("reviews", reviews);
                    reqDes = request.getRequestDispatcher("/loggedUsers/notify.jsp");
                } else {
                    throw new SecurityException("user has no access to this resource");
                }

            } else {
                throw new SecurityException("user has no access to this resource");
            }
        } catch (Exception ex) {
            reqDes = request.getRequestDispatcher("/index");
        }
        reqDes.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher reqDes = null;
        try {
            String s = request.getServletContext().getContextPath();
            String action = request.getParameter("action");
            if (action == null) {
                Enumeration<String> names = request.getParameterNames();
                while (names.hasMoreElements()) {
                    String name = names.nextElement();

                    reviews.get(Integer.parseInt(name)).setStatus("read");
                    reviewDao.updateDao(reviews.get(Integer.parseInt(name)));
                    s += "/notify";
                    response.sendRedirect(s);

                }
            } else {
                int i = Integer.parseInt(request.getParameter("index"));
                Anomalies a = anomalie.get(i);
                a.setStatus("verified");
                User user = anomalie.get(i).getPurchase().getUser();
                if (action.contains("Reject")) {
                    request.setAttribute("u", user);
                    request.setAttribute("mode", "reject");
                    reqDes = request.getRequestDispatcher("/loggedUsers/email.jsp");
                    a.setSolution("Rejected");
                    anomaliesDao.updateDao(a);
                    reqDes.forward(request, response);
                } else if (action.contains("Resolve")) {
                    request.setAttribute("u", user);
                    request.setAttribute("mode", "refound");
                    a.setSolution("Refounded");
                    anomaliesDao.updateDao(a);
                    reqDes = request.getRequestDispatcher("/loggedUsers/email.jsp");
                    reqDes.forward(request, response);
                } else if (action.contains("Review")) {
                    s += "/addReview?id=" + (anomalie.get(i).getPurchase().getUser()).getId();
                    a.setSolution("Added a negative Review");
                    anomaliesDao.updateDao(a);
                    response.sendRedirect(s);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(NotifyServlet.class.getName()).log(Level.SEVERE, null, ex);
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
