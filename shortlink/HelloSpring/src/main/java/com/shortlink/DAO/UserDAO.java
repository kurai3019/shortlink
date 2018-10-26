/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import com.shortlink.model.User;
import java.util.List;

/**
 *
 * @author dell
 */
public interface UserDAO {
    List<User> getListUser(int id);
    Boolean updateUser(User user);
    Boolean deleteUser(int id);
    Boolean insertUser(User user);
}
