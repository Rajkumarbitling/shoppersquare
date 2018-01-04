/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.includehelp;

import java.util.Date;
import java.math.BigDecimal;

/**
 *
 * @author Rajkumar
 */
public class UserPOJO {

    private Integer id;
    private String name;
    private BigDecimal price;
    private String description;
    private Integer category_id;
    private Date last_update;

    public Integer getid() {
        return id;
    }

    public void setid(Integer id) {
        this.id = id;
    }

    public String getname() {
        return name;
    }

    public void setname(String name) {
        this.name = name;
    }

    public BigDecimal getprice() {
        return price;
    }

    public void setprice(BigDecimal price) {
        this.price = price;
    }

    public String getdescription() {
        return description;
    }

    public void setdescription(String description) {
        this.description = description;
    }

    public Integer getcategory_id() {
        return category_id;
    }

    public void setcategory_id(Integer category_id) {
        this.category_id = category_id;
    }

    public Date getlast_update() {
        return last_update;
    }

    public void setlast_update(Date last_update) {
        this.last_update = last_update;
    }

}
