/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.controllers;

import com.shortlink.DAO.loginDAO;
import com.shortlink.entities.Users;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Administrator
 */
@Controller

public class LoginController {

    @Autowired
    loginDAO loginDAO;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String addLink(@RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpSession session,
            ModelMap map) {
        Users user = loginDAO.login(username, password);
        if (user != null) {
            session.setAttribute("username", user.getUserCode());
            session.setAttribute("role", user.getRoleId());
            session.setAttribute("userid", user.getUserId());

            return "shortLink";
        } else {
            map.addAttribute("error", "Sai tên tài khoản hoặc mật khẩu");
            return "shortLink";
        }

    }
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session, ModelMap map) {
		session.removeAttribute("username");
                session.removeAttribute("role");
		session.removeAttribute("userid");

                map.addAttribute("error", "Logout thành công");

		return "shortLink";
	}
}
