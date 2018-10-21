/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.controllers;

import com.shortlink.DAO.ShortUrlDaoimpl;
import com.shortlink.model.shortlLink;

/**
 *
 * @author dell
 */
public class NewClass {

    public static void main(String[] args) {

        ShortUrlDaoimpl a = new ShortUrlDaoimpl();
        shortlLink a1 = new shortlLink(1122, "", "", "", 7, true, 0, "", 3);
        boolean a2 = a.updateLink(a1);
        System.out.println("");
        System.out.println(a2);
        
    }

}
