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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Asus
 */
public class ProductoDAO {
    Connection conexionBD;
    
    public ProductoDAO(){
        ConexionBD con = new ConexionBD();
        conexionBD = con.getConexionDB();
    }
           
    public List<Producto> listarProductos(){
            PreparedStatement ps;
            ResultSet rs;
            
            List<Producto> productsList = new ArrayList<>();
            try{
                ps = conexionBD.prepareStatement("SELECT * FROM productos");
                rs = ps.executeQuery();
                while(rs.next()){
                    String productId = rs.getInt("id")+"";
                    String productName = rs.getString("name");
                    ProductosEnum productEnum = ProductosEnum.valueOf(rs.getString("tipo"));                                        
                    int stock = rs.getInt("cantidad");
                    double price = rs.getDouble("precio");
                    String brand = rs.getString("marca");
                    String model = rs.getString("modelo");
                    Producto product = new Producto(productId,productName,productEnum,stock,price,brand,model);                                        
                    productsList.add(product);
                }
                return productsList;
            }catch(SQLException e){
                System.out.println(e.toString());
                return null;
            }
            
    }
               
    public boolean insertarDB(Producto product){
        PreparedStatement ps;
        try{
            ps = conexionBD.prepareStatement("INSERT INTO productos(id, name, tipo, cantidad, precio, marca, modelo) values(?,?,?,?,?,?,?)");
            ps.setInt(1, Integer.parseInt(product.getProductId()));
            ps.setString(2, product.getProductName());
            ps.setString(3, product.getProductType().toString());
            ps.setInt(4, product.getStock());
            ps.setDouble(5, product.getPrice());
            ps.setString(6, product.getBrand());
            ps.setString(7, product.getModel());
            ps.execute();
            return true;
        }catch(SQLException e){
            System.out.println(e.toString());
            return false;
        }
                
    }
         //Para un solo registro.
    public Producto buscarProducto(String id){
            PreparedStatement ps;
            ResultSet rs;
            Producto product = null;
            
            try{
                ps = conexionBD.prepareStatement("SELECT * FROM productos WHERE id=?");
                ps.setString(1, id);
                rs = ps.executeQuery();
                
                while(rs.next()){
                    String productId = rs.getInt("id")+"";
                    String productName = rs.getString("name");
                    ProductosEnum productEnum = ProductosEnum.valueOf(rs.getString("tipo"));                    
                    int stock = rs.getInt("cantidad");
                    double price = rs.getDouble("precio");
                    String brand = rs.getString("modelo");
                    String model = rs.getString("marca");
                    product = new Producto(productId,productName,productEnum,stock,price,brand,model);                                        
                }
                return product;
            }catch(SQLException e){
                System.out.println(e.toString());
                return null;
            }
        }
    
    public boolean actualizarStock(int idProducto, int stock){
        PreparedStatement ps;
        String sql = "UPDATE PRODUCTOS SET cantidad=? WHERE id=?";
        try{
            ps = conexionBD.prepareStatement(sql);
            ps.setInt(1,stock);
            ps.setInt(2,idProducto);
            ps.execute();
        }catch(SQLException e){
            System.out.println(e.toString());
            return false;
        }
       return true;
    }
    
    public boolean eliminarProducto(String id){
        PreparedStatement ps;
        try{
            ps = conexionBD.prepareStatement("DELETE FROM productos WHERE id=?");
            ps.setInt(1, Integer.parseInt(id));
            ps.execute();
            return true;
        }catch(SQLException ex){
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE,null,ex);
            return false;
        }
    }
    
    public boolean actualiarProducto(Producto product){
        PreparedStatement ps;
        try{
            ps= conexionBD.prepareStatement("UPDATE productos SET id=?, name=?, tipo=?, cantidad=?, precio=?, marca=?, modelo=? WHERE id=?");
            ps.setInt(1, Integer.parseInt(product.getProductId()));
            ps.setString(2, product.getProductName());
            ps.setString(3, product.getProductType().toString());
            ps.setString(4, String.valueOf(product.getStock()));
            ps.setString(5, String.valueOf(product.getPrice()));
            ps.setString(6, product.getBrand());
            ps.setString(7, product.getModel());
            ps.setString(8, product.getProductId());
            ps.execute();
            return true;         
        }catch(SQLException ex){
            System.out.println(ex.toString());
            return false;
        }
    }
}
