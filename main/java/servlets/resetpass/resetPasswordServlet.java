/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.resetpass;

import Dao.UserDao;
import Dao.entities.User;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.logging.Level;
import java.util.Base64;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import system.Encrypt;

/**
 *
 * @author zappi
 */
public class resetPasswordServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private UserDao userDao;
    private Encrypt encrypter;

    @Override
    public void init() throws ServletException {
        userDao = (UserDao) super.getServletContext().getAttribute("userDao");
        if (userDao == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = null;
        try {
            String token = URLDecoder.decode(request.getParameter("token"), "ISO-8859-1");
            user = userDao.getUserById(new Encrypt().decode(token));
        } catch (Exception ex) {
            Logger.getLogger(resetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (user != null) {
            request.setAttribute("userId", user.getId());
            RequestDispatcher reqDes = request.getRequestDispatcher("publicUsers/resetpassword.jsp");
            reqDes.forward(request, response);
        } else {
            RequestDispatcher reqDes = request.getRequestDispatcher("/error.jsp");
            reqDes.forward(request, response);
        }
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
            User user = null;

            user = userDao.getUserById(Integer.parseInt(request.getParameter("id")));

            if (user != null) {
                String password = request.getParameter("password");
                String conferma = request.getParameter("conferma");
                if (password.equals(conferma)) {
                    user.setPassword(password);
                    userDao.updateDao(user);
                    reqDes = request.getRequestDispatcher("/login?result=true");
                    reqDes.forward(request, response);
                } else {
                    reqDes = request.getRequestDispatcher("/index?result=false");
                    reqDes.forward(request, response);
                }
            } else {
                reqDes = request.getRequestDispatcher("/error.jsp");
                reqDes.forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(resetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
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
