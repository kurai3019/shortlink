/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import com.shortlink.entities.Links;
import com.shortlink.entities.Users;
import com.shortlink.entities.Vipcode;
import java.util.List;

/**
 *
 * @author Administrator
 */
public interface loginDAO {

    Users login(String username,String password);
    List<Links> linkHistory(String username);
    boolean checkVipEx(String username);
    boolean changeEX (String username);
    
    String insertLoginByGoogle(String email, String userName, String userFullName);
    boolean checkLoginByGoogle(String email);
    Users loginByGoogle(String email);
    String insertRegisterByMaual(String userNameRegister, String userPassWordRegister, String userFullNameRegister, String emailRegister);
    boolean checkRegisterByMaual(String userNameRegister, String userFullNameRegister,String emailRegister);
    
}
