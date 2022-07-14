/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Producto;
import modelo.ProductoDAO;

/**
 *
 * @author Asus
 */
@WebServlet(name = "servletProducto", urlPatterns = {"/servletProducto"})
public class servletProducto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        ProductoDAO productoDAO = new ProductoDAO();
        String accion;
        RequestDispatcher dispatcher = null;
        
        accion = req.getParameter("accion");
        
        if(accion == null || accion.isEmpty()){
            dispatcher = req.getRequestDispatcher("gestionProductos.jsp");
            List<Producto> listProducts = productoDAO.listarProductos();
            listProducts.toString();
            req.setAttribute("listaProductos", listProducts);            
        }
        dispatcher.forward(req,resp);
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        doGet(req,resp);
    }
    
    
    
    
    

}
