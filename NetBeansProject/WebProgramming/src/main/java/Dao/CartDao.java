/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Dao.entities.*;



/**
 *
 * @author Alvise
 */
public interface CartDao extends  DefaultDao,GetById{
    public Cart getByUser(User user) throws Exception;

}
