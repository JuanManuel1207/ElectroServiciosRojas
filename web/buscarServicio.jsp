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
                            <div class="card col-xs-12">
                            <div class="card-header">
                                <h5>M&oacute;dulo de consulta de Servicios</h5>
                            </div>
                            <div class="card-body">
                                <c:if test="${servicio!=null}">
                                    <ul class="list-group">
                                        <li class="list-group-item active text-center" aria-current="true"><b>n° Servicio: </b><c:out value="${servicio.id}"/></li>
                                        <ul class="list-group list-group-horizontal">
                                            <li class="list-group-item col-sm-4"><b>Tipo de Servicio: </b><c:out value="${ (servicio.tipoServicio == '1') ? 'REPARACIÓN':'REVISIÓN' }"/></li>
                                            <li class="list-group-item col-sm-4"><b>Cliente: </b><c:out value="${servicio.cliente}"/></li>
                                            <li class="list-group-item col-sm-4"><b>Estado: </b><c:out value="${ (servicio.estado == '1') ? 'EN PROCESO' : 'TERMINADO' }"/></li>
                                        </ul>
                                        <ul class="list-group list-group-horizontal">
                                            <li class="list-group-item col-sm-4"><b>Fecha de Ingreso: </b><c:out value="${servicio.fechaIngreso}"/></li>
                                            <li class="list-group-item col-sm-4"><b>Fecha de Salida: </b><c:out value="${servicio.fechaSalida}"/></li>
                                            <li class="list-group-item col-sm-4"><b>Precio: </b><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${servicio.precio}" /></li>
                                        </ul>
                                        <ul class="list-group list-group-horizontal">
                                            <c:forEach var="emple" items="${empleados}">
                                                <c:if test="${emple.id==servicio.empleado}">
                                                    <li class="list-group-item col-sm-4"><b>Empleado: </b><c:out value="${emple.nombre}"/></li>                        
                                                </c:if>
                                            </c:forEach>
                                            <li class="list-group-item col-sm-8"><b>Descripci&oacute;n: </b><c:out value="${servicio.descripcion}"/></li>  
                                        </ul>
                                    </ul>
                                </c:if>
                                <c:if test="${servicio==null}">
                                    <div class="alert alert-danger text-center" role="alert">Lo sentimos, no hemos podido encontrar el servicio.</div>
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
