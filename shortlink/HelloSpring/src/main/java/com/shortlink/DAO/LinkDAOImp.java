/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.DAO;

import com.shortlink.entities.Users;
import com.shortlink.entities.Vipcode;
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
    public int thongkeuserview(int userid){
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "select COUNT(link.Link_Code) sumlink,count(link.Link_View) sumview from Users join Link on USERs.User_id = link.Create_User where users.User_id = "+userid;
            
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            int sumview=0;
            int sumlink=0;

            while(rs.next()){
                sumlink = rs.getInt("sumlink");
                sumview = rs.getInt("sumview");

            }
            return sumview;
        }catch(Exception e){
            e.printStackTrace();
        }
        return 0;
    }
        public Vipcode addvipcode(String code) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "select * from GiftCode where Gift_Status = 1 and Gift_Code = '"+code+"'";

            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            Vipcode result = new Vipcode();

            while (rs.next()) {
                result.setDate(rs.getInt("Gift_Date_vip"));
                result.setId(rs.getInt("id")) ;

            }

            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    } ;
            public Users update(int userida) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "select * from Users where User_id = '" + userida + "' and status=1";

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
                Date datevip = rs.getDate("Expiry_Date_Vip");
                Format formatter = new SimpleDateFormat("dd/MM/YYYY");
                String s = null;
                String st = null;
                if (createdate != null) {
                    s = formatter.format(createdate);
                }
                if (datevip != null) {
                    st = formatter.format(datevip);
                }
                Users user = new Users(userid, name, fullname, mail, role, s,st);
                result.add(user);

            }

            return result.get(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    };
      public String updatedatevipusertoday(int userid,int date) {
                try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "update Users set Role_Id = 3, Expiry_Date_Vip = GetDate() + ? where user_id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, date);
            stm.setInt(2, userid);

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
     public String updatestatuscode(int codeid) {
                try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "update GiftCode set Gift_Status = 0 where ID = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, codeid);

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
    public String updatedatevipuser(int date,int userid) {
                try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "update Users set Role_Id = 3, Expiry_Date_Vip = DATEADD (Day, ?, Expiry_Date_Vip) where user_id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, date);
            stm.setInt(2, userid);

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
        public String updatedateviplinkcustom(int date,int userid) {
                try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "update link set Expiry_Date = DATEADD (Day, ?, Expiry_Date_Vip) where Link_Type = 1 and USER_ID = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, date);
            stm.setInt(2, userid);

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
     public String updatedateviplinkcustomtoday(int date,int userid) {
                try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "update link set Expiry_Date = GetDate() + ? where Link_Type = 1 and USER_ID = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, date);
            stm.setInt(2, userid);

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
        public int thongkeuserlink(int userid){
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "select COUNT(link.Link_Code) sumlink,count(link.Link_View) sumview from Users join Link on USERs.User_id = link.Create_User where users.User_id = "+userid;
            
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            int sumview=0;
            int sumlink=0;

            while(rs.next()){
                sumlink = rs.getInt("sumlink");
                sumview = rs.getInt("sumview");

            }
            return sumlink;
        }catch(Exception e){
            e.printStackTrace();
        }
        return 0;
    }
    public String xephang(int userid){
        try{
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "select users.User_id, count(link.Link_Code) sumlink,count(link.Link_View) sumview from Users left join Link on USERs.User_id = link.Create_User group by users.User_id order by sumview desc";

            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            int userida=0;
            int i = 0;
            int xephang =0;
            String ketqua = "";
            while(rs.next()){
                i++;
                userida = rs.getInt("User_id");
                if (userida == userid){
                    xephang= i;
                };
            }
            ketqua = Integer.toString(xephang) + " /"+Integer.toString(i);
            
            return ketqua;
        }catch(Exception e){
            e.printStackTrace();
        }
        return "";
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
