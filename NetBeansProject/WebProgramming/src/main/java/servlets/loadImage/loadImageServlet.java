/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.loadImage;

import Dao.PictureDao;
import Dao.ShopDao;
import Dao.entities.Picture;
import Dao.entities.Shop;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Enumeration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import system.Log;

/**
 *
 * @author zappi
 */
@MultipartConfig(location = "/img", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class loadImageServlet extends HttpServlet {

    private static final String SAVE_DIR = "assets/img/upload/";
    private int maxFileSize = 50 * 1024;
    private int maxMemSize = 4 * 1024;
    private ShopDao shopDao;
    private PictureDao pictureDao;

    @Override
    public void init() throws ServletException {

        shopDao = (ShopDao) super.getServletContext().getAttribute("shopDao");
        if (shopDao == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        pictureDao = (PictureDao) super.getServletContext().getAttribute("pictureDao");
        if (pictureDao == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
    }

    private boolean checkFolder(ServletContext context) {
        String path = context.getRealPath(SAVE_DIR);
        if (path == null) {
            File theDir = new File(context.getRealPath("") + SAVE_DIR);
            if (!theDir.exists()) 
                return theDir.mkdir();
            else 
                return false;
            
        } else 
            return true;
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        try {
            ServletContext context = getServletContext();
            checkFolder(context);

            MultipartRequest multi = new MultipartRequest(request, context.getRealPath(SAVE_DIR), 10 * 1024 * 1024, "ISO-8859-1", new DefaultFileRenamePolicy());
            Enumeration params = multi.getParameterNames();
            int id = 0;
            while (params.hasMoreElements()) {
                String name = (String) params.nextElement();
                String value = multi.getParameter(name);
                if (name.equals("id")) {
                    id = Integer.parseInt(value);
                }
            }

            Enumeration files = multi.getFileNames();
            Path path = null;
            while (files.hasMoreElements()) {
                String name = (String) files.nextElement();
                String filename = multi.getFilesystemName(name);
                String originalFilename = multi.getOriginalFileName(name);
                String type = multi.getContentType(name);
                File f = multi.getFile(name);
                path = Paths.get(String.valueOf(f));
            }
            Shop shop = (Shop) shopDao.getById(id);
            Picture pic = pictureDao.getPictureShop(shop);
            String dbPath = path.getFileName().toString();
            pic.setPath(SAVE_DIR + dbPath);
            pictureDao.updateDao(pic);
        } catch (Exception e) {
            Log.write(e.toString());
        }
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {

        throw new ServletException("GET method used with "
                + getClass().getName() + ": POST method required.");
    }
}
