/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author juanm
 */
import config.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServicioDAO {
    Connection connection;
    
    public ServicioDAO(){
        ConexionBD connectBD = new ConexionBD();
        connection = connectBD.getConexion();
    }
    
    public List<Servicio> listarServicio(){
        PreparedStatement ps;
        ResultSet rs;
        
        List<Servicio> lista = new ArrayList<>();
        
        try {
            ps = connection.prepareStatement("SELECT * FROM SERVICE");
            rs = ps.executeQuery();
            
            while(rs.next()){
                String id = rs.getString("id");
                String cliente = rs.getString("cliente");
                String tipoServicio = rs.getString("tipo");
                String estado = rs.getString("estado");
                String fechaIngreso = ""+rs.getDate("entrada");
                String fechaSalida = ""+rs.getDate("salida");
                
                
                System.out.println(id+" "+cliente+" "+tipoServicio+" "+estado+" "+fechaIngreso+" "+fechaSalida);
                
                Servicio servicio = new Servicio(id, cliente, tipoServicio, estado, fechaIngreso, fechaSalida);
                
                lista.add(servicio);
            }
           return lista;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }
    
    public boolean ingresarServicio(Servicio servicio){
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement("INSERT INTO SERVICE(id,cliente,tipo,estado,entrada,salida) VALUES (?,?,?,?,?,?)");
            ps.setString(1, servicio.getId());
            ps.setString(2, servicio.getCliente());
            ps.setString(3, servicio.getTipoServicio());
            ps.setString(4, servicio.getEstado());            
            ps.setDate(5, java.sql.Date.valueOf(servicio.getFechaIngreso()));
            ps.setDate(6, java.sql.Date.valueOf(servicio.getFechaSalida()));
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
    
    public Servicio buscarServicio(){
        return null;
    }
    
    public boolean eliminarServicio(){
        return false;
    }
    
    public boolean actualizarServicio(Servicio servicio){
        return false;
    }
    
    
}
