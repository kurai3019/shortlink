/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import com.shortlink.entities.Links;
import com.shortlink.entities.Users;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
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
public class loginDAOImp implements loginDAO{

    @Override
    public Users login(String username, String password) {
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "");
            String sql = "select * from Users where User_Name = '"+username+"' and User_PassWord='"+password+"' and status=1";
            
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            String link=null;
            List<Users> result = new ArrayList<Users>();

            while(rs.next()){
                int userid= rs.getInt("user_id");
               String name=rs.getString("user_Name");
               String fullname=rs.getString("user_fullname");
               String mail=rs.getString("email");
               int role=rs.getInt("role_id");
               Date createdate = rs.getDate("create_date");
               Format formatter = new SimpleDateFormat("dd/MM/YYYY");
               String s =null;
               if (createdate != null){
                s = formatter.format(createdate);
               }
                Users user = new Users(userid,name,fullname,mail,role,s);
                result.add(user);
                
            }
            
            return result.get(0);
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;        
    };
 
        @Override
    public List<Links> linkHistory(String userid) {
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "");
            String sql = "select * from Link where Create_User="+userid+" and status = 1";
            
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            String link=null;
            List<Links> result = new ArrayList<Links>();

            while(rs.next()){
               String linkcode= rs.getString("link_code");
               String linkurl= rs.getString("link_URL");
               Date createdate = rs.getDate("create_date");               
               int linkview= rs.getInt("link_view");
               Format formatter = new SimpleDateFormat("dd/MM/YYYY");
               String s =null;
               if (createdate != null){
                s = formatter.format(createdate);
               }
                Links history = new Links(linkcode,linkurl,s,linkview);
                result.add(history);
                
            }
            
            return result;
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;        
    };
}
