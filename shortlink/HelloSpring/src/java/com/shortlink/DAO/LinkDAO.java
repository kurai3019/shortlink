/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

/**
 *
 * @author Administrator
 */
public interface LinkDAO {
    String getLink(String url,String randomkey,String user);
    String loadURL(String URLa);
    String AddView(String URLa);
    Boolean checkRandomKey(String RandomKey);
    Boolean checkBackList(String urlCut);

    
}
