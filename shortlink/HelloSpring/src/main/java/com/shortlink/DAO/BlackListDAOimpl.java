/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import com.shortlink.model.blackList;
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
public class BlackListDAOimpl implements BlackListDAO {

    private List<blackList> list = new ArrayList();
    String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
    String usernamedb = "sa";
    String passworddb ="123";
    
    @Override
    public List<blackList> getBlacklist(int bl) {
        String sql = "select * from BlackList";
        //if (id != -1) {
        //  sql += " where ID ='" + bl + "'";
        // }
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, usernamedb, passworddb);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                list.add(new blackList(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
            stmt.close();
            con.close();
            return list;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    @Override
    public Boolean updateBl(blackList bl) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, usernamedb, passworddb);
            String sql = "update BlackList set"
                    + " URL=?,"
                    //+ " Create_User=?, Create_Date=?,"
                    + " Update_User=?, Update_Date=?,"
                    + " Status=?"
                    + "     where ID = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, bl.getURL());
            //stm.setInt(2, bl.getCreate_User());
            //stm.setString(3, bl.getCreate_Date());
            stm.setString(2, bl.getUpdate_User());
            stm.setString(3, new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            stm.setInt(4, bl.getStatus());
            stm.setInt(5, bl.getID());
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
    public Boolean deleteBl(int bl) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, usernamedb, passworddb);
            String sql = "delete BlackList where ID=" + bl;
            Statement stmt = con.createStatement();
//            ResultSet rs = stmt.executeQuery(sql);
//            PreparedStatement stm = con.prepareStatement(sql);
//            stm.setInt(1, id);
            if (stmt.executeUpdate(sql) > 0) {
                return true;
            }
            stmt.close();
            con.close();
        } catch (Exception e1) {
            System.out.println(e1);
            return false;
        }
        return false;
    }

    @Override
    public Boolean insertBl(blackList bl) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, usernamedb, passworddb);
            String sql = "insert into BlackList("
                    + "URL,"
                    + "Create_User, Create_Date,"
                    + "Update_User,Update_Date,"
                    + "Status) values(?,?,?,?,?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, bl.getURL());
            stm.setInt(2, bl.getCreate_User());
            stm.setString(3, new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            stm.setString(4, bl.getUpdate_User());
            stm.setString(5, new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            stm.setInt(6, 1);
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
