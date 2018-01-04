package servlets.recover;

import Dao.UserDao;
import Dao.entities.User;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import system.EMailSender;

/**
 *
 * @author zappi
 */
@WebServlet(name = "recover", urlPatterns = {"/recover"})
public class recoverPassword extends HttpServlet {

    private UserDao userDao;
    private EMailSender sender;

    @Override
    public void init() throws ServletException {
        sender = new EMailSender();
        userDao = (UserDao) super.getServletContext().getAttribute("userDao");
        if (userDao == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher reqDes = null;
        
        reqDes = request.getRequestDispatcher("/publicUsers/recover.jsp");
        
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
        User user = null;
        try {
            user = userDao.getUserByEmail((String) request.getParameter("email"));
        } catch (Exception ex) {
            user = null;
        }
        if (user != null) {
            String link = request.getRequestURL().toString();
            link = link.substring(0, 36);
            try {
                sender.sendRecoverLink(user.getId(), link, user.getEmail());
            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(recoverPassword.class.getName()).log(Level.SEVERE, null, ex);
            } catch (MessagingException ex) {
                Logger.getLogger(recoverPassword.class.getName()).log(Level.SEVERE, null, ex);
            }
            reqDes = request.getRequestDispatcher("/success.jsp");

        } else {
            reqDes = request.getRequestDispatcher("/error.jsp");
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
