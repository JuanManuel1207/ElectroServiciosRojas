<%-- 
    Document   : reporteVentas
    Created on : 28/05/2022, 08:01:07 PM
    Author     : juanm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%
    if(session.getAttribute("infoEmpleado") != null){
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Reporte Ventas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="css/stylesMenu.css" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">	
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">

        <link rel="icon" href="./resources/Logo_1.ico" type="image/ico" />
        
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="w-100 col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" id="encabezado">
                    <img src="./resources/Electro.jpg" class="img-fluid text-center" alt="iconElectro" id="grande" />
                    <img src="./resources/Logo.ico" class="img-fluid form-inline position-relative d-inline-block my-2 " alt="icon1" id="pequeña" />

                </div>
            </div>
            <div class="row">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" id="menu-p">
                    <nav class="navbar navbar-expand-lg navbar-light border-bottom">
                        <div class="container">
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>


                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <div id="menus">
                                    <c:if test="${infoEmpleado.getTipoEmpleado()==1}">
                                        <a href="servletEmpleado" class="d-block text-light p-3 border-0"><i class="bi bi-person-lines-fill lead mr-2"></i>
                                        Gestión Empleados</a>
                                    </c:if>
                                    <a href="servletServicio" class="d-block text-light p-3 border-0"><i class="bi bi-hdd-rack lead mr-2"></i>
                                        Gestión Servicios</a>
                                    <a href="servletVentas" class="d-block text-light p-3 border-0"><i class="bi bi-cart4 lead mr-2"></i>
                                        Gestión Ventas</a>
                                    <a href="servletProducto" class="d-block text-light p-3 border-0"><i class="bi bi-box-seam lead mr-2"></i>
                                        Gestión Productos</a>
                                    <a href="reporteServicios.jsp" class="d-block text-light p-3 border-0"> <i class="bi bi-card-list lead mr-2"></i>
                                        Reportes</a>
                                    <a href="cambiarContraseña.jsp" class="d-block text-light p-3 border-0"> <i class="bi bi-key lead mr-2"></i>
                                        Cambiar Contraseña</a>
                                    <a href="#" class="d-block text-light p-3 border-0"></a>
                                    <a href="#" class="d-block text-light p-3 border-0"></a><!-- comment -->
                                    <a href="#" class="d-block text-light p-3 border-0"></a>
                                    <a href="#" class="d-block text-light p-3 border-0"></a>
                                    <a href="#" class="d-block text-light p-3 border-0"></a><!-- comment -->
                                    <a href="#" class="d-block text-light p-3 border-0"></a>
                                    <a href="#" class="d-block text-light p-3 border-0"></a>
                                </div>
                            </div>
                        </div>

                    </nav>
                </div>
                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                    <div id="contenido">
                        <div>
                            <br>
                            <a href="servletEmpleado?accion=cerrarSesion" type="button" class="btn btn-danger form-inline position-relative d-inline-block my-2" id="cerrar"><i class="bi bi-box-arrow-right lead mr-2"></i>Cerrar Sesi&oacute;n</a>
                        </div>
                        <ul class="nav nav-tabs justify-content-center">
                            <li class="nav-item">
                                <a class="nav-link" href="reporteVentas.jsp" style="color: #fff">Ventas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="reporteServicios.jsp" style="color: #fff">Servicios</a>
                            </li>
                        </ul>
                        <div class="col mb-auto">
                            <div class="card text-center">
                                <div class="card-header">
                                    <h5>Reporte de Ventas</h5>
                                </div>
                                <form action="servletVentas?accion=ReporteVentas" method="POST" autocomplete="off">
                                    <div class="card-body">
                                        <div class="form-row">
                                            <div class="form-group col-sm-3">
                                                <label for="fechaVenta">Fecha Venta: </label>
                                            </div>
                                            <div class="form-group col-sm-4">
                                                <input type="date" id="fechaVenta" name="fechaVenta" class="form-control col" required>
                                            </div>
                                            <div class="form-group col-sm-4">
                                                <button id="btn-buscar" type="submit" class="btn btn-warning btn-outline-dark btn-block">Buscar</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="card-footer">
                                    <div class="container">
                                        <c:if test="${listaVentas.isEmpty() || totalVentas == 0.0}">
                                            <div class="alert alert-danger" role="alert">Lo sentimos, no hay ventas que mostrar.</div>
                                        </c:if>
                                        <c:if test="${listaVentas.isEmpty() == false}">
                                            <div class="form-row">
                                                <div class="form-group col-sm-2">
                                                    <h6>Total Ventas: <b>$<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${totalVentas}" /></b></h6>
                                                </div>
                                                <div class="form-group col-sm-3">
                                                    <a href="servletVentas?accion=generarReporte&date=<c:out value="${fechaVenta}"/>" class="btn btn-success">Generar Reporte</a>
                                                </div>
                                            </div>
                                            <div class="table-responsive">
                                                <table id="tableServicios" class="table table-bordered table-striped table-hover">
                                                     <thead>
                                                        <th>Id Venta</th>                                
                                                        <th>Cliente</th>
                                                        <th>Fecha de Venta</th>
                                                        <th>Valor total</th>    
                                                        <th>Acciones</th>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="ventas" items="${listaVentas}">
                                                        <tr>
                                                            <td><c:out value="${ventas.idVenta}"/></td>
                                                            <td><c:out value="${ventas.cliente}"/></td>
                                                            <td><c:out value="${ventas.fecha}"/></td>
                                                            <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${ventas.priceProduct}" /></td>
                                                            <td>
                                                                <a href="servletVentas?accion=Imprimir&venta=${ventas.idVenta}" class="bi bi-printer"></a>
                                                            </td>
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
        </div>



    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</body>
</html>
<%
    } else {
        response.sendRedirect("index.jsp");
    }
%>