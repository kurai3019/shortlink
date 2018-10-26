/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.controllers;

import com.shortlink.DAO.ShortUrlDaoimpl;
import com.shortlink.DAO.UserDAOimpl;
import com.shortlink.model.User;
import com.shortlink.model.shortlLink;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author dell
 */
@Controller
public class AdminController {

    @RequestMapping(value = "/getListshtLink")
    public @ResponseBody
    List<shortlLink> getlistshtLink() {
        return new ShortUrlDaoimpl().getListLink(-1);
    }

    @RequestMapping(value = "/deleteshtLink")
    public void deleteshtLink(@RequestParam(value = "link_ID") int deleteLink) {
        new ShortUrlDaoimpl().deleteLink(deleteLink);
    }

    @RequestMapping(value = "/insertshtLink")
    public void insertshtLink(
            @RequestParam(value = "link_Code") String link_Code,
            @RequestParam(value = "link_URL") String link_URL,
            @RequestParam(value = "create_Date") String create_Date,
            @RequestParam(value = "create_User") int create_User,
            @RequestParam(value = "status") boolean status,
            @RequestParam(value = "link_View") int link_View,
            @RequestParam(value = "link_Title") String link_Title,
            @RequestParam(value = "link_type") int link_type,
            HttpServletResponse response
    ) {
        new ShortUrlDaoimpl().insertLink(new shortlLink());

    }

    @RequestMapping(value = "/updateshtLink")
    public void updateshtLink(@RequestParam(value = "link_ID") int link_ID,
            @RequestParam(value = "link_Code") String link_Code,
            @RequestParam(value = "link_URL") String link_URL,
            @RequestParam(value = "create_Date") String create_Date,
            @RequestParam(value = "create_User") int create_User,
            @RequestParam(value = "status") boolean status,
            @RequestParam(value = "link_View") int link_View,
            @RequestParam(value = "link_Title") String link_Title,
            @RequestParam(value = "link_type") int link_type,
            HttpServletResponse response
    ) throws IOException {
        new ShortUrlDaoimpl().updateLink(new shortlLink(link_ID, link_Code, link_URL, create_Date, create_User, status, link_View, link_Title, link_type));
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println("oke " + link_ID);
    }

    @RequestMapping(value = "/admin/shtlink")
    public String adminshtlink() {
        return "/admin/MntShtLInk";
    }

    @RequestMapping(value = "/getlistUser")
    public @ResponseBody
    List<User> getlistUser() {
        List<User> list=new ArrayList<User>();
        list.add((User) new UserDAOimpl().getListUser(-1));
        list.add(new User(1234, "Hi", "Hi", "Hi", "Hi", 10, "Hi", true, "Hi"));
        list.add(new User(4321, "Hi", "Hi", "Hi", "Hi", 11, "Hi", true, "Hi"));
        list.add(new User(1324, "Hi", "Hi", "Hi", "Hi", 12, "Hi", true, "Hi"));
        list.add(new User(2413, "Hi", "Hi", "Hi", "Hi", 13, "Hi", true, "Hi"));
        return list;
    }

    @RequestMapping(value = "/deleteUser")
    public void deleteshtUser(@RequestParam(value = "user_id") int userId) {
        new UserDAOimpl().deleteUser(userId);
    }

    @RequestMapping(value = "/insertUser")
    public void insertUser(
            @RequestParam(value = "user_id") int User_id,
            @RequestParam(value = "user_Name") String User_Name,
            @RequestParam(value = "email") String Email,
            @RequestParam(value = "user_FullName") String User_FullName,
            @RequestParam(value = "user_PassWord") String User_PassWord,
            @RequestParam(value = "role_Id") int Role_Id,
            @RequestParam(value = "create_Date") String Create_Date,
            @RequestParam(value = "status") boolean Status,
            @RequestParam(value = "expiry_Date_Vip") String Expiry_Date_Vip
    ) {
        new UserDAOimpl().insertUser(new User(User_id, User_Name, Email, User_FullName, User_PassWord, Role_Id, Create_Date, Status, Expiry_Date_Vip));
    }

    @RequestMapping(value = "/updateUser")
    public void updateUser(
            @RequestParam(value = "user_id") int User_id,
            @RequestParam(value = "user_Name") String User_Name,
            @RequestParam(value = "email") String Email,
            @RequestParam(value = "user_FullName") String User_FullName,
            @RequestParam(value = "user_PassWord") String User_PassWord,
            @RequestParam(value = "role_Id") int Role_Id,
            @RequestParam(value = "create_Date") String Create_Date,
            @RequestParam(value = "status") boolean Status,
            @RequestParam(value = "expiry_Date_Vip") String Expiry_Date_Vip
    ) throws IOException {
        new UserDAOimpl().updateUser(new User(User_id, User_Name, Email, User_FullName, User_PassWord, Role_Id, Create_Date, Status, Expiry_Date_Vip));
//        response.setCharacterEncoding("UTF-8");
//        PrintWriter out = response.getWriter();
//        out.println("oke " + link_ID);
    }

    @RequestMapping(value = "/admin/user")
    public String adminuser() {
        return "/admin/MntUser";
    }

    @RequestMapping(value = "/admin/test")
    public String test(HttpServletResponse response) throws IOException {
        return "/admin/newjsp";
    }

}
