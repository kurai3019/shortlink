/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.controllers;

import com.shortlink.DAO.loginDAO;
import com.shortlink.common.GooglePojo;
import com.shortlink.common.GoogleUtils;
import com.shortlink.common.RestFB;
import com.shortlink.entities.Links;
import com.shortlink.entities.Users;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Administrator
 */
@Controller

public class LoginController {

    @Autowired
    private loginDAO loginDAO;

    @Autowired
    private GoogleUtils googleUtils;

    @Autowired
    private RestFB restFB;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String addLink(@RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpSession session,
            ModelMap map) {
        Users user = loginDAO.login(username, password);
        if (user != null) {
            if (user.getRoleId() == 3) {
                boolean a = loginDAO.checkVipEx(user.getUsername());
                if (a == true) {
                    loginDAO.changeEX(user.getUsername());
                    user.setRoleId(2);
                }
            }
            session.setAttribute("username", user.getUsername());
            session.setAttribute("role", user.getRoleId());
            session.setAttribute("userid", user.getUserId());
            session.setAttribute("fullname", user.getFullname());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("createdate", user.getStringDate());

            return "shortLink";
        } else {
            map.addAttribute("error", "Sai tài khoản hoặc mật khẫu");
            return "login";
        }

    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(
            HttpSession session,
            ModelMap map) {
        if ((session.getAttribute("username")) != null && (session.getAttribute("email") != null)) {
            return "shortLink";
        } else {
            return "login";

        }
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session, ModelMap map) {
        session.removeAttribute("username");
        session.removeAttribute("role");
        session.removeAttribute("userid");
        session.removeAttribute("email");
        session.removeAttribute("fullname");
        session.removeAttribute("createdate");

        map.addAttribute("error", "Logout Thành công");

        return "login";
    }

    @RequestMapping(value = "myprolife", method = RequestMethod.GET)
    public String myprolife(HttpSession session, ModelMap map) {
        if ((Integer) session.getAttribute("role") == 3) {
            boolean a = loginDAO.checkVipEx((String) session.getAttribute("username"));
            if (a == true) {
                loginDAO.changeEX((String) session.getAttribute("username"));
                session.setAttribute("role", 2);

            }
        }

        return "myProlife";
    }

    @RequestMapping(value = "gethistory", method = RequestMethod.GET)
    public String gethistory(HttpSession session, ModelMap map) {
        String userid = session.getAttribute("userid").toString();
        List<Links> list = loginDAO.linkHistory(userid);
        map.addAttribute("listHistory", list);

        if ((Integer) session.getAttribute("role") == 3) {
            boolean a = loginDAO.checkVipEx((String) session.getAttribute("username"));
            if (a == true) {
                loginDAO.changeEX((String) session.getAttribute("username"));
                session.setAttribute("role", 2);

            }
        }

        return "history";
    }

    @RequestMapping("/login-google")
    public String loginGoogle(
            HttpSession session,
            ModelMap map,
            HttpServletRequest request) throws ClientProtocolException, IOException {

        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            return "redirect:/login?message=google_error";
        }

        String accessToken = googleUtils.getToken(code);

        GooglePojo googlePojo = googleUtils.getUserInfo(accessToken);

        String email = googlePojo.getEmail();
        String userName = googlePojo.getName();
        String userFullName = googlePojo.getEmail();

        // check
        boolean a = loginDAO.checkLoginByGoogle(email);

        if (a == true) {
            Users user = loginDAO.loginByGoogle(email);

            if (user != null) {
                if (user.getRoleId() == 3) {
                    boolean a1 = loginDAO.checkVipEx(user.getUsername());
                    if (a1 == true) {
                        loginDAO.changeEX(user.getUsername());
                        user.setRoleId(2);
                    }
                }
                session.setAttribute("username", user.getUsername());
                session.setAttribute("role", user.getRoleId());
                session.setAttribute("userid", user.getUserId());
                session.setAttribute("fullname", user.getFullname());
                session.setAttribute("email", user.getEmail());
                session.setAttribute("createdate", user.getStringDate());

                return "shortLink";
            } else {
                map.addAttribute("error", "Sai tài khoản hoặc mật khẫu");
                return "login";
            }

        } else {
            loginDAO.insertLoginByGoogle(email, userName, userFullName);
        }

        return "shortLink";
    }

    @RequestMapping("/register")
    public String register(HttpSession session, ModelMap map) {
        return "dangki";
    }
    
 
    @RequestMapping(value = "/registerEvent", method = RequestMethod.POST)
    public String registerEvent(
            HttpSession session,
            ModelMap map,
            @RequestParam("userNameRegister") String userNameRegister,
            @RequestParam("userPassWordRegister") String userPassWordRegister,
            @RequestParam("userFullNameRegister") String userFullNameRegister,
            @RequestParam("emailRegister") String emailRegister
    ) {

        String a = userNameRegister;
        String b = userPassWordRegister;
        String c = userFullNameRegister;
        String d = emailRegister;
        
        loginDAO.insertRegisterByMaual(a,b,c,d);
        
        
      
             return "dangki";
    }

//    @RequestMapping("/login-facebook")
//    public String loginFacebook(HttpServletRequest request) {
//        String code = request.getParameter("code");
//        String accessToken = "";
//        try {
//            accessToken = restFB.getToken(code);
//        } catch (IOException e) {
//            return "login?facebook=error";
//        }
//        com.restfb.types.User user = restFB.getUserInfo(accessToken);
//        
//        return "redirect:/user";
//    }
}
