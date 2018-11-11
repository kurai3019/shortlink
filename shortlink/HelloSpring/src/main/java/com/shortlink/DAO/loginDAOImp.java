/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import com.shortlink.entities.Links;
import com.shortlink.entities.Users;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Administrator
 */
@Repository
public class loginDAOImp implements loginDAO {

    @Override
    public Users login(String username, String password) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "select * from Users where User_Name = '" + username + "' and User_PassWord='" + password + "' and status=1";

            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            String link = null;
            List<Users> result = new ArrayList<Users>();

            while (rs.next()) {
                int userid = rs.getInt("User_id");
                String name = rs.getString("User_Name");
                String fullname = rs.getString("User_FullName");
                String mail = rs.getString("Email");
                int role = rs.getInt("Role_Id");
                Date createdate = rs.getDate("Create_Date");
                Format formatter = new SimpleDateFormat("dd/MM/YYYY");
                String s = null;
                if (createdate != null) {
                    s = formatter.format(createdate);
                }
                Users user = new Users(userid, name, fullname, mail, role, s);
                result.add(user);

            }

            return result.get(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    ;

    @Override
    public List<Links> linkHistory(String userid) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "select * from Link where Create_User=" + userid + " and status = 1";

            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            String link = null;
            List<Links> result = new ArrayList<Links>();

            while (rs.next()) {
                String linkcode = rs.getString("Link_Code");
                String linkurl = rs.getString("link_URL");
                Date createdate = rs.getDate("Create_Date");
                int linkview = rs.getInt("Link_View");
                Format formatter = new SimpleDateFormat("dd/MM/YYYY");
                String s = null;
                if (createdate != null) {
                    s = formatter.format(createdate);
                }
                Links history = new Links(linkcode, linkurl, s, linkview);
                result.add(history);

            }

            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    ;

    @Override
    public boolean checkVipEx(String username) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "select * from Users \n"
                    + "where User_Name='" + username + "' and Role_Id = 3  and Expiry_Date_Vip < GETDATE()";

            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {
                return true;

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean changeEX(String username) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "update Users \n"
                    + "set Role_Id = 2\n"
                    + "where User_Name='" + username + "' and Role_Id = 3  and Expiry_Date_Vip < GETDATE()";
            PreparedStatement stm = con.prepareStatement(sql);
            if (stm.executeUpdate() > 0) {
                return true;
            }
            stm.close();
            con.close();
        } catch (Exception e1) {
            System.out.println(e1);
            return true;
        }
        return true;
    }

    @Override
    public String insertLoginByGoogle(String email, String userName, String userFullName) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "insert into Users(Email,Create_Date,Status,Role_Id,User_Name,User_FullName) "
                    + "values (?,GETDATE(),1,2,?,?);";

            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, userName);
            stm.setString(3, userFullName);

            int rs = stm.executeUpdate();

            stm.close();
            con.close();
            if (rs > 0) {
                return "Lỗi cmnr";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Lỗi rồi";
    }

    @Override
    public boolean checkLoginByGoogle(String email) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "select * from Users \n"
                    + "where Email='" + email + "' ";

            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Users loginByGoogle(String email) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "select * from Users where Email = '" + email + "' and status=1";

            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            String link = null;
            List<Users> result = new ArrayList<Users>();

            while (rs.next()) {
                int userid = rs.getInt("user_id");
                String name = rs.getString("user_Name");
                String fullname = rs.getString("user_fullname");
                String mail = rs.getString("email");
                int role = rs.getInt("role_id");
                Date createdate = rs.getDate("create_date");
                Format formatter = new SimpleDateFormat("dd/MM/YYYY");
                String s = null;
                if (createdate != null) {
                    s = formatter.format(createdate);
                }
                Users user = new Users(userid, name, fullname, mail, role, s);
                result.add(user);

            }

            return result.get(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String insertRegisterByMaual(String userNameRegister, String userPassWordRegister, String userFullNameRegister, String emailRegister) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "insert into Users(User_Name,Email,Status,Role_Id,User_PassWord,User_FullName,Create_Date) "
                    + "values (?,?,1,2,?,?,GETDATE());";

            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setString(1, userNameRegister);
            stm.setString(2, emailRegister);
            stm.setString(3, userPassWordRegister);
            stm.setString(4, userFullNameRegister);

            int rs = stm.executeUpdate();

            stm.close();
            con.close();
            if (rs > 0) {
                return "Lỗi cmnr";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Lỗi rồi";
    }

    public boolean checkRegisterByMaual(String userNameRegister, String userFullNameRegister, String emailRegister) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
