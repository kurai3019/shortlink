/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import com.shortlink.model.blackList;
import java.util.List;

/**
 *
 * @author dell
 */
public interface BlackListDAO {

    List<blackList> getBlacklist(int bl);

    Boolean updateBl(blackList bl);

    Boolean deleteBl(int bl);

    Boolean insertBl(blackList bl);
}
