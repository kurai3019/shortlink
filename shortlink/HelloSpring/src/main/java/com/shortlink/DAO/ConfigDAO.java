/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import com.shortlink.model.Config;
import com.shortlink.model.shortlLink;
import java.util.List;

/**
 *
 * @author dell
 */
public interface ConfigDAO {

    List<Config> getconfig();

    Boolean updateconfig(Config config);

    Boolean deleteconfig(int config);
    
    Boolean insertLink(Config config);
}
