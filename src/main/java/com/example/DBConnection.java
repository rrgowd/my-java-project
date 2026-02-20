// package com.example;

// import java.sql.Connection;
// import java.sql.DriverManager;

// public class DBConnection {

//     public static Connection getConnection() {
//         try {
//             Class.forName("com.mysql.cj.jdbc.Driver");

//             Connection con = DriverManager.getConnection(
//                 "jdbc:mysql://localhost:3306/userapp",
//                 "root",
//                 "root"   // change if your password is different
//             );

//             return con;

//         } catch (Exception e) {
//             e.printStackTrace();
//         }
//         return null;
//     }
// }

package com.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/";
    private static final String USER = "root";
    private static final String PASS = "root";

    private static final String DB_NAME = "userapp";

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 1. Connect to MySQL without specifying DB
            Connection con = DriverManager.getConnection(URL + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", USER, PASS);
            Statement stmt = con.createStatement();

            // 2. Create DB if not exists
            stmt.executeUpdate("CREATE DATABASE IF NOT EXISTS " + DB_NAME);

            // 3. Connect to the specific DB
            con = DriverManager.getConnection(URL + DB_NAME + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", USER, PASS);
            stmt = con.createStatement();

            // 4. Create table if not exists
            String createTableSQL = "CREATE TABLE IF NOT EXISTS users (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY," +
                    "username VARCHAR(100) NOT NULL," +
                    "email VARCHAR(100) UNIQUE NOT NULL," +
                    "password VARCHAR(100) NOT NULL" +
                    ")";
            stmt.executeUpdate(createTableSQL);

            return con;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
