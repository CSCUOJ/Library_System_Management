package com.sgc.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnect {

    private static final String URL = "jdbc:mysql://localhost:3306/librarydb?useSSL=false";
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "manager";

    static Connection conn = null;

    public static Connection getConnection() {

        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            System.out.println("Connection Success!");
        } catch (ClassNotFoundException | SQLException es) {
            System.out.println("ERROR :" + es);
        }
        return conn;
    }

    public static void disconnect() {
        if (conn != null) {
            try {
                conn.close();
                System.out.println("Connection closed!");
            } catch (SQLException es) {
                System.out.println("ERROR :" + es);
            }
        }
    }
}
