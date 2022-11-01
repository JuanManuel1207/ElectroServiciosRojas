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
            ps = conexionBD.prepareStatement("SELECT * FROM VENTAS WHERE fechaVenta = ?");
            ps.setDate(1, java.sql.Date.valueOf(fecha));
            rs = ps.executeQuery();
            
            while(rs.next()){
                String idVenta = rs.getInt("idVenta")+"";
                String cliente = rs.getString("cliente");
                    //double total = ProductosEnum.valueOf(rs.getString("tipo"));  
                String fechaVenta = rs.getDate("fechaVenta")+"";
             //   int cantidad = rs.getInt("cantidad");                    
                double valorUnitario = rs.getDouble("monto");
                System.out.println("dentro de DAO: "+ valorUnitario);
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
            ps = conexionBD.prepareStatement("SELECT SUM(monto) AS total FROM VENTAS WHERE fechaVenta = ?");
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
                ps = conexionBD.prepareStatement("SELECT ventas.idVenta,cliente,fechaVenta,detalleVenta.cantidad,precioVenta,productos.name FROM VENTAS NATURAL JOIN DETALLEVENTA, PRODUCTOS WHERE ventas.idVenta = detalleVenta.idVenta AND detalleVenta.idProducto = productos.id");
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
            ps = conexionBD.prepareStatement("INSERT INTO DETALLEVENTA(idVenta,idProducto,cantidad,precioVenta) VALUES(?,?,?,?)");
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
   
   /** 
    public List<Ventas> listarVentas(){
            PreparedStatement ps;
            ResultSet rs;
            
            List<Ventas> sellingsList = new ArrayList<>();
            try{
                ps = conexionBD.prepareStatement("SELECT idventas,p.id,p.name, p.tipo,v.cantidad,p.precio,v.precioTotal,v.fecha, v.cliente FROM VENTAS as v, PRODUCTOS as P WHERE v.idProducto = p.id");
                rs = ps.executeQuery();
                while(rs.next()){
                    String idVenta = rs.getString("idventas");
                    String idProducto = rs.getString("id");                                                           
                    String productName = rs.getString("name");                    
                    String productType = rs.getString("tipo");                       
                    int cantidad = rs.getInt("cantidad");
                    double priceProduct = rs.getDouble("precio");
                    double precioTotal = rs.getDouble("precioTotal");
                    String fecha = ""+rs.getDate("fecha");
                    String cliente = rs.getString("cliente");
                    ProductoDAO pDAO = new ProductoDAO();
                                                                               
                    Ventas ventas = new Ventas(idVenta, cantidad, precioTotal, fecha, cliente,idProducto,productName,productType,priceProduct);                                      
                    sellingsList.add(ventas);
                    System.out.println(sellingsList.size()+"TAMAÑOOOO");
                }
                return sellingsList;
            }catch(SQLException e){
                System.out.println(e.toString());
                return null;
            }
            
    }
    
    public boolean insertarDB(Ventas venta){
        PreparedStatement ps;
        try{
            ps = conexionBD.prepareStatement("INSERT INTO ventas (idventas,cantidad,precioTotal,fecha,cliente,idProducto) values(?,?,?,?,?,?)");
            ps.setString(1, venta.getIdVenta());
            ps.setInt(2, venta.getCantidad());
            ps.setDouble(3,venta.getPrecioTotal());
            ps.setString(4, venta.getFecha());
            ps.setString(5,venta.getCliente());
            ps.setString(6,venta.getIdProducto());
            
            System.out.println(venta.getIdVenta());
            ps.execute();
            return true;
        }catch(SQLException e){
            System.out.println("AQUI"+e.toString());
            return false;
            
        }
    }
    
    public Ventas buscarVenta(String id){
        PreparedStatement ps;
        ResultSet rs;
        Ventas venta = null;
        try{
            ps = conexionBD.prepareStatement("SELECT idventas FROM ventas WHERE id=?");
            ps.setString(1, id);
            rs = ps.executeQuery();
            
            while(rs.next()){
                String idVenta = rs.getString("idventas");
                String idProduct = rs.getString("id");
                String productName = rs.getString("name");
                String typeProduct = rs.getString("tipo");
                int cantidad = rs.getInt("cantidad");
                double precio = rs.getDouble("precio");
                double precioTotal = rs.getDouble("precioTotal");
                String fecha = ""+rs.getDate("fecha");
                String cliente = rs.getString("cliente");
                
                venta = new Ventas(idVenta, cantidad, precioTotal, fecha, cliente, idProduct, productName, typeProduct, precio);                
            }
            return venta;
        }catch(SQLException e){
            System.out.println(e.toString());
            return null;
        }       
    }
    
    public boolean eliminarVenta(String id){
        PreparedStatement ps;
        try{
            ps = conexionBD.prepareStatement("DELETE FROM ventas where idventas=?");
            ps.setString(1, id);
            ps.execute();
            return true;
        }catch(SQLException ex){
            Logger.getLogger(VentasDAO.class.getName()).log(Level.SEVERE,null,ex);
            return false;
        }
        
    }*/
}
