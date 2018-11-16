/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import com.shortlink.model.Giftcode;
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
public class GiftcodeDAOimpl implements GiftcodeDAO {

    private List<Giftcode> list = new ArrayList();
    String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
    String usernamedb ="sa";
    String passworddb ="";

    public List<Giftcode> getgiftcode() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, usernamedb, passworddb);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from GiftCode");
            while (rs.next()) {
                list.add(new Giftcode(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getInt(5)));
            }
            stmt.close();
            con.close();
            return list;
        } catch (Exception e) {
            return null;
        }
    }

    public Boolean updategiftcode(Giftcode giftcode) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, usernamedb, passworddb);
            String sql = "update GiftCode set"
                    + " [Gift_Code]=?"
                    + " ,[Gift_Name]=?"
                    + " ,[Gift_Status]=?"
                    + " ,[Gift_Date_Vip]=? "
                    + " where ID= ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, giftcode.getGift_Code());
            stm.setString(2, giftcode.getGift_Name());
            stm.setBoolean(3, giftcode.isGift_Status());
            stm.setInt(4, giftcode.getGift_Date_Vip());
            stm.setInt(5, giftcode.getID());
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

    public Boolean deletegiftcode(int giftcode) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, usernamedb, passworddb);
            PreparedStatement stm = con.prepareStatement("delete GiftCode where ID= ?");
            stm.setInt(1, giftcode);
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

    public Boolean insertgiftcode(Giftcode giftcode) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, usernamedb, passworddb);
            String sql = "insert into GiftCode(Gift_Code,"
                    + " Gift_Name, Gift_Status, Gift_Date_Vip) values(?,?,?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, giftcode.getGift_Code());
            stm.setString(2, giftcode.getGift_Name());
            stm.setBoolean(3, giftcode.isGift_Status());
            stm.setInt(4, giftcode.getGift_Date_Vip());
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
