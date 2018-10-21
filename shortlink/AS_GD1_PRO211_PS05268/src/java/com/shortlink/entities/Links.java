/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.entities;

import java.sql.Date;

/**
 *
 * @author Administrator
 */
public class Links {
    String code;
    String url;
    Date date;
    String datestring;
    String createuser;
    Integer view;
    public Links(){}

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDatestring() {
        return datestring;
    }

    public void setDatestring(String datestring) {
        this.datestring = datestring;
    }

    public String getCreateuser() {
        return createuser;
    }

    public void setCreateuser(String createuser) {
        this.createuser = createuser;
    }

    public Integer getView() {
        return view;
    }

    public void setView(Integer view) {
        this.view = view;
    }
  
       public Links(String code, String url, String datestring,int view) {
        this.code = code;
        this.url = url;
        this.datestring = datestring;
        this.view = view;

    }
       

    
    
}
