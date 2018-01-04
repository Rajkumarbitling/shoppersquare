/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SULAN
 */
public class DbUtil {
    
      private static Connection connection = null;

    public static Connection getConnection() {

        if (connection != null) {
            return connection;
        } else {
            try {
                
                Class.forName("com.mysql.jdbc.Driver");
             connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/affablebean","root","root");

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(DbUtil.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(DbUtil.class.getName()).log(Level.SEVERE, null, ex);
            }
            return connection;
        }
    }
}
