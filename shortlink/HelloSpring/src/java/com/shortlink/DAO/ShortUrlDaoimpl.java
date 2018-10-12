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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dell
 */
public class ShortUrlDaoimpl implements ShortUrlDao {

    private List<shortlLink> list = new ArrayList();

    @Override
    public List<shortlLink> getListLink(String search) {

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShortLink";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            String sql = "select * from Link where Link_Code=?";
            // + " or Link_ID =?"
            // + " or Link_URL =?"
            // + " or Create_Date=?"
            // + " or Create_User=?"
            // + " or Status=?"
            // + " or Link_View=?"
            // + " or Link_Title=?"
            // + " or isCustomLink=?"
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, search);
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                shortlLink std = new shortlLink(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getBoolean(6),rs.getInt(7),rs.getString(8),rs.getBoolean(9));
                list.add(std);
            }
            stm.close();
            con.close();
            return list;
        } catch (Exception e) {
            return null;
        }

    }

}
