/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.model;

/**
 *
 * @author dell
 */
public class blackList {

    private int ID;
    private String URL;
    private int Create_User;
    private String Create_Date;
    private String Update_User;
    private String Update_Date;
    private int Status;

    public blackList() {
    }

    public blackList(String URL, int Create_User, String Create_Date, String Update_User, String Update_Date, int Status) {
        this.URL = URL;
        this.Create_User = Create_User;
        this.Create_Date = Create_Date;
        this.Update_User = Update_User;
        this.Update_Date = Update_Date;
        this.Status = Status;
    }

    public blackList(int ID, String URL, int Create_User, String Create_Date, String Update_User, String Update_Date, int Status) {
        this.ID = ID;
        this.URL = URL;
        this.Create_User = Create_User;
        this.Create_Date = Create_Date;
        this.Update_User = Update_User;
        this.Update_Date = Update_Date;
        this.Status = Status;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getURL() {
        return URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }

    public int getCreate_User() {
        return Create_User;
    }

    public void setCreate_User(int Create_User) {
        this.Create_User = Create_User;
    }

    public String getCreate_Date() {
        return Create_Date;
    }

    public void setCreate_Date(String Create_Date) {
        this.Create_Date = Create_Date;
    }

    public String getUpdate_User() {
        return Update_User;
    }

    public void setUpdate_User(String Update_User) {
        this.Update_User = Update_User;
    }

    public String getUpdate_Date() {
        return Update_Date;
    }

    public void setUpdate_Date(String Update_Date) {
        this.Update_Date = Update_Date;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

}
