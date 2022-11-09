<%-- 
    Document   : recuperarContraseña
    Created on : 8/11/2022, 11:28:45 AM
    Author     : juanm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Recuperar Contrase&ntilde;a</title>
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
                
                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                    <div id="contenido">
                        <div>
                            <h1>

                            </h1>
                            <a href="index.jsp" type="button" class="btn btn-danger form-inline position-relative d-inline-block my-2" id="cerrar"><i class="bi bi-box-arrow-right lead mr-2"></i></a>
                            <h1>

                            </h1>
                        </div>
                        <div class="col-sm-12">
                            <div class="card col-md-12">
                            <div class="card-header">
                                <h5>M&oacute;dulo de Recuperaci&oacute;n de Contrase&ntilde;a</h5>
                            </div>
                        <form action="servletEmpleado?accion=Recuperar" method="POST" autocomplete="off">
                            <div class="card-body">
                                <div class="input-group">
                                    <div class="input-group-prepend"><span class="input-group-text"><i class="bi bi-envelope"></i></span></div>
                                    <input id="enviarMail" type="text" class="form-control text-center" name="enviarMail" placeholder="Ingrese la dirección de email con la que fue registrado." pattern="[^@\s]+@[^@\s]+\.[^@\s]+" required>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="form-group">
                                    <button id="btn-enviarMail" type="submit" class="btn btn-warning btn-block">Enviar</button>
                                </div>
                                <c:if test="${estado==0}">
                                    <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
                                        El Email ingresado no ha sido encontrado
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>        
                                </c:if>
                                <c:if test="${estado==1}">
                                        <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
                                            Email generado con éxito.
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                </c:if>
                            </div>
                        </form>    
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

