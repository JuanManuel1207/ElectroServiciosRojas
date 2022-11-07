<%-- 
    Document   : index.jsp
    Created on : 1/11/2022, 02:46:07 PM
    Author     : juanm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ElectroServicios Rojas | WebESR</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/stylesIndex.css" type="text/css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">	
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">

        <link rel="icon" href="./resources/Logo_1.ico" type="image/ico" />
        <link rel="icon1" href="./resources/Logo.ico" type="image/ico" />
        <link rel="iconElectro" href="./resources/Electro.jpg" type="image/jpg" />


    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="w-100 col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" id="encabezado">
                    <img src="./resources/Electro.jpg" class="img-fluid" alt="iconElectro" id="grande" />
                    <img src="./resources/Logo.ico" class="img-fluid form-inline position-relative d-inline-block " alt="icon1" id="pequeña" />
                </div>
            </div>
            <div class="row">
                <div class="w-100 col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" id="encabezado">
                    <div class="card text-center form-inline position-relative d-inline-block my-2" id="login">
                        <div class="card-header" id="encabezadoCard">
                            <h3>Inicio de Sesi&oacute;n</h3>
                            <h6>M&oacute;dulo de Empleados</h6>
                        </div>
                        <form action="servletEmpleado?accion=ValidarCredenciales" method="POST" autocomplete="off">
                            <div class="card-body">
                                <div style="margin-bottom: 10px" class="input-group">
                                    <div class="input-group-prepend"><span class="input-group-text"><i class="bi bi-person-circle"></i></span></div>
                                    <input id="user" type="number" class="form-control text-center" name="user" value="" placeholder="Usuario" required>                                        
                                </div>
                                <div style="margin-bottom: 10px" class="input-group">
                                    <div class="input-group-prepend"><span class="input-group-text"><i class="bi bi-key"></i></span></div>
                                    <input id="password" type="password" class="form-control text-center" name="password" placeholder="Contrase&ntilde;a" required>
                                </div>
                                <div style="font-size:85%" >
                                    <a href=""><u>¿Olvid&oacute; su contrase&ntilde;a?</u></a>
                                </div>
                                
                            </div>
                            <div class="card-footer" id="pie1">
                                <div class="form-group">
                                    <button id="btn-login" type="submit" class="btn btn-success btn-block">Ingresar</button>
                                </div>
                                <c:if test="${estado==0}">
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            Usuario y/o Contrase&ntilde;a Incorrectas
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                </c:if>
                            </div>
                        </form>    
                    </div>
                    <div class="card text-center form-inline position-relative d-inline-block" id="consulta">
                        <div class="card-header">
                            <h3>Consultar Servicio</h3>
                            <h6>M&oacute;dulo de Clientes</h6>
                        </div>
                        <form action="servletServicio?action=Consultar" method="POST" autocomplete="off">
                                <div class="card-body">
                                    <div class="input-group">
                                        <div class="input-group-prepend"><span class="input-group-text"><i class="bi bi-gear"></i></span></div>
                                        <input id="buscarServicio" type="number" class="form-control text-center" name="buscarServicio" pattern="[0-9]*" placeholder="# Factura" required>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="form-group">
                                        <button id="btn-buscar" type="submit" class="btn btn-success btn-block">Buscar</button>
                                    </div>
                                </div>
                        </form>
                    </div>
                    <div class="w-100 col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" id="info">

                        <ul class="nav nav-tabs justify-content-center" >
                            <li class="nav-item">
                                <a class="nav-link" style="color: black" href="index.jsp" >Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" style="color: black" data-toggle="modal" data-target="#nosotrosModal">Nosotros</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" style="color: black" data-toggle="modal" data-target="#contactoModal">Cont&aacute;ctenos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" style="color: black" data-toggle="modal" data-target="#serviciosModal">Servicios</a>
                            </li>
                        </ul>
                    </div>
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
                        ElectroServicios Rojas es una microempresa familiar fundada en 2002 por la señora Aurora Cecilia Rojas.
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
                        Puedes contactarte con nosotros en nuestras lineas de atención:
                        <ul class="list-group">
                            <li class="list-group-item">E-mail: electroserviciosrojas@gmail.com</li>
                            <li class="list-group-item">Telefono: 3142673951</li>
                            <li class="list-group-item">
                                Nuestro punto de atención fisico se encuentra ubicado en la cuidad de Duitama, Boyacá: Carrera 17 #10-37
                            </li>
                        </ul>
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
                        En ElectroServicios Rojas ofrecemos, los servicios de:
                        <ul class="list-group">
                            <li class="list-group-item">Reparaci&oacute;n de electrodom&eacute;sticos.</li>
                            <li class="list-group-item">Venta de Repuestos para electrodom&eacute;sticos.</li>
                            <li class="list-group-item">Venta de Electrodom&eacute;sticos.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    </body>
</html>

