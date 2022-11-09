<%-- 
    Document   : cambiarContraseña
    Created on : 8/11/2022, 01:28:28 PM
    Author     : juanm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if(session.getAttribute("infoEmpleado") != null){
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cambio Contrase&ntilde;a | WebESR</title>
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
                    <img src="./resources/Electro.jpg" class="img-fluid" alt="iconElectro" id="grande" />
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
                        <div class="col mb-auto">
                            <div class="card text-center">
                                <div class="card-header">
                                    <h5>Cambio de Contrase&ntilde;a</h5>
                                </div>
                                <form action="servletEmpleado?accion=CambiarContraseña" method="POST" autocomplete="off">
                                    <div class="card-body">
                                        <input type="hidden" id="idEmpleado" name="idEmpleado" value="${infoEmpleado.getId()}" />
                                        <div class="form-row">
                                            <div class="form-group col-sm-4">
                                                <label for="currentPassword">Contraseña Actual: </label>
                                            </div>
                                            <div class="form-group col-sm-4">
                                                <input type="password" id="currentPassword" name="currentPassword" class="form-control col" required>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-sm-4">
                                                <label for="newPassword">Contraseña Nueva: </label>
                                            </div>
                                            <div class="form-group col-sm-4">
                                                <input type="password" id="newPassword" name="newPassword" class="form-control col" required>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-sm-8">
                                                <button id="btn-buscar" type="submit" class="btn btn-warning btn-outline-dark btn-block">Cambiar</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="card-footer">
                                    <c:if test="${estado==0}">
                                        <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
                                            Acción no realizada.
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>        
                                    </c:if>
                                    <c:if test="${estado==1}">
                                            <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
                                                Acción realizada con éxito.
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                    </c:if>
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