/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import com.shortlink.model.Config;
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
public class ConfigDAOimpl implements ConfigDAO {

    private List<Config> list = new ArrayList();

    public List<Config> getconfig() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from Config");
            while (rs.next()) {
                list.add(new Config(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
            stmt.close();
            con.close();
            return list;
        } catch (Exception e) {
            return null;
        }
    }

    public Boolean updateconfig(Config config) {

        //if (getListLink(sLink.getLink_ID()) == null) {
        //    return false;
        //}
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "update Config set"
                    + " Config_Name= ?,"
                    + " Value= ?"
                    + " where ID= ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, config.getConfig_Name());
            stm.setInt(2, config.getValue());
            stm.setInt(3, config.getID());
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

    public Boolean deleteconfig(int config) {
        // if (getconfig(config) == null) {
        //   return false;
        // }
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "delete Config where ID= ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, config);
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

    public Boolean insertLink(Config config) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "insert into Config(Config_Name,"
                    + " Value) values(?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, config.getConfig_Name());
            stm.setInt(2, config.getValue());
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
