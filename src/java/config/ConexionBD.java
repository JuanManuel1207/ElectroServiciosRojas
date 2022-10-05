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
    /**
    private Connection conexion = null;
    private final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private final String URL = "jdbc:mysql://localhost:3306/db_computers?serverTimeZone=UTC";
    private final String USER = "COMPUTER";
    private final String PASS = "123";
    
    public Connection getConexion(){
        try {
            Class.forName( DRIVER );
            conexion = DriverManager.getConnection(URL,USER,PASS);
            System.out.println("conexion exitosa db_computers");
            return conexion;
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            return null;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    } **/
    
    private Connection conexion_DB = null;
    private final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private final String URL_DB = "jdbc:mysql://localhost:3306/pruebas_proyectoSW?serverTimeZone=UTC";
    private final String USER_DB = "root";
    private final String PASS_DB = "root";
    
    public Connection getConexionDB(){
        try{
            Class.forName(DRIVER);
            conexion_DB = DriverManager.getConnection(URL_DB,USER_DB,PASS_DB);
            //System.out.println("Conexión éxitosa a BD");
            return conexion_DB;
        }catch(SQLException ex){
            System.out.println(ex.toString());
            return null;
        }catch(ClassNotFoundException ex){
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE,null, ex);
            return null;
        }
    }
}
