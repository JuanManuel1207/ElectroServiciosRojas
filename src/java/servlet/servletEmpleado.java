package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
               // String id= request.getParameter("id");
                String cedula= request.getParameter("cedula");
                String nombre= request.getParameter("nombre");
                String fechaNacimiento= request.getParameter("fechaNacimiento");
                String correo= request.getParameter("correo");
                String celular= request.getParameter("celular");
                String salario= request.getParameter("salario");
                String tipoEmpleado= request.getParameter("tipoEmpleado");
                
                Empleado empleado = new Empleado("",cedula, nombre, fechaNacimiento, correo, celular, salario, tipoEmpleado);
                
                if(empleadoDAO.insertar(empleado)){
                    dispatcher = request.getRequestDispatcher("gestionEmpleados.jsp");
                    List<Empleado> listaEmpleados = empleadoDAO.listaEmpleados();
                    request.setAttribute("listaEmpleados", listaEmpleados);
                    request.setAttribute("action", "1");
                }else{
                    dispatcher = request.getRequestDispatcher("gestionEmpleados.jsp");
                    List<Empleado> listaEmpleados = empleadoDAO.listaEmpleados();
                    request.setAttribute("listaEmpleados", listaEmpleados);
                    request.setAttribute("action", "0");
                }
            }else if("Eliminar".equals(accion)){
                String empleado = request.getParameter("id");
                if(empleadoDAO.eliminar(empleado)){
                    dispatcher = request.getRequestDispatcher("gestionEmpleados.jsp");
                    List<Empleado> listaEmpleados = empleadoDAO.listaEmpleados();
                    request.setAttribute("listaEmpleados", listaEmpleados);
                    request.setAttribute("action", "1");
                }else{
                    dispatcher = request.getRequestDispatcher("gestionEmpleados.jsp");
                    List<Empleado> listaEmpleados = empleadoDAO.listaEmpleados();
                    request.setAttribute("listaEmpleados", listaEmpleados);
                    request.setAttribute("action", "0");
                }
            }else if("Editar".equals(accion)){
                String id = request.getParameter("id");
                dispatcher = request.getRequestDispatcher("editarEmpleado.jsp");
                Empleado empleado = empleadoDAO.buscarEmpleados(id);
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
                Empleado empleado = new Empleado(id,cedula, nombre, fechaNacimiento, correo, celular, salario, tipoEmpleado);
                
                if(empleadoDAO.actualizar(empleado)){
                    dispatcher = request.getRequestDispatcher("gestionEmpleados.jsp");
                    List<Empleado> listaEmpleados = empleadoDAO.listaEmpleados();
                    request.setAttribute("listaEmpleados", listaEmpleados);
                    request.setAttribute("action", "1");
                }else{
                    dispatcher = request.getRequestDispatcher("gestionEmpleados.jsp");
                    List<Empleado> listaEmpleados = empleadoDAO.listaEmpleados();
                    request.setAttribute("listaEmpleados", listaEmpleados);
                    request.setAttribute("action", "0");
                }        
            }else if("ValidarCredenciales".equals(accion)){
                String user = request.getParameter("user");
                String pass = request.getParameter("password");
                HttpSession session;
                if(empleadoDAO.validarCredenciales(user, pass)){
                    session = request.getSession();
                    session.setAttribute("infoEmpleado", empleadoDAO.buscarUser(user));
                    dispatcher = request.getRequestDispatcher("menu.jsp");
                    //request.setAttribute("infoEmpleado", empleadoDAO.buscarUser(user));
                }else{
                    dispatcher = request.getRequestDispatcher("index.jsp");
                    request.setAttribute("estado", 0);
                }
            }else if("cerrarSesion".equals(accion)){
                HttpSession session = request.getSession();
                session.setAttribute("infoEmpleado", null);
                session.invalidate();
                dispatcher = request.getRequestDispatcher("index.jsp");
            }else if("Recuperar".equals(accion)){
                String mail =request.getParameter("enviarMail");
                dispatcher = request.getRequestDispatcher("recuperarContraseña.jsp");
                if(empleadoDAO.existeMail(mail)){
                    request.setAttribute("estado",1);    
                }else{
                    request.setAttribute("estado",0);
                }
                
            }else if("CambiarContraseña".equals(accion)){
                String idEmpleado = request.getParameter("idEmpleado");
                String currentPass = request.getParameter("currentPassword");
                String newPassword = request.getParameter("newPassword");
                dispatcher = request.getRequestDispatcher("cambiarContraseña.jsp");
                if(empleadoDAO.comparePassword(currentPass, idEmpleado)){
                    empleadoDAO.cambiarContraseña(newPassword, idEmpleado);
                    request.setAttribute("estado",1);    
                }else{
                    request.setAttribute("estado",0);
                }
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
