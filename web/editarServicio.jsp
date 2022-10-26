<%-- 
    Document   : editarServicio
    Created on : 2/08/2022, 09:59:24 AM
    Author     : juanm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Editar Servicios</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--<link rel="stylesheet" href="css/bootstrap.min.css" >-->
        <link rel="icon" href="./resources/Logo_1.ico" type="image/ico" />
        <link rel="icon1" href="./resources/Logo.ico" type="image/ico" />
        <link rel="iconElectro" href="./resources/Electro.jpg" type="image/jpg" />
        <link rel="iconAdmin" href="./resources/administrador.png" type="image/png" />
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/styles.css">
        <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">		
    </head>
    
    <body>
        <div class="d-flex">
        
            <div id="menu1">
                <nav class="navbar navbar-expand-lg navbar-light border-bottom">
                    <div class="container1" id="container">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
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
                <div class="container">
                    <c:forEach var="serv" items="${servicio}">
                    <form action="servletServicio?action=GuardarCambios" method="POST" autocomplete="off">
                            <div class="card">
                                <div class="card-header bg-warning">
                                    <h6><b>Editar Servicio: </b><c:out value="${serv.id}"/></h6>
                                </div>
                                <div class="card-body">
                                    <div class="form-row">
                                        <div class="form-group col-sm-4">
                                            <label for="id">ID</label>
                                            <input type="text" id="id" name="id" class="form-control col" value="<c:out value="${serv.id}"/>" readonly required>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label for="tipoServicio">Tipo de Servicio</label>
                                            <select id="tipoServicio" name="tipoServicio" class="form-control" aria-label="GG" required>                            
                                                <c:if test="${'1'==serv.tipoServicio}">
                                                    <option value="1">REPARACIÓN</option>
                                                    <option value="2">REVISIÓN</option>
                                                </c:if>
                                                <c:if test="${'1'!=serv.tipoServicio}">
                                                    <option value="2">REVISIÓN</option>
                                                    <option value="1">REPARACIÓN</option>
                                                </c:if> 
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label for="cliente">Cliente</label>
                                            <input type="text" id="cliente" name="cliente" class="form-control col" value="<c:out value="${serv.cliente}"/>" placeholder="Nombre del cliente" pattern="[a-zA-Z\s]*" required>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-sm-4">
                                            <label for="estado">Estado</label>
                                            <select id="estado" name="estado" class="form-control" aria-label="GG" required>                            
                                                <c:if test="${'1'==serv.estado}">
                                                    <option value="1">EN PROCESO</option>
                                                    <option value="2">TERMINADO</option>
                                                </c:if>
                                                <c:if test="${'1'!=serv.estado}">
                                                    <option value="2">TERMINADO</option>
                                                    <option value="1">EN PROCESO</option>
                                                </c:if>                           
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label for="fecha_ingreso">Fecha Ingreso</label>
                                            <input type="date" id="fecha_ingreso" name="fecha_ingreso" class="form-control col" value="<c:out value="${serv.fechaIngreso}"/>" readonly required>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label for="fecha_salida">Fecha Salida</label>
                                            <input type="date" id="fecha_salida" name="fecha_salida" class="form-control col" min="<c:out value="${serv.fechaIngreso}"/>" value="<c:out value="${serv.fechaSalida}"/>" required>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-sm-4">
                                            <label for="precio">Precio</label>
                                            <input type="number" id="precio" name="precio" class="form-control"  min="0" max="10000000" value="<c:out value="${serv.precio}"/>" pattern="[0-9]*" placeholder="0 - 10.000.000" required>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label for="empleado">Empleado</label>
                                            <select id="empleado" name="empleado" class="form-control" aria-label="GG" required> 
                                                <c:forEach var="emple" items="${empleados}">
                                                    <c:if test="${emple.id==serv.empleado}">
                                                        <option value="<c:out value="${emple.id}"/>" selected><c:out value="${emple.empleado}"/></option>
                                                    </c:if>
                                                    <c:if test="${emple.id!=serv.empleado}">
                                                        <option value="<c:out value="${emple.id}"/>"><c:out value="${emple.empleado}"/></option>
                                                    </c:if>
                                                </c:forEach>
                                               
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label for="descripcion">Descripci&oacute;n</label>
                                            <input type="text" class="form-control" id="descripcion" name="descripcion" value="<c:out value="${serv.descripcion}"/>" rows="2"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <button type="submit" class="btn btn-secondary">GUARDAR</button>
                                    <a href="servletServicio?action" class="btn btn-primary">CANCELAR</a>
                                </div>
                            </div>       
                    </form>
                  </c:forEach> 
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
