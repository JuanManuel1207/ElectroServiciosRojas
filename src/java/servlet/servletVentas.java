/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Producto;
import modelo.ProductoDAO;
import modelo.ProductosEnum;
import modelo.Ventas;
import modelo.VentasDAO;

/**
 *
 * @author Asus
 */
@WebServlet(name = "servletVentas", urlPatterns = {"/servletVentas"})
public class servletVentas extends HttpServlet {
    
    int item;
    double totalPagar;
    String fechaVenta;
    String cliente;
    double total;
    Producto product = new Producto();
    List<Ventas> listVentas = new ArrayList<>();  
    
                  
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        VentasDAO ventasDAO = new VentasDAO();        
        ProductoDAO prodDAO = new ProductoDAO();
                
        String accion;        
        RequestDispatcher dispatcher = null;
        Ventas venta = new Ventas();        
        accion = req.getParameter("accion");
        req.setAttribute("dateNow", LocalDate.now());        
        if("BuscarProducto".equals(accion)){      
            String idProducto = req.getParameter("codigoProducto");            
            if(prodDAO.buscarProducto(idProducto) != null ){
                product = prodDAO.buscarProducto(idProducto);                
                req.setAttribute("product", product);            
                req.setAttribute("listVentas", listVentas);
                req.setAttribute("totalPagar", totalPagar);                
            }else{
                req.setAttribute("action", "2");
            }                        
            //dispatcher = req.getRequestDispatcher("gestionVentas.jsp");            
        }else if("Agregar".equals(accion)){    
            totalPagar = 0;                        
            item = item+1;
            String idProducto = product.getProductId();                  
            String nombreProducto = product.getProductName();
            String tipoProducto = product.getProductType().toString();
            double price = product.getPrice();
            String cantidad = req.getParameter("cantidad"); 
            int cantidad2 = Integer.parseInt(cantidad);            
            fechaVenta = req.getParameter("fecha");            
            cliente = req.getParameter("nombreCliente");            
            total = cantidad2*price;
            if(prodDAO.buscarProducto(idProducto).getStock() != 0 && prodDAO.buscarProducto(idProducto).getStock() >= cantidad2){
                venta = new Ventas(item+"", cantidad2, total, fechaVenta, cliente, idProducto, nombreProducto, tipoProducto, price);                                                            
                listVentas.add(venta);                
            }else{
                req.setAttribute("action", "0");
            }            
            for(int i=0; i<listVentas.size(); i++){
                totalPagar = totalPagar+listVentas.get(i).getPrecioTotal();
            }            
            req.setAttribute("totalPagar", totalPagar);
            req.setAttribute("listVentas", listVentas);                        
        }else if("generarVenta".equals(accion)){
            if(!listVentas.isEmpty()){
                venta = new Ventas(cliente,fechaVenta,totalPagar);                                           
                String idVenta = ventasDAO.buscarIdVenta();
                System.out.println("--------: "+idVenta);
                ventasDAO.insertarVenta(venta);                         

                for(int i = 0; i < listVentas.size(); i++){                                    
                    Producto producto = prodDAO.buscarProducto(listVentas.get(i).getIdProducto());                
                    int stockActualizado = producto.getStock() - listVentas.get(i).getCantidad();
                    prodDAO.actualizarStock(Integer.parseInt(listVentas.get(i).getIdProducto()), stockActualizado);
                    venta = new Ventas(idVenta, listVentas.get(i).getIdProducto(), listVentas.get(i).getCantidad(), listVentas.get(i).getPriceProduct());                                
                    ventasDAO.guardarDetalleVenta(venta);                                                                
                }
                req.setAttribute("listVentas", listVentas);
                req.setAttribute("action", "1");             
                listVentas.removeAll(listVentas);                
            }else{
                req.setAttribute("action", "0");
            }                        
        }else if("Cancelar".equals(accion)){
            listVentas.removeAll(listVentas);
            totalPagar = 0;
            req.setAttribute("totalPagar",totalPagar);
            req.setAttribute("listVentas", listVentas);
        }else if("Eliminar".equals(accion)){            
            String id = req.getParameter("venta");            
            for(int i = 0; i < listVentas.size(); i++){
                if(listVentas.get(i).getIdVenta().equals(id))
                    listVentas.remove(i);
            }            
            totalPagar = 0;
            req.setAttribute("totalPagar",totalPagar);
        }      
        dispatcher = req.getRequestDispatcher("gestionVentas.jsp");
        
        dispatcher.forward(req,resp);    
                 
    }
       

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        doGet(req,resp);
    }
    
    

}
