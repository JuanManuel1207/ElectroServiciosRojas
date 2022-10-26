package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Empleado;
import modelo.EmpleadoDAO;

@WebServlet(name = "servletEmpleado", urlPatterns = {"/servletEmpleado"})
public class servletEmpleado extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            EmpleadoDAO empleadoDAO = new EmpleadoDAO();
            String accion;
            RequestDispatcher dispatcher = null;
            
            accion = request.getParameter("accion");
            
            if(accion == null || accion.isEmpty()){
                dispatcher = request.getRequestDispatcher("gestionEmpleados.jsp");
                List<Empleado> listaEmpleados = empleadoDAO.listaEmpleados();
                request.setAttribute("listaEmpleados", listaEmpleados);
            } else if("Agregar".equals(accion)){
                String id= request.getParameter("id");
                String cedula= request.getParameter("cedula");
                String nombre= request.getParameter("nombre");
                String fechaNacimiento= request.getParameter("fechaNacimiento");
                String correo= request.getParameter("correo");
                String celular= request.getParameter("celular");
                String salario= request.getParameter("salario");
                String tipoEmpleado= request.getParameter("tipoEmpleado");
                if ("1".equals(tipoEmpleado)) {
                    Empleado empleado = new Empleado(id, cedula, nombre, fechaNacimiento, correo, celular, salario, "Administrador");
                    empleadoDAO.insertar(empleado);
                    System.out.println(empleado.getTipoEmpleado()+"*****");
                }else if ("2".equals(tipoEmpleado)) {
                    Empleado empleado = new Empleado(id, cedula, nombre, fechaNacimiento, correo, celular, salario, "Empleado");
                    empleadoDAO.insertar(empleado);
                }
                
                dispatcher = request.getRequestDispatcher("gestionEmpleados.jsp");
                List<Empleado> listaEmpleados = empleadoDAO.listaEmpleados();
                request.setAttribute("listaEmpleados", listaEmpleados);
                
            }else if("Eliminar".equals(accion)){
                System.out.println("LLEGA");
                String empleado = request.getParameter("id");
                System.out.println("jdsajs: "+empleado);
                if(empleadoDAO.eliminar(empleado)){
                    dispatcher = request.getRequestDispatcher("gestionEmpleados.jsp");
                    List<Empleado> listaEmpleados = empleadoDAO.listaEmpleados();
                    request.setAttribute("listaEmpleados", listaEmpleados);
                    
                }else{
                    dispatcher = request.getRequestDispatcher("gestionEmpleados.jsp");
                    List<Empleado> listaEmpleados = empleadoDAO.listaEmpleados();
                    request.setAttribute("listaEmpleados", listaEmpleados);
                }
            }else if("Editar".equals(accion)){
                String id = request.getParameter("id");
                System.out.println(id);
                dispatcher = request.getRequestDispatcher("editarEmpleado.jsp");
                Empleado empleado = empleadoDAO.buscarEmpleados(id);
                System.out.println(empleado);
                request.setAttribute("empleado", empleado);
                
            }else if("Guardar".equals(accion)){
                String id= request.getParameter("id");
                String cedula= request.getParameter("cedula");
                String nombre= request.getParameter("nombre");
                String fechaNacimiento= request.getParameter("fechaNacimiento");
                String correo= request.getParameter("correo");
                String celular= request.getParameter("celular");
                String salario= request.getParameter("salario");
                String tipoEmpleado= request.getParameter("tipoEmpleado");
                if ("1".equals(tipoEmpleado)) {
                    Empleado empleado = new Empleado(id, cedula, nombre, fechaNacimiento, correo, celular, salario, "Administrador");
                    empleadoDAO.actualizar(empleado);
                }else if ("2".equals(tipoEmpleado)) {
                    Empleado empleado = new Empleado(id, cedula, nombre, fechaNacimiento, correo, celular, salario, "Empleado");
                    empleadoDAO.actualizar(empleado);
                }
                
                dispatcher = request.getRequestDispatcher("gestionEmpleados.jsp");
                List<Empleado> listaEmpleados = empleadoDAO.listaEmpleados();
                request.setAttribute("listaEmpleados", listaEmpleados);
                
            }
            dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
