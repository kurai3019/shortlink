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
public class shortlLink {

    private int Link_ID;
    private String Link_Code;
    private String Link_URL;
    private String Create_Date;
    private int Create_User;
    private boolean Status;
    private int Link_View;
    private String Link_Title;
    private int Link_type;

    public shortlLink() {
    }

    public String getLink_Code() {
        return Link_Code;
    }

    public shortlLink(int Link_ID, String Link_Code, String Link_URL, String Create_Date, int Create_User, boolean Status, int Link_View, String Link_Title, int Link_type) {
        this.Link_ID = Link_ID;
        this.Link_Code = Link_Code;
        this.Link_URL = Link_URL;
        this.Create_Date = Create_Date;
        this.Create_User = Create_User;
        this.Status = Status;
        this.Link_View = Link_View;
        this.Link_Title = Link_Title;
        this.Link_type = Link_type;
    }



    public void setLink_Code(String Link_Code) {
        this.Link_Code = Link_Code;
    }

    public int getLink_ID() {
        return Link_ID;
    }

    public void setLink_ID(int Link_ID) {
        this.Link_ID = Link_ID;
    }

    public String getLink_URL() {
        return Link_URL;
    }

    public void setLink_URL(String Link_URL) {
        this.Link_URL = Link_URL;
    }

    public String getCreate_Date() {
        return Create_Date;
    }

    public void setCreate_Date(String Create_Date) {
        this.Create_Date = Create_Date;
    }

    public int getCreate_User() {
        return Create_User;
    }

    public void setCreate_User(int Create_User) {
        this.Create_User = Create_User;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    public int getLink_View() {
        return Link_View;
    }

    public void setLink_View(int Link_View) {
        this.Link_View = Link_View;
    }

    public String getLink_Title() {
        return Link_Title;
    }

    public void setLink_Title(String Link_Title) {
        this.Link_Title = Link_Title;
    }

    public int getLink_type() {
        return Link_type;
    }

    public void setLink_type(int Link_type) {
        this.Link_type = Link_type;
    }



}
