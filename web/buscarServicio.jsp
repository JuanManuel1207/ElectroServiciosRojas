<%-- 
    Document   : buscarServicio
    Created on : 21/07/2022, 10:50:10 AM
    Author     : juanm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Consulta de Servicio</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">		
        <link rel="icon" href="./resources/Logo_1.ico" type="image/ico" />
<!--        <link rel="stylesheet" href="./css/styles.css">-->
        
    </head>
    <body>
       <div class="container" id="fondo">
            
            <div class="card " id="cardPadre">
                <div class="card-header text-center" id="cardEncabezado">
                    <img src="./resources/Electro.jpg" class="img-fluid" alt="iconElectro" height="20"/>
                    <form class="form-inline position-relative d-inline-block my-2">
                        <img src="./resources/Logo.ico" class="img-fluid" alt="icon1" height="20"/>
                    </form>
                </div>
                <div class="card-body">
                    <c:if test="${servicio!=null}">
                        <ul class="list-group col-md-6">
                            <li class="list-group-item active text-center" aria-current="true"><b>n° Servicio: </b><c:out value="${servicio.id}"/></li>
                            <li class="list-group-item"><b>Tipo de Servicio: </b><c:out value="${ (servicio.tipoServicio == '1') ? 'REPARACIÓN':'REVISIÓN' }"/></li>
                            <li class="list-group-item"><b>Cliente: </b><c:out value="${servicio.cliente}"/></li>
                            <li class="list-group-item"><b>Estado: </b><c:out value="${ (servicio.estado == '1') ? 'EN PROCESO' : 'TERMINADO' }"/></li>
                            <li class="list-group-item"><b>Fecha de Ingreso: </b><c:out value="${servicio.fechaIngreso}"/></li>
                            <li class="list-group-item"><b>Fecha de Salida: </b><c:out value="${servicio.fechaSalida}"/></li>
                            <li class="list-group-item"><b>Descripci&oacute;n: </b><c:out value="${servicio.descripcion}"/></li>
                            <li class="list-group-item"><b>Precio: </b><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${servicio.precio}" /></li>
                            <c:forEach var="emple" items="${empleados}">
                                <c:if test="${emple.id==servicio.empleado}">
                                    <li class="list-group-item"><b>Empleado: </b><c:out value="${emple.empleado}"/></li>                        
                                </c:if>
                            </c:forEach> 
                        </ul>
                    </c:if>
                    <c:if test="${servicio==null}">
                        <div class="alert alert-danger" role="alert">Lo sentimos, no hemos podido encontrar el servicio.</div>
                    </c:if>
                </div>
                <div class="card-footer text-center">
                    <ul class="nav nav-tabs justify-content-center" >
                        <li class="nav-item">
                          <a class="nav-link" style="color: #bf4611" href="index.html">Inicio</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" style="color: #bf4611" data-toggle="modal" data-target="#nosotrosModal">Nosotros</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" style="color: #bf4611" data-toggle="modal" data-target="#contactoModal">Cont&aacute;ctenos</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" style="color: #bf4611" data-toggle="modal" data-target="#serviciosModal">Servicios</a>
                        </li>
                    </ul>
                </div>
                
            </div>  
           
        </div>
        
        
        <div class="modal fade" id="nosotrosModal" tabindex="-1" aria-labelledby="nosotros" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable">
              <div class="modal-content">
                <div class="modal-header bg-primary">
                  <h5 class="modal-title bi bi-people-fill" style="color: white" id="nosotros">  Nosotros</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  ...
                </div>
              </div>
            </div>
        </div>
        
        <div class="modal fade" id="contactoModal" tabindex="-1" aria-labelledby="contacto" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header bg-success">
                    <h5 class="modal-title bi bi-telephone" style="color: white" id="contacto">  Cont&aacute;ctenos</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  ...
                </div>
              </div>
            </div>
        </div>
        
        <div class="modal fade" id="serviciosModal" tabindex="-1" aria-labelledby="servicios" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header bg-warning">
                  <h5 class="modal-title bi bi-tools" id="servicios">  Servicios</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  ...
                </div>
              </div>
            </div>
        </div>
         
        
        <script src="./js/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="./js/bootstrap.min.js"></script>
    </body>
</html>
