/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;


/**
 * Common operation to all entities 
 * @author Alvise
 */
public interface DefaultDao {
    public int insertDao(Object o) throws Exception;
    public int updateDao(IdOwner o) throws Exception;
    public int deleteDao(Object o) throws Exception;
}
