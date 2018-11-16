/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import com.shortlink.model.shortlLink;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author dell
 */
public class ShortUrlDaoimpl implements ShortUrlDao {
    String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
    String usernamedb ="sa";
    String passworddb ="";
    private List<shortlLink> list = new ArrayList();

    @Override
    public List<shortlLink> getListLink(int search) {
        String sql = "select * from Link";
        if (search != -1) {
            sql += " where Link_ID=" + search;
        }
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, usernamedb, passworddb);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                list.add(new shortlLink(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10)));
            }
            stmt.close();
            con.close();
            return list;
        } catch (Exception e) {
            return null;
        }

    }

    @Override
    public Boolean updateLink(shortlLink sLink) {

        //if (getListLink(sLink.getLink_ID()) == null) {
        //    return false;
        //}
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, usernamedb, passworddb);
            String sql = "update Link set"
                    + " Link_Code= ?,"
                    + " Link_URL= ?, Create_Date=?,"
                    + " Create_User=?, Expiry_Date=?,"
                    + " Status=?, Link_View=?,"
                    + " Link_Title=?, Link_Type=? "
                    + " where Link_ID= ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, sLink.getLink_Code());
            stm.setString(2, sLink.getLink_URL());
            stm.setString(3, sLink.getCreate_Date());
            stm.setInt(4, sLink.getCreate_User());
            stm.setString(5, sLink.getExpiry_Date());
            stm.setInt(6, sLink.isStatus() ? 1 : 0);
            stm.setInt(7, sLink.getLink_View());
            stm.setString(8, sLink.getLink_Title());
            stm.setInt(9, sLink.getLink_type());
            stm.setInt(10, sLink.getLink_ID());
            if (stm.executeUpdate() > 0) {
                return true;
            }
            stm.close();
            con.close();
        } catch (Exception e1) {
            System.out.println(e1);
            return false;
        }
        return false;
    }

    @Override
    public Boolean deleteLink(int Link_ID) {
        if (getListLink(Link_ID) == null) {
            return false;
        }
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, usernamedb, passworddb);
            String sql = "delete Link where Link_ID= ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, Link_ID);
            if (stm.executeUpdate() > 0) {
                return true;
            }
            stm.close();
            con.close();
        } catch (Exception e1) {
            System.out.println(e1);
            return false;
        }
        return false;
    }

    @Override
    public Boolean insertLink(shortlLink sLink) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, usernamedb, passworddb);
            String sql = "insert into Link(Link_Code,"
                    + "Link_URL, Create_Date,"
                    + "Create_User,Expiry_Date,Status, Link_View,"
                    + "Link_Title, Link_Type) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, sLink.getLink_Code());
            stm.setString(2, sLink.getLink_URL());
            stm.setString(3, sLink.getCreate_Date());
            stm.setInt(4, sLink.getCreate_User());
            stm.setString(5, sLink.getExpiry_Date());
            stm.setInt(6, sLink.isStatus() ? 1 : 0);
            stm.setInt(7, sLink.getLink_View());
            stm.setString(8, sLink.getLink_Title());
            stm.setInt(9, sLink.getLink_type());
            if (stm.executeUpdate() > 0) {
                return true;
            }
            stm.close();
            con.close();
        } catch (Exception e1) {
            System.out.println(e1);
            return false;
        }
        return false;
    }

    @Override
    public shortlLink getlinkVIP(int linkType, int createUser) {
        String sql = "select Link_ID, Link_Code, Link_URL"
                + " from Link where Link_Type=" + linkType + " and Create_User=" + createUser;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, usernamedb, passworddb);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                return new shortlLink(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3));
            }
            stmt.close();
            con.close();
            return null;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Boolean changeLinkVip(shortlLink sLink) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, usernamedb, passworddb);
            String sql = "update Link set"
                    + " Link_Code= ?,"
                    + " Link_URL= ? "
                    + " where Link_ID= ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, sLink.getLink_Code());
            stm.setString(2, sLink.getLink_URL());
            stm.setInt(3, sLink.getLink_ID());
            if (stm.executeUpdate() > 0) {
                return true;
            }
            stm.close();
            con.close();
        } catch (Exception e1) {
            System.out.println(e1);
            return false;
        }
        return false;
    }

    public Boolean expiryDateVip(shortlLink sLink) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, usernamedb, passworddb);
            String sql = "update Link set"
                    + " Expiry_Date= ?"
                    + " where Link_ID= ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, sLink.getExpiry_Date());
            stm.setInt(2, sLink.getLink_ID());
            if (stm.executeUpdate() > 0) {
                return true;
            }
            stm.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        return false;
    }

    @Override
    public Boolean createLinkVip(shortlLink sLink) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, usernamedb, passworddb);
            String sql = "insert into Link(Link_Code,"
                    + "Link_URL, Create_Date,"
                    + "Create_User, Expiry_Date, Status"
                    + " , Link_View, Link_Type) values(?,?,?,?,"
                    + "( SELECT top 1 "
                    + "      [Expiry_Date_Vip] "
                    + "  FROM [ShortLink].[dbo].[Users] where User_id =" + sLink.getCreate_User() + ")"
                    + ",?,?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, sLink.getLink_Code());
            stm.setString(2, sLink.getLink_URL());
            stm.setString(3, new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            stm.setInt(4, sLink.getCreate_User());
            stm.setInt(5, 1);
            stm.setInt(6, 0);
            stm.setInt(7, 1);
            if (stm.executeUpdate() > 0) {
                return true;
            }
            stm.close();
            con.close();
        } catch (Exception e1) {
            System.out.println(e1);
            return false;
        }
        return false;
    }

}
