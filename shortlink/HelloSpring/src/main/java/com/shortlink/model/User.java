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
public class User {

    private int User_id;
    private String User_Name;
    private String Email;
    private String User_FullName;
    private String User_PassWord;
    private int Role_Id;
    private String Create_Date;
    private boolean Status;
    private String Expiry_Date_Vip;

    public User() {
    }

    public User(String User_Name, String Email, String User_FullName, String User_PassWord, String Create_Date, boolean Status, String Expiry_Date_Vip) {
        this.User_Name = User_Name;
        this.Email = Email;
        this.User_FullName = User_FullName;
        this.User_PassWord = User_PassWord;
        this.Create_Date = Create_Date;
        this.Status = Status;
        this.Expiry_Date_Vip = Expiry_Date_Vip;
    }

    public User(int User_id, String User_Name, String Email, String User_FullName, String User_PassWord, int Role_Id, String Create_Date, boolean Status, String Expiry_Date_Vip) {
        this.User_id = User_id;
        this.User_Name = User_Name;
        this.Email = Email;
        this.User_FullName = User_FullName;
        this.User_PassWord = User_PassWord;
        this.Role_Id = Role_Id;
        this.Create_Date = Create_Date;
        this.Status = Status;
        this.Expiry_Date_Vip = Expiry_Date_Vip;
    }

    public int getUser_id() {
        return User_id;
    }

    public void setUser_id(int User_id) {
        this.User_id = User_id;
    }

    public String getUser_Name() {
        return User_Name;
    }

    public void setUser_Name(String User_Name) {
        this.User_Name = User_Name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getUser_FullName() {
        return User_FullName;
    }

    public void setUser_FullName(String User_FullName) {
        this.User_FullName = User_FullName;
    }

    public String getUser_PassWord() {
        return User_PassWord;
    }

    public void setUser_PassWord(String User_PassWord) {
        this.User_PassWord = User_PassWord;
    }

    public int getRole_Id() {
        return Role_Id;
    }

    public void setRole_Id(int Role_Id) {
        this.Role_Id = Role_Id;
    }

    public String getCreate_Date() {
        return Create_Date;
    }

    public void setCreate_Date(String Create_Date) {
        this.Create_Date = Create_Date;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    public String getExpiry_Date_Vip() {
        return Expiry_Date_Vip;
    }

    public void setExpiry_Date_Vip(String Expiry_Date_Vip) {
        this.Expiry_Date_Vip = Expiry_Date_Vip;
    }

}//end class
