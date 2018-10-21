/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Administrator
 */
@Repository
public class LinkDAOImp implements LinkDAO{

    @Override
    public String getLink(String urla,String randomkey,String user) {
                try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "insert into Link(Link_URL,Link_Code,Create_Date,Status,Link_Type,Link_View,Create_User,Expiry_Date) \n" +
                            "select ?,?,GetDate(),1,0,0,?,GetDate()+value from Config\n" +
                            "where ID = 3";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, urla);
            stm.setString(2, randomkey);
            stm.setString(3, user);

            int rs = stm.executeUpdate();

            stm.close();
            con.close();
            if(rs>0){
                return "Lỗi cmnr";
            }           
        }catch(Exception e){
            e.printStackTrace();
        }
        return "Lỗi rồi";
    };
        public String loadURL(String URLa){
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "select Link_URL from link where link_code = '"+URLa+"' and Expiry_Date > GETDATE()";
            
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            String link=null;
            while(rs.next()){
                link = rs.getString("link_URL");

            }
            return link;
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
        public String AddView(String URLa){
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "update Link set Link_View=Link_View + 1 where Link_Code = '"+URLa+"'";
            
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            String link=null;
            while(rs.next()){
                link = rs.getString("link_URL");

            }
            return link;
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    };

    @Override
    public Boolean checkRandomKey(String RandomKey) {
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "select Link_Code from link where link_code = '"+RandomKey+"'";
            
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            String link=null;
            while(rs.next()){
            return true;

            }
            return false;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    @Override
    public Boolean checkBackList(String urlCut) {
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "select URL from BlackList where URL = '"+urlCut+"'";
            
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            String link=null;
            while(rs.next()){
            return true;

            }
            return false;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }

        
}
