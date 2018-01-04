/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.register;

import Dao.UserDao;
import Dao.entities.User;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlets.resetpass.resetPasswordServlet;
import system.Encrypt;

/**
 *
 * @author zappi
 */
public class ComfirmRegisterServlet extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() throws ServletException {
        userDao = (UserDao) super.getServletContext().getAttribute("userDao");
        if (userDao == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String contextPath = getServletContext().getContextPath();
        User user = null;
        try {
            String token = URLDecoder.decode(request.getParameter("token"), "ISO-8859-1");
            user = userDao.getUserById(new Encrypt().decode(token));
        } catch (Exception ex) {
            Logger.getLogger(resetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (user != null) {

            user.setConfirm("SI");
            try {
                userDao.updateDao(user);
                request.getSession().setAttribute("user", user);
            } catch (Exception ex) {
                Logger.getLogger(ComfirmRegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect(response.encodeRedirectURL(contextPath + "/index"));
        }
        response.sendRedirect(response.encodeRedirectURL(contextPath + "/error.jsp"));

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
        processRequest(request, response);
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
