/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import config.ConexionBD;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Asus
 */
public class VentasDAO {
    Connection conexionBD;    
    
    public VentasDAO(){
        ConexionBD con = new ConexionBD();
        conexionBD = con.getConexion();
    }
    public List<Ventas> listarVentasFecha(String fecha){
        PreparedStatement ps;
        ResultSet rs;
        List<Ventas> lista = new ArrayList<>();
        
        try {
            ps = conexionBD.prepareStatement("SELECT * FROM ventas WHERE fechaVenta = ?");
            ps.setDate(1, java.sql.Date.valueOf(fecha));
            rs = ps.executeQuery();
            
            while(rs.next()){
                String idVenta = rs.getInt("idVenta")+"";
                String cliente = rs.getString("cliente");
                    //double total = ProductosEnum.valueOf(rs.getString("tipo"));  
                String fechaVenta = rs.getDate("fechaVenta")+"";
             //   int cantidad = rs.getInt("cantidad");                    
                double valorUnitario = rs.getDouble("monto");
             //   String nombreProducto = rs.getString("name");
                    
                Ventas venta = new Ventas(idVenta, cliente, 0, valorUnitario, fechaVenta, "");            
                lista.add(venta);
            }
           return lista;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }
    
    public Double totalVentas(String fecha){
        PreparedStatement ps;
        ResultSet rs;
        Double total = 0.0;
        try {
            ps = conexionBD.prepareStatement("SELECT SUM(monto) AS total FROM ventas WHERE fechaVenta = ?");
            ps.setDate(1, java.sql.Date.valueOf(fecha));
            rs = ps.executeQuery();
            while(rs.next()){
                String aux = rs.getString("total");
                total = ( (aux==null) ? total : Double.parseDouble(aux) );
            }
            return total;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }
    
     public List<Ventas> listarVentas(){
            PreparedStatement ps;
            ResultSet rs;
            
            List<Ventas> ventasList = new ArrayList<>();
            try{
                ps = conexionBD.prepareStatement("SELECT ventas.idVenta,cliente,fechaVenta,detalleVenta.cantidad,precioVenta,productos.name FROM ventas NATURAL JOIN detalleVenta, productos WHERE ventas.idVenta = detalleVenta.idVenta AND detalleVenta.idProducto = productos.id");
                rs = ps.executeQuery();
                while(rs.next()){
                    String idVenta = rs.getInt("idVenta")+"";
                    String cliente = rs.getString("cliente");
                    //double total = ProductosEnum.valueOf(rs.getString("tipo"));  
                    String fecha = rs.getDate("fechaVenta")+"";
                    int cantidad = rs.getInt("cantidad");                    
                    double valorUnitario = rs.getInt("precioVenta");
                    String nombreProducto = rs.getString("name");
                    
                    Ventas venta = new Ventas(idVenta, cliente, cantidad, valorUnitario, fecha, nombreProducto);
                    ventasList.add(venta);
                }
                return ventasList;
            }catch(SQLException e){
                System.out.println(e.toString());
                return null;
            }
            
    }
  
     public List<Ventas> obtenerVenta(int id){
            PreparedStatement ps;
            ResultSet rs;
            List<Ventas> ventasList = new ArrayList<>();
            try{
                ps = conexionBD.prepareStatement("SELECT ventas.idVenta,cliente,fechaVenta,detalleVenta.cantidad,precioVenta,productos.name,ventas.monto FROM ventas NATURAL JOIN detalleVenta, productos WHERE ? = detalleVenta.idVenta AND detalleVenta.idProducto = productos.id");
                ps.setInt(1, id);
                rs = ps.executeQuery();
                while(rs.next()){
                    String idVenta = rs.getInt("idVenta")+"";
                    String cliente = rs.getString("cliente");
                    String fecha = rs.getDate("fechaVenta")+"";
                    int cantidad = rs.getInt("cantidad");                    
                    double valorUnitario = rs.getInt("precioVenta");
                    String nombreProducto = rs.getString("name");
                    double valorTotal = rs.getInt("monto");
                    Ventas venta = new Ventas(idVenta,cliente,cantidad,valorUnitario,fecha,nombreProducto,valorTotal);
                    ventasList.add(venta);
                }
                return ventasList;
            }catch(SQLException e){
                System.out.println(e.toString());
                return null;
            }
            
    }
     
     
    public boolean insertarVenta(Ventas venta){
        PreparedStatement ps;        
        try{
            ps = conexionBD.prepareStatement("INSERT INTO ventas(cliente,fechaVenta,monto) values(?,?,?)");            
            ps.setString(1,venta.getCliente());
            ps.setString(2, venta.getFecha());            
            ps.setDouble(3,venta.getPrecioTotal());                        
            ps.execute();
            return true;
        }catch(SQLException e){
            System.out.println(e.toString());
            return false;
            
        }        
    }               
    
    public String buscarIdVenta(){
        
        PreparedStatement ps;
        ResultSet rs;        
        String idVenta="";
        try{
            ps = conexionBD.prepareStatement("SELECT MAX(idVenta) FROM ventas");            
            rs = ps.executeQuery();            
            while(rs.next()){
                idVenta = rs.getInt(1)+1+"";                                                              
            }            
        }catch(SQLException e){
            System.out.println(e.toString());            
        }       
        return idVenta;
    }
    
   public boolean guardarDetalleVenta(Ventas venta){
        PreparedStatement ps;
        try{
            ps = conexionBD.prepareStatement("INSERT INTO detalleVenta(idVenta,idProducto,cantidad,precioVenta) VALUES(?,?,?,?)");
            ps.setInt(1, Integer.parseInt(venta.getIdVenta()));
            ps.setInt(2, Integer.parseInt(venta.getIdProducto()));
            ps.setInt(3,venta.getCantidad());
            ps.setDouble(4, venta.getPriceProduct());
            ps.execute();
            return true;            
        }catch(SQLException e){
            System.out.println(e.toString());
            return false;
        }
    }
}
