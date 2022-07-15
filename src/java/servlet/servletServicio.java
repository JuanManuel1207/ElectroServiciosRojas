/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Servicio;
import modelo.ServicioDAO;

/**
 *
 * @author juanm
 */
@WebServlet(name = "servletServicio", urlPatterns = {"/servletServicio"})
public class servletServicio extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServicioDAO servicioDAO = new ServicioDAO();
        String action;
        RequestDispatcher dispatcher = null;
        
        action = request.getParameter("action");
        
        if (action==null | action.isEmpty()) {
            System.out.println("nel");
            dispatcher = request.getRequestDispatcher("gestionServicios.jsp");
            List<Servicio> listaServicio = servicioDAO.listarServicio();
            request.setAttribute("listaServicio", listaServicio);
        } else if("Agregar".equals(action)){
            System.out.println("entro");
            String id = request.getParameter("id");
            String cliente = request.getParameter("cliente");
            String tipoServicio = request.getParameter("tipoServicio");
            String estado = request.getParameter("estado");
            String fechaIngreso = request.getParameter("fecha_ingreso");
            String fechaSalida = request.getParameter("fecha_salida");
            Servicio servicio = new Servicio(id, cliente, tipoServicio, estado, fechaIngreso, fechaSalida);
            servicioDAO.ingresarServicio(servicio);
                        
            dispatcher = request.getRequestDispatcher("gestionServicios.jsp");
            List<Servicio> listaServicio = servicioDAO.listarServicio();
            request.setAttribute("listaServicio", listaServicio);
        }
        dispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
