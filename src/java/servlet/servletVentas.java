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
      
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        VentasDAO ventasDAO = new VentasDAO();        
        ProductoDAO prodDAO = new ProductoDAO();
                
        String accion;
        RequestDispatcher dispatcher = null;
        
        accion = req.getParameter("accion");
        
        if(accion == null || accion.isEmpty()){
            dispatcher = req.getRequestDispatcher("gestionVentas.jsp");
            List<Ventas> listVentas = ventasDAO.listarVentas();
            listVentas.toString();
            req.setAttribute("listaVentas", listVentas);
            
        }else if("Insertar".equals(accion)){                
            String idVenta= req.getParameter("idVenta");            
            String idProduct = req.getParameter("idProducto");
            String nameProduct = req.getParameter("name");
            String productType = req.getParameter("select");
            ProductosEnum productEnum = (productType == "0")? ProductosEnum.ELECTRODOMESTICO : ProductosEnum.REPUESTO;            
            int cantidad = Integer.parseInt(req.getParameter("cantidad"));
            double precio = Double.parseDouble(req.getParameter("precio"));
            double precioTotal = Double.parseDouble(req.getParameter("total"));
            String fecha = req.getParameter("fecha_venta");                                    
            String cliente = req.getParameter("namecliente");                                                            
            Ventas venta = new Ventas(idVenta, cantidad, precioTotal, fecha, cliente, idProduct,nameProduct ,productEnum.toString(), precio);
            ventasDAO.insertarDB(venta);
            dispatcher = req.getRequestDispatcher("gestionVentas.jsp");
            List<Ventas> listVentas = ventasDAO.listarVentas();
            req.setAttribute("listaVentas", listVentas);                                            
                                    
        }else if("Eliminar".equals(accion)){
            String id = req.getParameter("venta");
            ventasDAO.eliminarVenta(id);
            dispatcher = req.getRequestDispatcher("gestionVentas.jsp");
            List<Ventas> listVentas = ventasDAO.listarVentas();
            req.setAttribute("listaVentas", listVentas);
        }
        
        dispatcher.forward(req,resp);    
 
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        doGet(req,resp);
    }
    
    

}
