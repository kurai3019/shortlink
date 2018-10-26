/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import com.shortlink.model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

/**
 *
 * @author dell
 */
public class UserDAOimpl implements UserDAO {

    private List<User> list;

    @Override
    public List<User> getListUser(int id) {
        String sql = "select * from Users";
        //if (id != -1) {
        //    sql += " where User_id ='" + id + "'";
       // }
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                list.add(new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        rs.getString(9)
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
    public Boolean updateUser(User user) {

        if (getListUser(user.getUser_id()) == null) {
            return false;
        }

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "update Users set"
                    + "      User_Name=?, "
                    + "      Email=?, "
                    + "      User_FullName=?, "
                    + "      User_PassWord=?, "
                    + "      Role_Id=?, "
                    + "      Create_Date=?, "
                    + "      Status=?, "
                    + "      Expiry_Date_Vip=?, "
                    + "     where User_id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, user.getUser_Name());
            stm.setString(2, user.getEmail());
            stm.setString(3, user.getUser_FullName());
            stm.setString(4, user.getUser_PassWord());
            stm.setInt(5, user.getRole_Id());
            stm.setString(6, user.getCreate_Date());
            stm.setBoolean(7, user.isStatus());
            stm.setString(8, user.getExpiry_Date_Vip());
            stm.setInt(9, user.getUser_id());
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
    public Boolean deleteUser(int id) {
        if (getListUser(id) == null) {
            return false;
        }
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "delete Users where User_id=" + id;
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
    public Boolean insertUser(User user) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "insert into Users("
                    + "      User_Name,"
                    + "      Email,"
                    + "      User_FullName,"
                    + "      User_PassWord,"
                    + "      Role_Id,"
                    + "      Create_Date,"
                    + "      Status,"
                    + "      Expiry_Date_Vip)"
                    + "      values(?,?,?,?,?,?,?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, user.getUser_Name());
            stm.setString(2, user.getEmail());
            stm.setString(3, user.getUser_FullName());
            stm.setString(4, user.getUser_PassWord());
            stm.setInt(5, user.getRole_Id());
            stm.setString(6, user.getCreate_Date());
            stm.setBoolean(7, user.isStatus());
            stm.setString(8, user.getExpiry_Date_Vip());
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
