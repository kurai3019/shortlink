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
public class Giftcode {

    private int ID;
    private String Gift_Code;
    private String Gift_Name;
    private boolean Gift_Status;
    private int Gift_Date_Vip;

    public Giftcode() {
    }

    public Giftcode(int ID, String Gift_Code, String Gift_Name, boolean Gift_Status, int Gift_Date_Vip) {
        this.ID = ID;
        this.Gift_Code = Gift_Code;
        this.Gift_Name = Gift_Name;
        this.Gift_Status = Gift_Status;
        this.Gift_Date_Vip = Gift_Date_Vip;
    }

    public Giftcode(String Gift_Code, String Gift_Name, boolean Gift_Status, int Gift_Date_Vip) {
        this.Gift_Code = Gift_Code;
        this.Gift_Name = Gift_Name;
        this.Gift_Status = Gift_Status;
        this.Gift_Date_Vip = Gift_Date_Vip;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getGift_Code() {
        return Gift_Code;
    }

    public void setGift_Code(String Gift_Code) {
        this.Gift_Code = Gift_Code;
    }

    public String getGift_Name() {
        return Gift_Name;
    }

    public void setGift_Name(String Gift_Name) {
        this.Gift_Name = Gift_Name;
    }

    public boolean isGift_Status() {
        return Gift_Status;
    }

    public void setGift_Status(boolean Gift_Status) {
        this.Gift_Status = Gift_Status;
    }

    public int getGift_Date_Vip() {
        return Gift_Date_Vip;
    }

    public void setGift_Date_Vip(int Gift_Date_Vip) {
        this.Gift_Date_Vip = Gift_Date_Vip;
    }

}
