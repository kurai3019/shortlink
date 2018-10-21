/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import com.shortlink.entities.Links;
import com.shortlink.entities.Users;
import java.util.List;

/**
 *
 * @author Administrator
 */
public interface loginDAO {

    Users login(String username,String password);
    List<Links> linkHistory(String username);
}
