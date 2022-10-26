<%-- 
    Document   : reporte
    Created on : 28/05/2022, 07:42:07 PM
    Author     : juanm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Reporte Servicios</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--<link rel="stylesheet" href="css/bootstrap.min.css" >-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">		
        <link rel="icon" href="./resources/Logo_1.ico" type="image/ico" />
        <link rel="icon1" href="./resources/Logo.ico" type="image/ico" />
        <link rel="iconElectro" href="./resources/Electro.jpg" type="image/jpg" />
        <link rel="iconAdmin" href="./resources/administrador.png" type="image/png" />
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/styles.css">
        <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
        
    </head>
    
    <body>
        <!-- Ignoren -->
        <div class="d-flex">
        
            <div id="menu1">
                <nav class="navbar navbar-expand-lg navbar-light border-bottom">
                    <div class="container1" id="container">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <!-- Siu -->
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <div class="menu">
                                <a href="gestionEmpleados.jsp" class="d-block text-light p-3 border-0"><i class="bi bi-person-lines-fill lead mr-2"></i>
                                    Gestión Empleados</a>
                                <a href="servletServicio" class="d-block text-light p-3 border-0"><i class="bi bi-hdd-rack lead mr-2"></i>
                                    Gestión Servicios</a>
                                <a href="servletVentas" class="d-block text-light p-3 border-0"><i class="bi bi-cart4 lead mr-2"></i>
                                    Gestión Ventas</a>
                                <a href="servletProducto" class="d-block text-light p-3 border-0"><i class="bi bi-box-seam lead mr-2"></i>
                                    Gestión Productos</a>
                                <a href="reporteProductos.jsp" class="d-block text-light p-3 border-0"> <i class="bi bi-card-list lead mr-2"></i>
                                    Reporte</a>
                            </div>
                        </div>
                        

                    </div>
                    
                </nav>
            </div>

        <div class="w-100">

        <!-- Encabezado-->
            <div class="w-100">
                            <img src="./resources/Electro.jpg" class="img-fluid" alt="iconElectro" height="20"/>
                            <form class="form-inline position-relative d-inline-block my-2">
                                <img src="./resources/Logo.ico" class="img-fluid" alt="icon1" height="20"/>
                            </form>
                            <form class="form-inline position-relative d-inline-block my-2">
                            <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                              <li class="nav-item dropdown">
                                <a class="nav-link text-dark dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  <img src="./resources/administrador.png" class="img-fluid rounded-circle avatar mr-2"
                                  alt="iconAdmin" />
                                Administrador
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                  <a class="dropdown-item" href="#">Mi perfil</a>
                                  <a class="dropdown-item" href="#">Cerrar sesión</a>
                                </div>
                              </li>
                            </ul>
                            </form>
                        
                    
              
            
            </div>
         
        
        
        <!-- Contenido Pagina -->
            <div id="content" class="w-100">

                <ul class="nav nav-tabs justify-content-center">
                    <li class="nav-item">
                        <a class="nav-link" href="reporteServicios.jsp">Servicios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="servletReporte">Ventas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="reporteProductos.jsp">Productos</a>
                    </li>
                </ul>
                
               
                
                <div class="col mb-auto">
                            <div class="card text-center" id="card2">
                                <div class="card-header">
                                    <h5>Reporte de Servicios</h5>
                                </div>
                                <form action="servletServicio?action=ReporteServicios" method="POST" autocomplete="off">
                                    <div class="card-body">
                                        <div class="form-row">
                                            <div class="form-group col-sm-3">
                                                <label for="fecha_ingreso">Fecha Ingreso: </label>
                                            </div>
                                            <div class="form-group col-sm-4">
                                                <input type="date" id="fecha_ingreso" name="fecha_ingreso" class="form-control col" required>
                                            </div>
                                            <div class="form-group col-sm-4">
                                                <button id="btn-buscar" type="submit" class="btn btn-warning btn-outline-dark btn-block">Buscar</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                    <div class="card-footer">
                                        <div class="container">
                                            <c:if test="${listaServicio.isEmpty() || totalServicios == 0.0}">
                                                <div class="alert alert-danger" role="alert">Lo sentimos, no hay servicios que mostrar.</div>
                                            </c:if>
                                            <c:if test="${listaServicio.isEmpty() == false}">
                                                <div class="form-row">
                                                    <div class="form-group col-sm-2">
                                                        <h6>Total Servicios: <b>$<c:out value="${totalServicios}"/></b></h6>
                                                    </div>
                                                    <div class="form-group col-sm-2">
                                                        <a href="servletServicio?action=generarReporte&date=<c:out value="${fecha_ingreso}"/>" class="btn btn-success">Generar Reporte</a>
                                                    </div>
                                                </div>
                                                <div class="table-responsive">
                                                    <table id="tableServicios" class="table table-bordered table-striped table-hover">
                                                        <thead class="text-center">
                                                            <th>ID</th>
                                                            <th>Tipo Servicio</th>
                                                            <th>Cliente</th>
                                                            <th>Estado</th>
                                                            <th>Ingreso</th>
                                                            <th>Salida</th>
                                                            <th>Descripci&oacute;n</th>
                                                            <th>Precio</th>
                                                            <th>Empleado</th>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="prod" items="${listaServicio}">
                                                                <tr class="text-center">
                                                                    <td><c:out value="${prod.id}"/></td>
                                                                    <td><c:out value="${ (prod.tipoServicio == '1') ? 'REPARACIÓN':'REVISIÓN' }"/></td>
                                                                    <td><c:out value="${prod.cliente}"/></td>
                                                                    <td><c:out value="${ (prod.estado == '1') ? 'EN PROCESO' : 'TERMINADO' }"/></td>
                                                                    <td><c:out value="${prod.fechaIngreso}"/></td>
                                                                    <td><c:out value="${prod.fechaSalida}"/></td>
                                                                    <td><c:out value="${prod.descripcion}"/></td>
                                                                    <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${prod.precio}" /></td>
                                                                    <c:forEach var="emple" items="${empleados}">
                                                                        <c:if test="${emple.id==prod.empleado}">
                                                                            <td><c:out value="${emple.empleado}"/></td>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </tr>
                                                            </c:forEach>       
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </c:if>                        
                                        </div>
                                    </div>
                            </div>
                        </div>
           
                
            </div>
        </div>
    </div>
        
        
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js" integrity="sha256-R4pqcOYV8lt7snxMQO/HSbVCFRPMdrhAFMH+vr9giYI=" crossorigin="anonymous"></script>
        
    </body>
</html>
