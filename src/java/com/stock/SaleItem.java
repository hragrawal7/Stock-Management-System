package com.stock;

import java.io.Serializable;

public class SaleItem implements Serializable{
    String p_id;
    int p_quantity;

    public String getP_id() {
        return p_id;
    }

    public void setP_id(String p_id) {
        this.p_id = p_id;
    }

    public int getP_quantity() {
        return p_quantity;
    }

    public void setP_quantity(int p_quantity) {
        this.p_quantity = p_quantity;
    }
    
    
}
