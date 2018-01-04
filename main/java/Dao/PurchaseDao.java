/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Dao.entities.*;
import java.util.LinkedList;



/**
 *
 * @author Alvise
 */
public interface PurchaseDao extends  DefaultDao,GetById{
    public Purchase getPurchaseById(int id) throws Exception;
    public Purchase getPurchaseByIdAndUser(int id,User user) throws Exception;
    public LinkedList<Purchase> getPurchaseByUser(User user) throws Exception;
}
