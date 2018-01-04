/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.mailSender;

import Dao.UserDao;
import Dao.entities.User;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlets.recover.recoverPassword;
import system.EMailSender;

/**
 *
 * @author zappi
 */
public class TextMailSenderServlet extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() throws ServletException {
        userDao = (UserDao) super.getServletContext().getAttribute("userDao");
        if (userDao == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
    }

    private EMailSender sender = new EMailSender();

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
        User user = null;
        try {
            user = userDao.getUserByEmail((String) request.getParameter("email"));
        } catch (Exception ex) {
            user = null;
        }
        if (user != null) {
            try {
                sender.sendCustomMessage(user.getEmail(), request.getParameter("object"), request.getParameter("message"));
            } catch (MessagingException ex) {
                reqDes = request.getRequestDispatcher("loggedUsers/notify.jsp?result=false");
                Logger.getLogger(recoverPassword.class.getName()).log(Level.SEVERE, null, ex);
            }
            reqDes = request.getRequestDispatcher("loggedUsers/notify.jsp?result=true");

        } else {
            reqDes = request.getRequestDispatcher("loggedUsers/notify.jsp?result=false");
        }

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
