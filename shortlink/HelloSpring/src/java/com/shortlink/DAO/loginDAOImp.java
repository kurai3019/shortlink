/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import com.shortlink.entities.Users;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Administrator
 */
@Repository
public class loginDAOImp implements loginDAO{

    @Override
    public Users login(String username, String password) {
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "select * from Users where User_code='"+username+"' and User_PassWord='"+password+"' and status=1";
            
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            String link=null;
            List<Users> result = new ArrayList<Users>();

            while(rs.next()){
               String usercode= rs.getString("user_code");
               String name=rs.getString("user_Name");
               String fullname=rs.getString("user_fullname");
               String mail=rs.getString("email");
               int role=rs.getInt("role_id");
                Users user = new Users(usercode,name,fullname,mail,role);
                result.add(user);
                
            }
            
            return result.get(0);
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;        
    };
    
}
