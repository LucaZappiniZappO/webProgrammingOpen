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
public interface AnomaliesDao extends  DefaultDao,GetById{
    public LinkedList<Anomalies> getAnomaliesByPurchase(Purchase p)  throws  Exception ;
    public LinkedList<Anomalies> getBySeller(User u) throws Exception;
}
