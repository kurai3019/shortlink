/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.controllers;

import com.shortlink.DAO.ShortUrlDaoimpl;
import com.shortlink.model.shortlLink;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author dell
 */
@Controller
public class VipLinkController {

    @RequestMapping(value = "/vip/custompage")
    public String Custompage(ModelMap model,HttpSession session) {
      if ((Integer) session.getAttribute("role") != 3) {
          return "505";
        }
        return "/VIP/Custompage";
    }

    @RequestMapping(value = "/vip/change")
    public String changeVIP(
            @RequestParam(value = "txtid") int txtid,
            @RequestParam(value = "txtslink", required = false) String txtslink,
            @RequestParam(value = "txturl", required = false) String txturl,
            ModelMap model
    ) {
        model.addAttribute("result", new ShortUrlDaoimpl().changeLinkVip(new shortlLink(txtid, txtslink, txturl)));
        return "/VIP/Custompage";
    }

    @RequestMapping(value = "/vip/create")
    public String createVIP(
            @RequestParam(value = "txtuserid", required = false) int txtuserid,
            @RequestParam(value = "txtslink", required = false) String txtslink,
            @RequestParam(value = "txturl", required = false) String txturl,
            ModelMap model
    ) {
        model.addAttribute("result", new ShortUrlDaoimpl().createLinkVip(new shortlLink(txtslink, txturl, txtuserid)));
        return "/VIP/Custompage";
    }

}
