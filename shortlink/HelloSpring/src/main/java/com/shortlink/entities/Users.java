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
public class Users {
    Integer userId;
    String username;
    String email;
    String fullname;
    String password;
    Integer roleId;
    Date createDate;
    String stringDate;
    String stringDatevip;
    Boolean status;
    String ForgotRandom_Key;
    Date ForgotRandom_Date;

       public Users(Integer userid,String username, String fullname,String mail,int role,String stringDate,String stringDatevip) {
        this.userId = userid;
        this.username = username;
        this.fullname = fullname;
        this.email = mail;
        this.roleId = role;
        this.stringDate = stringDate;
        this.stringDatevip = stringDatevip;
    }

    public String getStringDatevip() {
        return stringDatevip;
    }

    public void setStringDatevip(String stringDatevip) {
        this.stringDatevip = stringDatevip;
    }
       
    
    public String getStringDate() {
        return stringDate;
    }

    public void setStringDate(String stringDate) {
        this.stringDate = stringDate;
    }
       
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public Users(Integer userId, String username, String email, String fullname, String password, Integer roleId, Date createDate, String stringDate, String stringDatevip, Boolean status, String ForgotRandom_Key, Date ForgotRandom_Date) {
        this.userId = userId;
        this.username = username;
        this.email = email;
        this.fullname = fullname;
        this.password = password;
        this.roleId = roleId;
        this.createDate = createDate;
        this.stringDate = stringDate;
        this.stringDatevip = stringDatevip;
        this.status = status;
        this.ForgotRandom_Key = ForgotRandom_Key;
        this.ForgotRandom_Date = ForgotRandom_Date;
    }

    public Users(Integer userId, String username, String email, String fullname, Integer roleId, String stringDate, String stringDatevip, String ForgotRandom_Key, Date ForgotRandom_Date) {
        this.userId = userId;
        this.username = username;
        this.email = email;
        this.fullname = fullname;
        this.roleId = roleId;
        this.stringDate = stringDate;
        this.stringDatevip = stringDatevip;
        this.ForgotRandom_Key = ForgotRandom_Key;
        this.ForgotRandom_Date = ForgotRandom_Date;
    }
    
   


    
public Users(String username, String email, String fullname, Integer roleId, Boolean status, String ForgotRandom_Key, Date ForgotRandom_Date) {
        this.username = username;
        this.email = email;
        this.fullname = fullname;
        this.roleId = roleId;
        this.status = status;
        this.ForgotRandom_Key = ForgotRandom_Key;
        this.ForgotRandom_Date = ForgotRandom_Date;
    }

    public Users(String username, String email, String fullname, String ForgotRandom_Key, Date ForgotRandom_Date) {
        this.username = username;
        this.email = email;
        this.fullname = fullname;
        this.ForgotRandom_Key = ForgotRandom_Key;
        this.ForgotRandom_Date = ForgotRandom_Date;
    }

    public Users(String username, String email, String fullname, Boolean status, String ForgotRandom_Key, Date ForgotRandom_Date) {
        this.username = username;
        this.email = email;
        this.fullname = fullname;
        this.status = status;
        this.ForgotRandom_Key = ForgotRandom_Key;
        this.ForgotRandom_Date = ForgotRandom_Date;
    }

    public Users(String username, String email, String ForgotRandom_Key, Date ForgotRandom_Date) {
        this.username = username;
        this.email = email;
        this.ForgotRandom_Key = ForgotRandom_Key;
        this.ForgotRandom_Date = ForgotRandom_Date;
    }
    
    

    public String getForgotRandom_Key() {
        return ForgotRandom_Key;
    }

    public void setForgotRandom_Key(String ForgotRandom_Key) {
        this.ForgotRandom_Key = ForgotRandom_Key;
    }

    public Date getForgotRandom_Date() {
        return ForgotRandom_Date;
    }

    public void setForgotRandom_Date(Date ForgotRandom_Date) {
        this.ForgotRandom_Date = ForgotRandom_Date;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
    
    
}
