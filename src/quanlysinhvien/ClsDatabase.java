/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quanlysinhvien;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author longs
 */
public class ClsDatabase {
    public static Connection con;
    public static boolean open(){
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-0NKDULM\\SQLEXPRESS:1433;databaseName=QLSinhVien;integratedSecurity=true");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;                    
        }
    }
    
    public static boolean close(){
        try {
            con.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
