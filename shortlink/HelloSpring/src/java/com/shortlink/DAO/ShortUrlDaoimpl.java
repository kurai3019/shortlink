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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dell
 */
public class ShortUrlDaoimpl implements ShortUrlDao {

    private List<shortlLink> list = new ArrayList();

    @Override
    public List<shortlLink> getListLink(int search) {
        String sql = "select * from Link";
        if (search != -1) {
            sql += " where Link_ID= " + search;
        }
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            // + " or Link_ID =?"
            // + " or Link_Code = 
            // + " or Link_URL =?"
            // + " or Create_Date=?"
            // + " or Create_User=?"
            // + " or Status=?"
            // + " or Link_View=?"
            // + " or Link_Title=?"
            // + " or isCustomLink=?"
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                shortlLink std = new shortlLink(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getBoolean(6), rs.getInt(7), rs.getString(8), rs.getInt(9));
                list.add(std);
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

        if (getListLink(sLink.getLink_ID()) == null) {
            return false;
        }

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "update Link set Link_Code= ?,"
                    + "Link_URL= ?, Create_Date=?,"
                    + "Create_User=?, Status=?, Link_View=?,"
                    + "Link_Title=?, Link_Type=? "
                    + "where Link_ID= ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, sLink.getLink_Code());
            stm.setString(2, sLink.getLink_URL());
            stm.setString(3, sLink.getCreate_Date());
            stm.setInt(4, sLink.getCreate_User());
            stm.setBoolean(5, sLink.isStatus());
            stm.setInt(6, sLink.getLink_View());
            stm.setString(7, sLink.getLink_Title());
            stm.setInt(8, sLink.getLink_type());
            stm.setInt(9, sLink.getLink_ID());
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
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
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
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "insert into Link(Link_Code,"
                    + "Link_URL, Create_Date,"
                    + "Create_User, Status, Link_View,"
                    + "Link_Title, Link_Type) values(?,?,?,?,?,?,?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, sLink.getLink_Code());
            stm.setString(2, sLink.getLink_URL());
            stm.setString(3, sLink.getCreate_Date());
            stm.setInt(4, sLink.getCreate_User());
            stm.setBoolean(5, sLink.isStatus());
            stm.setInt(6, sLink.getLink_View());
            stm.setString(7, sLink.getLink_Title());
            stm.setInt(8, sLink.getLink_type());
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
