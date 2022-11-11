/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import config.ConexionBD;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Asus
 */
public class EmpleadoDAO {
    
    Connection conexion;
    
    public EmpleadoDAO(){
        ConexionBD con = new ConexionBD();
        conexion=con.getConexion();
        
    }
    public List<Empleado> listaEmpleados(){
       PreparedStatement ps;
       ResultSet rs;
       
       List<Empleado> lista = new ArrayList<>();
        try {
            ps=conexion.prepareStatement("SELECT * FROM empleado");
            rs = ps.executeQuery();
            
            while(rs.next()){
                
                String id= rs.getString("id");
                String cedula= rs.getString("cedula");
                String nombre= rs.getString("nombre");
                String fechaNacimiento= ""+rs.getDate("fechaNacimiento");
                String correo= rs.getString("correo");
                String celular= rs.getString("celular");
                String salario= rs.getString("salario");
                String tipoEmpleado= rs.getString("tipoEmpleado");
                Empleado empleado = new Empleado(id, cedula, nombre, fechaNacimiento, correo, celular, salario, tipoEmpleado);
                
                lista.add(empleado);
            }
            return lista;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }
   
    public Empleado buscarUser(String user){
       PreparedStatement ps;
       ResultSet rs;
       
       Empleado empleado = null;
        try {
            ps=conexion.prepareStatement("SELECT * FROM empleado WHERE usuario=?");
            ps.setString(1, user);
            rs = ps.executeQuery();
            
            while(rs.next()){
                
                String id= rs.getString("id");
                String cedula= rs.getString("cedula");
                String nombre= rs.getString("nombre");
                String fechaNacimiento= ""+rs.getDate("fechaNacimiento");
                String correo= rs.getString("correo");
                String celular= rs.getString("celular");
                String salario= rs.getString("salario");
                String tipoEmpleado= rs.getString("tipoEmpleado");
                
                empleado = new Empleado(id, cedula, nombre, fechaNacimiento, correo, celular, salario, tipoEmpleado);
                
            }
            return empleado;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }
    
    public Empleado buscarEmpleados(String _id){
       PreparedStatement ps;
       ResultSet rs;
       
       Empleado empleado = null;
        try {
            ps=conexion.prepareStatement("SELECT * FROM empleado WHERE id=?");
            ps.setString(1, _id);
            rs = ps.executeQuery();
            
            while(rs.next()){
                
                String id= rs.getString("id");
                String cedula= rs.getString("cedula");
                String nombre= rs.getString("nombre");
                String fechaNacimiento= ""+rs.getDate("fechaNacimiento");
                String correo= rs.getString("correo");
                String celular= rs.getString("celular");
                String salario= rs.getString("salario");
                String tipoEmpleado= rs.getString("tipoEmpleado");
                
                empleado = new Empleado(id, cedula, nombre, fechaNacimiento, correo, celular, salario, tipoEmpleado);
                
            }
            return empleado;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }
    
    public boolean insertar(Empleado empleado){
       PreparedStatement ps;
       
        try {
            ps=conexion.prepareStatement("INSERT INTO empleado (cedula, nombre, fechaNacimiento, correo, celular, salario, tipoEmpleado, usuario, contraseña) VALUES (?,?,?,?,?,?,?,?,?)");
        //    ps.setString(1, empleado.getId());
            ps.setString(1, empleado.getCedula());
            ps.setString(2, empleado.getNombre());
            ps.setDate(3, java.sql.Date.valueOf(empleado.getFechaNacimiento()));
            ps.setString(4, empleado.getCorreo());
            ps.setString(5, empleado.getCelular());
            ps.setString(6, empleado.getSalario());
            ps.setString(7, empleado.getTipoEmpleado());
            ps.setString(8, empleado.getCedula());
            ps.setString(9, hashPassword(empleado.getCedula()));
            ps.execute();
            
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
    
    public boolean validarCredenciales(String user, String pass){
       String aux = hashPassword(pass);
       PreparedStatement ps;
       ResultSet rs;
       try{       
           ps = conexion.prepareStatement("select usuario,contraseña from empleado where usuario=?");
           ps.setString(1, user);
           rs = ps.executeQuery();
           
           while(rs.next()){
               if( rs.getString("contraseña").equals(aux) && rs.getString("usuario").equals(user)){
                   return true;
               }
               return false;
           }
           return false;
       }catch(SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
    
    private String randomPass(){
        Random rnd = new Random();
        int pass = rnd.nextInt(9999999);
        return String.format("%07d", pass);
    }
    
    public boolean existeMail(String mail){
       PreparedStatement ps;
       ResultSet rs;
       try{       
           ps = conexion.prepareStatement("select * from empleado where correo=?");
           ps.setString(1, mail);
           rs = ps.executeQuery();
           
           while(rs.next()){
               if( rs.getString("correo").equals(mail)){
                   String generatePass = randomPass();
                   if(cambiarContraseña(generatePass, rs.getString("id"))){
                        return enviarMail(mail, generatePass);
                   }
                    return false;
               }
               return false;
           }
           return false;
       }catch(SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
    
    public boolean comparePassword(String currentpass, String id){
       String aux = hashPassword(currentpass);
       PreparedStatement ps;
       ResultSet rs;
       try{       
           ps = conexion.prepareStatement("select contraseña from empleado where id=?");
           ps.setString(1, id);
           rs = ps.executeQuery();
           
           while(rs.next()){
               if( rs.getString("contraseña").equals(aux)){
                   return true;
               }
               return false;
           }
           return false;
       }catch(SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
    public boolean cambiarContraseña(String newPass, String id){
        String aux = hashPassword(newPass);
        PreparedStatement ps;
        try {
            ps=conexion.prepareStatement("UPDATE empleado SET contraseña=? WHERE id=?");
            ps.setString(1, aux);
            ps.setString(2, id);
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
    
    public boolean enviarMail(String mail, String generatePass){
        boolean status = false;
        String emailFrom = "electroserviciosrojas.soporte@gmail.com";
        String passFrom = "mnexgshlfrmsyoju";
        String titulo = "Solicitud Recuperación de Contraseña WebESR";
        String mensaje = "Su contraseña ha sido restablecida correctamente, la nueva contraseña es: "+generatePass;
        
        try {
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.put("mail.smtp.socketFactory.port", "587");
            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication(emailFrom, passFrom);
                }
            });
            
            Message mess = new MimeMessage(session);
            
            mess.setFrom(new InternetAddress(emailFrom));            
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(mail));
            mess.setSubject(titulo);
            mess.setText(mensaje);
            
            Transport.send(mess);
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return status;
    }
    
    public String hashPassword(String password){
        
        String generatedPassword = null;
        try 
        {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());

            byte[] bytes = md.digest();

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            generatedPassword = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return generatedPassword;
      
    }

    public boolean actualizar(Empleado empleado){
       PreparedStatement ps;
       
        try {
            ps=conexion.prepareStatement("UPDATE empleado SET cedula=?, nombre=?, fechaNacimiento=?, correo=?, celular=?, salario=?, tipoEmpleado=? WHERE id=?");
            ps.setString(1, empleado.getCedula());
            ps.setString(2, empleado.getNombre());
            ps.setString(3, empleado.getFechaNacimiento());
            ps.setString(4, empleado.getCorreo());
            ps.setString(5, empleado.getCelular());
            ps.setString(6, empleado.getSalario());
            ps.setString(7, empleado.getTipoEmpleado());
            ps.setString(8, empleado.getId());
            ps.execute();
            
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }

    public boolean eliminar(String _id){
        System.out.println(_id);
       PreparedStatement ps;
       
        try {
            ps=conexion.prepareStatement("DELETE FROM empleado WHERE id=?");
            ps.setString(1, _id);
            ps.execute();
            
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
}

