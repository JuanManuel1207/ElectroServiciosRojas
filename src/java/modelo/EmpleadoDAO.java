/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import config.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Asus
 */
public class EmpleadoDAO {
    
    Connection conexion;
    
    public EmpleadoDAO(){
        ConexionBD con = new ConexionBD();
        conexion=con.getConexion();
        
    }
    public List<Empleado> listaEmpleados(){
       PreparedStatement ps;
       ResultSet rs;
       
       List<Empleado> lista = new ArrayList<>();
        try {
            ps=conexion.prepareStatement("SELECT * FROM empleado");
            rs = ps.executeQuery();
            
            while(rs.next()){
                
                String id= rs.getString("id");
                String cedula= rs.getString("cedula");
                String nombre= rs.getString("nombre");
                String fechaNacimiento= ""+rs.getDate("fechaNacimiento");
                String correo= rs.getString("correo");
                String celular= rs.getString("celular");
                String salario= rs.getString("salario");
                String tipoEmpleado= rs.getString("tipoEmpleado");
                Empleado empleado = new Empleado(id, cedula, nombre, fechaNacimiento, correo, celular, salario, tipoEmpleado);
                
                lista.add(empleado);
            }
            return lista;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }
   
    public Empleado buscarEmpleados(String _id){
       PreparedStatement ps;
       ResultSet rs;
       
       Empleado empleado = null;
        try {
            ps=conexion.prepareStatement("SELECT * FROM empleado WHERE id=?");
            ps.setString(1, _id);
            rs = ps.executeQuery();
            
            while(rs.next()){
                
                String id= rs.getString("id");
                String cedula= rs.getString("cedula");
                String nombre= rs.getString("nombre");
                String fechaNacimiento= ""+rs.getDate("fechaNacimiento");
                String correo= rs.getString("correo");
                String celular= rs.getString("celular");
                String salario= rs.getString("salario");
                String tipoEmpleado= rs.getString("tipoEmpleado");
                
                empleado = new Empleado(id, cedula, nombre, fechaNacimiento, correo, celular, salario, tipoEmpleado);
                
            }
            return empleado;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }
    
    public boolean insertar(Empleado empleado){
       PreparedStatement ps;
       
        try {
            ps=conexion.prepareStatement("INSERT INTO empleado (cedula, nombre, fechaNacimiento, correo, celular, salario, tipoEmpleado) VALUES (?,?,?,?,?,?,?)");
        //    ps.setString(1, empleado.getId());
            ps.setString(1, empleado.getCedula());
            ps.setString(2, empleado.getNombre());
            ps.setDate(3, java.sql.Date.valueOf(empleado.getFechaNacimiento()));
            ps.setString(4, empleado.getCorreo());
            ps.setString(5, empleado.getCelular());
            ps.setString(6, empleado.getSalario());
            ps.setString(7, empleado.getTipoEmpleado());
            ps.execute();
            
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }

    public boolean actualizar(Empleado empleado){
       PreparedStatement ps;
       
        try {
            ps=conexion.prepareStatement("UPDATE empleado SET cedula=?, nombre=?, fechaNacimiento=?, correo=?, celular=?, salario=?, tipoEmpleado=? WHERE id=?");
            ps.setString(1, empleado.getCedula());
            ps.setString(2, empleado.getNombre());
            ps.setString(3, empleado.getFechaNacimiento());
            ps.setString(4, empleado.getCorreo());
            ps.setString(5, empleado.getCelular());
            ps.setString(6, empleado.getSalario());
            ps.setString(7, empleado.getTipoEmpleado());
            ps.setString(8, empleado.getId());
            ps.execute();
            
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }

    public boolean eliminar(String _id){
        System.out.println(_id);
       PreparedStatement ps;
       
        try {
            ps=conexion.prepareStatement("DELETE FROM empleado WHERE id=?");
            ps.setString(1, _id);
            ps.execute();
            
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
}

