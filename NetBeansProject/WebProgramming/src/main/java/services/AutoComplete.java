/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import Dao.ProductDao;
import Dao.entities.Product;
import Dao.jdbc.JdbcProductDao;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.QueryParam;

/**
 * REST Web Service
 *
 * @author Alvise
 */
@Path("complete")
public class AutoComplete {

    @Context
    private UriInfo context;
    private ProductDao productDao;
    /**
     * Creates a new instance of GenericResource
     */
    public AutoComplete() {
        productDao=new JdbcProductDao();
    }

    
    /**
     *
     * @param name
     * @return
     * @throws Exception
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getJson(@QueryParam("name") String name) throws Exception{
        LinkedList<Product> ll=productDao.getCompleteName(name);
        Gson gson = new Gson();
        List<String> res=new ArrayList<String>();
        ll.forEach((product)->{
            res.add(product.getName());
        });
        return gson.toJson(res);
    }
    
}
