/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Asus
 */
public class ConexionBD {
    
    private Connection conexion = null;
    private final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private final String URL = "jdbc:mysql://localhost:3306/pruebas_proyectoSW?serverTimeZone=UTC";
    private final String USER = "root";
    private final String PASS = "root";
    
    public Connection getConexion(){
        try {
            Class.forName( DRIVER );
            conexion = DriverManager.getConnection(URL,USER,PASS);
            System.out.println("conexion exitosa electServRojas");
            return conexion;
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            return null;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    } 
}
