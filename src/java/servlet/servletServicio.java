/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Emple;
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
            dispatcher = request.getRequestDispatcher("gestionServicios.jsp");
            List<Servicio> listaServicio = servicioDAO.listarServicio();
            List<Emple> listaEmple = servicioDAO.listarEmpleado();
            request.setAttribute("listaServicio", listaServicio);
            request.setAttribute("empleados", listaEmple);
        } else if("Agregar".equals(action)){
            String id = request.getParameter("id");
            String cliente = request.getParameter("cliente");
            String tipoServicio = request.getParameter("tipoServicio");
            String estado = request.getParameter("estado");
            String fechaIngreso = request.getParameter("fecha_ingreso");
            String fechaSalida = request.getParameter("fecha_salida");
            String descripcion = request.getParameter("descripcion");
            String precio = request.getParameter("precio");
            String empleado = request.getParameter("empleado");
            Servicio servicio = new Servicio(id, cliente, tipoServicio, estado, fechaIngreso, fechaSalida, descripcion, precio, empleado);
            if(servicioDAO.ingresarServicio(servicio)){
                dispatcher = request.getRequestDispatcher("gestionServicios.jsp");
                List<Servicio> listaServicio = servicioDAO.listarServicio();
                request.setAttribute("listaServicio", listaServicio);
                List<Emple> listaEmple = servicioDAO.listarEmpleado();
                request.setAttribute("empleados", listaEmple);
                request.setAttribute("action", "1");
            }else{
                dispatcher = request.getRequestDispatcher("gestionServicios.jsp");
                List<Servicio> listaServicio = servicioDAO.listarServicio();
                request.setAttribute("listaServicio", listaServicio);
                List<Emple> listaEmple = servicioDAO.listarEmpleado();
                request.setAttribute("empleados", listaEmple);
                request.setAttribute("action", "0");

            }
        } else if ("Eliminar".equals(action)) {
            String servicio = request.getParameter("servicio");
            
            if(servicioDAO.eliminarServicio(servicio)){
                dispatcher = request.getRequestDispatcher("gestionServicios.jsp");
                List<Servicio> listaServicio = servicioDAO.listarServicio();
                request.setAttribute("listaServicio", listaServicio);
                List<Emple> listaEmple = servicioDAO.listarEmpleado();
                request.setAttribute("empleados", listaEmple);
                request.setAttribute("action", "1");
            }else{
                dispatcher = request.getRequestDispatcher("gestionServicios.jsp");
                List<Servicio> listaServicio = servicioDAO.listarServicio();
                request.setAttribute("listaServicio", listaServicio);
                List<Emple> listaEmple = servicioDAO.listarEmpleado();
                request.setAttribute("empleados", listaEmple);
                request.setAttribute("action", "0");
            }
            
            
        }else if ("Editar".equals(action)) {
            System.out.println("editar");
            String id = request.getParameter("servicio");
            System.out.println(id);
            dispatcher = request.getRequestDispatcher("editarServicio.jsp");
            List<Servicio> listaServicio = new ArrayList<>();
            listaServicio.add(servicioDAO.buscarServicio(id));
            request.setAttribute("servicio", listaServicio);
            List<Emple> listaEmple = servicioDAO.listarEmpleado();
            request.setAttribute("empleados", listaEmple);
        }else if("Consultar".equals(action)){
            String id = request.getParameter("buscarServicio");
            Servicio servicio = servicioDAO.buscarServicio(id);
            
            dispatcher = request.getRequestDispatcher("buscarServicio.jsp");
            request.setAttribute("servicio", servicio);
            List<Emple> listaEmple = servicioDAO.listarEmpleado();
            request.setAttribute("empleados", listaEmple);
        }else if("GuardarCambios".equals(action)){
            String id = request.getParameter("id");
            String cliente = request.getParameter("cliente");
            String tipoServicio = request.getParameter("tipoServicio");
            String estado = request.getParameter("estado");
            String fechaIngreso = request.getParameter("fecha_ingreso");
            String fechaSalida = request.getParameter("fecha_salida");
            String descripcion = request.getParameter("descripcion");
            String precio = request.getParameter("precio");
            String empleado = request.getParameter("empleado");
            Servicio servicio = new Servicio(id, cliente, tipoServicio, estado, fechaIngreso, fechaSalida, descripcion, precio, empleado);
            
            if(servicioDAO.actualizarServicio(servicio)){
                dispatcher = request.getRequestDispatcher("gestionServicios.jsp");
                List<Servicio> listaServicio = servicioDAO.listarServicio();
                request.setAttribute("listaServicio", listaServicio);
                List<Emple> listaEmple = servicioDAO.listarEmpleado();
                request.setAttribute("empleados", listaEmple);
                request.setAttribute("action", "1");
            }else{
                dispatcher = request.getRequestDispatcher("gestionServicios.jsp");
                List<Servicio> listaServicio = servicioDAO.listarServicio();
                request.setAttribute("listaServicio", listaServicio);
                List<Emple> listaEmple = servicioDAO.listarEmpleado();
                request.setAttribute("empleados", listaEmple);
                request.setAttribute("action", "0");
            }
            
            
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
