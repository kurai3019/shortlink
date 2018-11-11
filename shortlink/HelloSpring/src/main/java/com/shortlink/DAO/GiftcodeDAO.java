/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import com.shortlink.model.Giftcode;
import java.util.List;

/**
 *
 * @author dell
 */
public interface GiftcodeDAO {

    List<Giftcode> getgiftcode();

    Boolean updategiftcode(Giftcode giftcode);

    Boolean deletegiftcode(int giftcode);

    Boolean insertgiftcode(Giftcode giftcode);
}
