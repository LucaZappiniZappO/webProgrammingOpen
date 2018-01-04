package servlets.register;

import Dao.UserDao;
import Dao.entities.User;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import system.Log;
import system.EMailSender;

public class RegisterServlet extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        if (session.getAttribute("user") == null) {
            RequestDispatcher reqDes = request.getRequestDispatcher("/publicUsers/register.jsp");
            reqDes.forward(request, response);
        } else {
            response.sendRedirect("/index");
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
        String lastName = request.getParameter("lastname");
        String firstName = request.getParameter("firstname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        try {
            if (lastName.length() > 0) {
                String contextPath = getServletPath(request);
                User user = new User(firstName, lastName, email, password, "NO", "client");
                int res = userDao.insertDao(user);
                if (res == 0) {
                    reqDes = request.getRequestDispatcher("/publicUsers/register.jsp?result=false");
                } else {
                    user = userDao.getUserByEmail(email);
                    sender.sendLinkConfirm(user.getId(), contextPath, email);
                    reqDes = request.getRequestDispatcher("/publicUsers/confirmRegistration.jsp");
                }
            }
        } catch (Exception e) {
            reqDes = request.getRequestDispatcher("/publicUsers/register.jsp?result=false");
        } finally {
            reqDes.forward(request, response);
        }

    }
    
    private String getServletPath(HttpServletRequest request) throws MalformedURLException{
        URL aUrl=new URL(request.getRequestURL().toString());
        String contextPath = request.getServletContext().getContextPath();
        contextPath=aUrl.getProtocol()+"://"+aUrl.getHost()+":"+aUrl.getPort()+contextPath;
        return contextPath;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
