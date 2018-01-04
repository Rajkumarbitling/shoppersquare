/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.includehelp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Operations implements OperationsInterface {

    static String message = "";

    public String save(UserPOJO uObject) {
        int flag = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/affablebean", "root", "root");
            PreparedStatement ps = con.prepareStatement("INSERT INTO product VALUES(?,?,?,?,?,?);");

            ps.setInt(1, uObject.getid());
            ps.setString(2, uObject.getname());
            ps.setBigDecimal(3, uObject.getprice());
            ps.setString(4, uObject.getdescription());
            ps.setInt(5, uObject.getcategory_id());
            ps.setDate(6, new java.sql.Date(uObject.getlast_update().getTime()));

            flag = ps.executeUpdate();
            if (flag != 0) {
                message = "Saved SuccessFully";
            } else {
                message = "Saved UnSuccessFull";
            }
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return message;
    }

    public List<UserPOJO> getListUsers() {
        System.out.println("inside getlist");
        List<UserPOJO> list = new ArrayList<UserPOJO>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/affablebean", "root", "root");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM product;");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserPOJO uObject = new UserPOJO();
                uObject.setid(rs.getInt(1));
                uObject.setname(rs.getString(2));
                uObject.setprice(rs.getBigDecimal(3));
                uObject.setdescription(rs.getString(4));
                uObject.setcategory_id(rs.getInt(5));
                uObject.setlast_update(rs.getDate(6));

                list.add(uObject);
            }
            con.close();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public String Update(UserPOJO uObject) {
        int status = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/affablebean", "root", "root");

            PreparedStatement ps = con.prepareStatement("UPDATE product SET name=?,price=?,description=?,category_id=?,last_update=? WHERE id=?;");

            ps.setString(1, uObject.getname());
            ps.setBigDecimal(2, uObject.getprice());
            ps.setString(3, uObject.getdescription());
            ps.setInt(4, uObject.getcategory_id());
            ps.setDate(5, new java.sql.Date(uObject.getlast_update().getTime()));
            ps.setInt(6, uObject.getid());

            status = ps.executeUpdate();
            if (status != 0) {
                message = "Updated SuccessFully";
            } else {
                message = "Update UnSuccessfull";
            }
            con.close();

        } catch (ClassNotFoundException e) {
            System.out.println(e);
        } catch (SQLException e) {
            System.out.println(e);
        }

        return message;
    }

    public String deleteUser(String id) {
        int status = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/affablebean", "root", "root");
            PreparedStatement ps = con.prepareStatement("DELETE FROM product WHERE id=?;");

            ps.setString(1, id);

            status = ps.executeUpdate();
            if (status != 0) {
                message = "Record Deleted SuccessFully";
            }
            con.close();

        } catch (ClassNotFoundException e) {
            System.out.println(e);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return message;
    }

}
