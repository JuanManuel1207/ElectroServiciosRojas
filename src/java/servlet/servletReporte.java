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
import modelo.Ventas;
import modelo.VentasDAO;

/**
 *
 * @author Asus
 */
@WebServlet(name = "servletReporte", urlPatterns = {"/servletReporte"})
public class servletReporte extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        VentasDAO ventasDAO = new VentasDAO();
        String accion;
        RequestDispatcher dispatcher = null;
        
        accion = req.getParameter("accion");
        
        if(accion == null || accion.equals("")){
            dispatcher = req.getRequestDispatcher("reporteVentas.jsp");
            List<Ventas> listVentas = ventasDAO.listarVentas();
            listVentas.toString();            
            req.setAttribute("listaVentas", listVentas); 
            //dispatcher = req.getRequestDispatcher("reporteVentas.jsp");            
        }
        dispatcher.forward(req,resp);   
        
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException{
        doGet(req, resp);
        
    }
}
