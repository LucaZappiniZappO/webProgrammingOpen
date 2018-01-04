/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Dao.entities.User;
import java.util.LinkedList;



/**
 *
 * @author Alvise
 */
public interface UserDao extends  DefaultDao, GetById{
    public User getUserById(int id) throws Exception;
    public User getUserByEmail(String email) throws Exception;
    public User getUserByEmailPassword(String email,String password) throws Exception;
    public LinkedList<User> getAllUser() throws Exception;
}
