/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import com.shortlink.entities.Users;
import com.shortlink.entities.Vipcode;

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
    int thongkeuserlink(int userid);
    int thongkeuserview(int userid);
    String xephang(int userid);
    Vipcode addvipcode(String code);
    String updatedatevipusertoday(int userid,int date);
    String updatestatuscode(int codeid);
    String updatedatevipuser(int date,int userid);
    String updatedateviplinkcustom(int date,int userid) ;
    String updatedateviplinkcustomtoday(int date,int userid) ;
    Users update(int userida);
    
}
