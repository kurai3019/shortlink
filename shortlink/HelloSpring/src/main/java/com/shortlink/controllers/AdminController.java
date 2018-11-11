/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.controllers;

import com.shortlink.DAO.BlackListDAOimpl;
import com.shortlink.DAO.ConfigDAOimpl;
import com.shortlink.DAO.GiftcodeDAOimpl;
import com.shortlink.DAO.ShortUrlDaoimpl;
import com.shortlink.DAO.UserDAOimpl;
import com.shortlink.model.Config;
import com.shortlink.model.Giftcode;
import com.shortlink.model.blackList;
import com.shortlink.model.shortlLink;
import com.shortlink.model.userAdmin;
import java.io.IOException;
import java.io.PrintWriter;
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
    public void deleteshtLink(@RequestParam(value = "link_ID") int deleteLink,
            HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{\"result\":\"" + (new ShortUrlDaoimpl().deleteLink(deleteLink) ? "Done." : "Fail.") + "\"}");
    }
    
    @RequestMapping(value = "/insertshtLink")
    public void insertshtLink(
            @RequestParam(value = "link_Code", required = false) String link_Code,
            @RequestParam(value = "link_URL", required = false) String link_URL,
            @RequestParam(value = "create_Date", required = false) String create_Date,
            @RequestParam(value = "create_User", required = false) int create_User,
            @RequestParam(value = "expiry_Date", required = false) String expiry_Date,
            @RequestParam(value = "status", required = false) boolean status,
            @RequestParam(value = "link_View", required = false) int link_View,
            @RequestParam(value = "link_Title", required = false) String link_Title,
            @RequestParam(value = "link_type", required = false) int link_type,
            HttpServletResponse response
    ) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{\"result\":\""
                + (new ShortUrlDaoimpl().insertLink(new shortlLink(
                        link_Code,
                        link_URL,
                        create_Date,
                        create_User,
                        expiry_Date,
                        status,
                        link_View,
                        link_Title,
                        link_type)) ? "Done." : "Fail.") + "\"}");
    }
    
    @RequestMapping(value = "/updateshtLink")
    public void updateshtLink(@RequestParam(value = "link_ID") int link_ID,
            @RequestParam(value = "link_Code", required = false) String link_Code,
            @RequestParam(value = "link_URL", required = false) String link_URL,
            @RequestParam(value = "create_Date", required = false) String create_Date,
            @RequestParam(value = "create_User", required = false) int create_User,
            @RequestParam(value = "expiry_Date", required = false) String expiry_Date,
            @RequestParam(value = "status", required = false) boolean status,
            @RequestParam(value = "link_View", required = false) int link_View,
            @RequestParam(value = "link_Title", required = false) String link_Title,
            @RequestParam(value = "link_type", required = false) int link_type,
            HttpServletResponse response
    ) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{\"result\":\""
                + (new ShortUrlDaoimpl().updateLink(new shortlLink(
                        link_ID,
                        link_Code,
                        link_URL,
                        create_Date,
                        create_User,
                        expiry_Date,
                        status,
                        link_View,
                        link_Title,
                        link_type)) ? "Done." : "Fail.") + "\"}");
    }
    
    @RequestMapping(value = "/admin/shtlink")
    public String adminshtlink() {
        return "/admin/MntShtLInk";
    }
    
    @RequestMapping(value = "/getlistUser")
    public @ResponseBody
    List<userAdmin> getlistUser() {
        return new UserDAOimpl().getListUser(-1);
    }
    
    @RequestMapping(value = "/deleteUser")
    public void deleteshtUser(@RequestParam(value = "user_id") int userId,
            HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{\"result\":\"" + (new UserDAOimpl().deleteUser(userId) ? "Done." : "Fail.") + "\"}");
    }
    
    @RequestMapping(value = "/insertUser")
    public void insertUser(
            @RequestParam(value = "user_Name", required = false) String User_Name,
            @RequestParam(value = "email", required = false) String Email,
            @RequestParam(value = "user_FullName", required = false) String User_FullName,
            @RequestParam(value = "user_PassWord", required = false) String User_PassWord,
            @RequestParam(value = "role_Id", required = false) int Role_Id,
            @RequestParam(value = "create_Date", required = false) String Create_Date,
            @RequestParam(value = "status", required = false) boolean Status,
            @RequestParam(value = "expiry_Date_Vip", required = false) String Expiry_Date_Vip,
            HttpServletResponse response
    ) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{\"result\":\""
                + (new UserDAOimpl().insertUser(
                        new userAdmin(User_Name,
                                Email,
                                User_FullName,
                                User_PassWord,
                                Role_Id,
                                Create_Date,
                                Status,
                                Expiry_Date_Vip)) ? "Done" : "Fail") + "\"}");
    }
    
    @RequestMapping(value = "/updateUser")
    public void updateUser(
            @RequestParam(value = "user_id") int User_id,
            @RequestParam(value = "user_Name", required = false) String User_Name,
            @RequestParam(value = "email", required = false) String Email,
            @RequestParam(value = "user_FullName", required = false) String User_FullName,
            @RequestParam(value = "user_PassWord", required = false) String User_PassWord,
            @RequestParam(value = "role_Id", required = false) int Role_Id,
            @RequestParam(value = "create_Date", required = false) String Create_Date,
            @RequestParam(value = "status", required = false) boolean Status,
            @RequestParam(value = "expiry_Date_Vip", required = false) String Expiry_Date_Vip,
            HttpServletResponse response
    ) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{\"result\":\""
                + (new UserDAOimpl().updateUser(
                        new userAdmin(
                                User_id,
                                User_Name,
                                Email,
                                User_FullName,
                                User_PassWord,
                                Role_Id,
                                Create_Date,
                                Status,
                                Expiry_Date_Vip)) ? "Done" : "Fail") + "\"}");
    }
    
    @RequestMapping(value = "/admin/user")
    public String adminuser() {
        return "/admin/MntUser";
    }
    
    @RequestMapping(value = "/getlistBlist")
    public @ResponseBody
    List<blackList> getlistBlist() {
        return new BlackListDAOimpl().getBlacklist(-1);
    }
    
    @RequestMapping(value = "/deleteBlist")
    public void deleteBlist(@RequestParam(value = "id") int id,
            HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{\"result\":\"" + (new BlackListDAOimpl().deleteBl(id) ? "Done." : "Fail.") + "\"}");
    }
    
    @RequestMapping(value = "/insertBlist")
    public void insertBlist(
            @RequestParam(value = "url", required = false) String url,
            @RequestParam(value = "create_User", required = false) int create_User,
            @RequestParam(value = "create_Date", required = false) String create_Date,
            @RequestParam(value = "update_User", required = false) String update_User,
            @RequestParam(value = "update_Date", required = false) String update_Date,
            @RequestParam(value = "status", required = false) int status,
            HttpServletResponse response
    ) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{\"result\":\""
                + (new BlackListDAOimpl().insertBl(
                        new blackList(
                                url,
                                create_User,
                                create_Date,
                                update_User,
                                update_Date,
                                status)) ? "Done" : "Fail") + "\"}");
    }
    
    @RequestMapping(value = "/updateBlist")
    public void updateBlist(
            @RequestParam(value = "id") int User_id,
            @RequestParam(value = "url", required = false) String url,
            @RequestParam(value = "create_User", required = false) int create_User,
            @RequestParam(value = "create_Date", required = false) String create_Date,
            @RequestParam(value = "update_User", required = false) String update_User,
            @RequestParam(value = "update_Date", required = false) String update_Date,
            @RequestParam(value = "status", required = false) int status,
            HttpServletResponse response
    ) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{\"result\":\""
                + (new BlackListDAOimpl().updateBl(
                        new blackList(
                                User_id,
                                url,
                                create_User,
                                create_Date,
                                update_User,
                                update_Date,
                                status)) ? "Done" : "Fail") + "\"}");
    }
    
    @RequestMapping(value = "/admin/blacklist")
    public String adminBlklist() {
        return "/admin/MntBlacklist";
    }
    
    @RequestMapping(value = "/admin/test")
    public String test(HttpServletResponse response) throws IOException {
        return "/admin/newjsp";
    }
    
    @RequestMapping(value = "/admin/config")
    public String configPage(HttpServletResponse response) throws IOException {
        return "/admin/configPage";
    }
    
    @RequestMapping(value = "/getconfig")
    public @ResponseBody
    List<Config> getlistconfig() {
        return new ConfigDAOimpl().getconfig();
    }
    
    @RequestMapping(value = "/updateconfig")
    public void configUpdate(@RequestParam(value = "id") int id,
            @RequestParam(value = "config_Name", required = false) String config_Name,
            @RequestParam(value = "value", required = false) int value,
            HttpServletResponse response) throws IOException {
        
        PrintWriter out = response.getWriter();
        out.println("{\"result\":\"" + (new ConfigDAOimpl().updateconfig(new Config(id, config_Name, value)) ? "Done." : "Fail.") + "\"}");
    }
    
    @RequestMapping(value = "/deleteconfig")
    public void deleteConfig(@RequestParam(value = "id") int id,
            HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{\"result\":\"" + (new ConfigDAOimpl().deleteconfig(id) ? "Done." : "Fail.") + "\"}");
    }
    
    @RequestMapping(value = "/insertconfig")
    public void insertConfig(
            @RequestParam(value = "config_Name", required = false) String config_Name,
            @RequestParam(value = "value", required = false) int value,
            HttpServletResponse response
    ) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{\"result\":\""
                + (new ConfigDAOimpl().insertLink(new Config(config_Name, value)
                ) ? "Done" : "Fail") + "\"}");
    }
    
    @RequestMapping(value = "/admin/giftcode")
    public String giftcode(HttpServletResponse response) throws IOException {
        return "/admin/giftcodePage";
    }
    
    @RequestMapping(value = "/getgiftcode")
    public @ResponseBody
    List<Giftcode> getgiftcode() {
        return new GiftcodeDAOimpl().getgiftcode();
    }
    
    @RequestMapping(value = "/updategiftcode")
    public void updategiftcode(@RequestParam(value = "id") int id,
            @RequestParam(value = "gift_Code", required = false) String Gift_Code,
            @RequestParam(value = "gift_Name", required = false) String Gift_Name,
            @RequestParam(value = "gift_Status", required = false) boolean Gift_Status,
            @RequestParam(value = "gift_Date_Vip", required = false) int Gift_Date_Vip,
            HttpServletResponse response) throws IOException {
        
        PrintWriter out = response.getWriter();
        out.println("{\"result\":\"" + (new GiftcodeDAOimpl().updategiftcode(new Giftcode(id, Gift_Code, Gift_Name, Gift_Status, Gift_Date_Vip)) ? "Done." : "Fail.") + "\"}");
    }
    
    @RequestMapping(value = "/deletegiftcode")
    public void deletegiftcode(@RequestParam(value = "id") int id,
            HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{\"result\":\"" + (new GiftcodeDAOimpl().deletegiftcode(id) ? "Done." : "Fail.") + "\"}");
    }
    
    @RequestMapping(value = "/insertgiftcode")
    public void insertgiftcode(
            @RequestParam(value = "gift_Code", required = false) String Gift_Code,
            @RequestParam(value = "gift_Name", required = false) String Gift_Name,
            @RequestParam(value = "gift_Status", required = false) boolean Gift_Status,
            @RequestParam(value = "gift_Date_Vip", required = false) int Gift_Date_Vip,
            HttpServletResponse response
    ) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{\"result\":\""
                + (new GiftcodeDAOimpl().insertgiftcode(new Giftcode(Gift_Code, Gift_Name, Gift_Status, Gift_Date_Vip)
                ) ? "Done" : "Fail") + "\"}");
    }
}
