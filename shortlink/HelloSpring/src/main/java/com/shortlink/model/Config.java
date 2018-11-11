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
public class Config {

    private int ID;
    private String Config_Name;
    private int Value;

    public Config() {
    }

    public Config(String Config_Name, int Value) {
        this.Config_Name = Config_Name;
        this.Value = Value;
    }

    public Config(int ID, String Config_Name, int Value) {
        this.ID = ID;
        this.Config_Name = Config_Name;
        this.Value = Value;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getConfig_Name() {
        return Config_Name;
    }

    public void setConfig_Name(String Config_Name) {
        this.Config_Name = Config_Name;
    }

    public int getValue() {
        return Value;
    }

    public void setValue(int Value) {
        this.Value = Value;
    }

}
