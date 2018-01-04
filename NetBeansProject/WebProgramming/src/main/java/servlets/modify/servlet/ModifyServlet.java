/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.modify.servlet;

import Dao.UserDao;
import Dao.entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import system.Log;

/**
 *
 * @author skat96
 */
@WebServlet(name = "ModifyServlet", urlPatterns = {"/ModifyServlet"})
public class ModifyServlet extends HttpServlet {

    private UserDao userDao;
    private User user;
    
    @Override
    public void init() throws ServletException {
        userDao= (UserDao) super.getServletContext().getAttribute("userDao");
        if (userDao == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        } 
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException     {
        RequestDispatcher RequestDispatcherObj = null;       
        RequestDispatcherObj = request.getRequestDispatcher("/loggedUsers/UserProfile.jsp");
        RequestDispatcherObj.forward(request, response);
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
        String lastName = request.getParameter("lastname");
        String firstName = request.getParameter("firstname");
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        if (lastName != "") {
            String contextPath = getServletContext().getContextPath();
            if (!contextPath.endsWith("/")) {
                contextPath += "/";
            }
            try{
                HttpSession session = request.getSession(false);
                user = (User)session.getAttribute("user");
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setEmail(email);
                user.setPassword(password);
                int res = userDao.updateDao(user);
                if(res == 0)
                    response.sendRedirect(response.encodeRedirectURL(contextPath + "/modify"+"?error=true"));
                else{
                    
                    request.getSession().setAttribute("authenticatedUser", user);
                    response.sendRedirect(response.encodeRedirectURL(contextPath + "index"));
                }
            }
            catch(Exception e){
                Log.write(e.toString());
            }
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
    }
}
