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
        conexionBD = con.getConexionDB();
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
