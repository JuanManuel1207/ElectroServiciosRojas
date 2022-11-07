/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import com.lowagie.text.DocumentException;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Empleado;
import modelo.EmpleadoDAO;
import modelo.Servicio;
import modelo.ServicioDAO;
import pdf.FacturaServicios;
import pdf.ServiciosPDF;

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
        EmpleadoDAO empleadoDAO = new EmpleadoDAO();
        
        String action;
        
        RequestDispatcher dispatcher = null;
        request.setAttribute("dateNow", LocalDate.now());
        action = request.getParameter("action");
        

        if (action==null || action.isEmpty()) {
            dispatcher = request.getRequestDispatcher("gestionServicios.jsp");
            List<Servicio> listaServicio = servicioDAO.listarServicio();
            List<Empleado> listaEmple = empleadoDAO.listaEmpleados();
            request.setAttribute("listaServicio", listaServicio);
            request.setAttribute("empleados", listaEmple);
        } else if("Agregar".equals(action)){
           // String id = request.getParameter("id");
            String cliente = request.getParameter("cliente");
            String tipoServicio = request.getParameter("tipoServicio");
            String estado = request.getParameter("estado");
            String fechaIngreso = request.getParameter("fecha_ingreso");
            String fechaSalida = request.getParameter("fecha_salida");
            String descripcion = request.getParameter("descripcion");
            String precio = request.getParameter("precio");
            String empleado = request.getParameter("empleado");
            Servicio servicio = new Servicio("", cliente, tipoServicio, estado, fechaIngreso, fechaSalida, descripcion, precio, empleado);
            if(servicioDAO.ingresarServicio(servicio)){
                dispatcher = request.getRequestDispatcher("gestionServicios.jsp");
                List<Servicio> listaServicio = servicioDAO.listarServicio();
                request.setAttribute("listaServicio", listaServicio);
                List<Empleado> listaEmple = empleadoDAO.listaEmpleados();
                request.setAttribute("empleados", listaEmple);
                request.setAttribute("action", "1");
         
            }else{
                dispatcher = request.getRequestDispatcher("gestionServicios.jsp");
                List<Servicio> listaServicio = servicioDAO.listarServicio();
                request.setAttribute("listaServicio", listaServicio);
                List<Empleado> listaEmple = empleadoDAO.listaEmpleados();
                request.setAttribute("empleados", listaEmple);
                request.setAttribute("action", "0");
            }
        } else if ("Eliminar".equals(action)) {
            int servicio = Integer.parseInt(request.getParameter("servicio"));
            
            if(servicioDAO.eliminarServicio(servicio)){
                dispatcher = request.getRequestDispatcher("gestionServicios.jsp");
                List<Servicio> listaServicio = servicioDAO.listarServicio();
                request.setAttribute("listaServicio", listaServicio);
                List<Empleado> listaEmple = empleadoDAO.listaEmpleados();
                request.setAttribute("empleados", listaEmple);
                request.setAttribute("action", "1");
            }else{
                dispatcher = request.getRequestDispatcher("gestionServicios.jsp");
                List<Servicio> listaServicio = servicioDAO.listarServicio();
                request.setAttribute("listaServicio", listaServicio);
                List<Empleado> listaEmple = empleadoDAO.listaEmpleados();
                request.setAttribute("empleados", listaEmple);
                request.setAttribute("action", "0");
            }
            
            
        }else if ("Editar".equals(action)) {
            System.out.println("editar");
            int id = Integer.parseInt(request.getParameter("servicio"));
            dispatcher = request.getRequestDispatcher("editarServicio.jsp");
            List<Servicio> listaServicio = new ArrayList<>();
            listaServicio.add(servicioDAO.buscarServicio(id));
            request.setAttribute("servicio", listaServicio);
            List<Empleado> listaEmple = empleadoDAO.listaEmpleados();
            request.setAttribute("empleados", listaEmple);
        }else if("Consultar".equals(action)){
            int id = Integer.parseInt(request.getParameter("buscarServicio"));
            Servicio servicio = servicioDAO.buscarServicio(id);
            
            dispatcher = request.getRequestDispatcher("buscarServicio.jsp");
            request.setAttribute("servicio", servicio);
            List<Empleado> listaEmple = empleadoDAO.listaEmpleados();
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
                List<Empleado> listaEmple = empleadoDAO.listaEmpleados();
                request.setAttribute("empleados", listaEmple);
                request.setAttribute("action", "1");
            }else{
                dispatcher = request.getRequestDispatcher("gestionServicios.jsp");
                List<Servicio> listaServicio = servicioDAO.listarServicio();
                request.setAttribute("listaServicio", listaServicio);
                List<Empleado> listaEmple = empleadoDAO.listaEmpleados();
                request.setAttribute("empleados", listaEmple);
                request.setAttribute("action", "0");
            }
            
            
        }else if("ReporteServicios".equals(action)){
            String fechaIngreso = request.getParameter("fecha_ingreso");
            dispatcher = request.getRequestDispatcher("reporteServicios.jsp");
            List<Servicio> listaServicio = servicioDAO.listarServicioFecha(fechaIngreso);
            List<Empleado> listaEmple = empleadoDAO.listaEmpleados();
            Double totalServicios = servicioDAO.totalServicios(fechaIngreso);
            request.setAttribute("listaServicio", listaServicio);
            request.setAttribute("empleados", listaEmple);
            request.setAttribute("totalServicios", totalServicios );
            request.setAttribute("fecha_ingreso", fechaIngreso );            
        }else if("generarReporte".equals(action)){
            String date = request.getParameter("date");
            DateFormat dateFormat = new SimpleDateFormat("hh:mm aaa");
            String nameFile = dateFormat.format(new Date());
            String variable1 = "Content-Disposition";
            String variable2 = "attachment; filename=ReporteServicios_"+date+"_"+nameFile+".pdf";
            response.setHeader(variable1, variable2);
            ServiciosPDF serviciosPDF = new ServiciosPDF(servicioDAO.listarServicioFecha(date));
            try {
                serviciosPDF.export(response);
            } catch (DocumentException ex) {
                Logger.getLogger(servletServicio.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("servletServicio?action=ReporteServicios").forward(request, response);
        }else if("Imprimir".equals(action)){
                int id = Integer.parseInt(request.getParameter("servicio"));
                Servicio servicio = servicioDAO.buscarServicio(id);
                String variable1 = "Content-Disposition";
                String variable2 = "attachment; filename=FacturaServicio_"+servicio.getCliente()+"_"+servicio.getFechaIngreso()+".pdf";
                response.setHeader(variable1, variable2);
                FacturaServicios facturaServicios = new FacturaServicios(servicio);
                try {
                    facturaServicios.export(response);

                } catch (DocumentException ex) {
                    Logger.getLogger(servletServicio.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                request.getRequestDispatcher("servletServicio").forward(request, response);
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
