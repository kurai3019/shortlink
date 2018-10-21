/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import com.shortlink.model.shortlLink;
import java.util.List;

/**
 *
 * @author dell
 */
public interface ShortUrlDao {
    
    List<shortlLink> getListLink(int search);
    Boolean updateLink(shortlLink sl);
    Boolean deleteLink(int Link_ID);
    Boolean insertLink(shortlLink sl);
    
}
