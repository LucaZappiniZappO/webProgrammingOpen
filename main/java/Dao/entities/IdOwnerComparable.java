/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao.entities;

import Dao.IdOwner;

/**
 *
 * @author Alvise
 */
public class IdOwnerComparable implements IdOwner{
    protected int id;
    
    
    
     /**
     *
     * @param i
     * @return
     */
    @Override
    public boolean equals(Object i){
        if(i instanceof IdOwner)
            return ((IdOwner)i).getId()==this.getId();
        return false;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
