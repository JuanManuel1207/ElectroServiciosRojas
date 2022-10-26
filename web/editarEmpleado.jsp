<%-- 
    Document   : editarEmpleado
    Created on : 11/10/2022, 5:18:16 p. m.
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Gestion empleados</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/stylesMenu.css" type="text/css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">	
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">

        <link rel="icon" href="./resources/Logo_1.ico" type="image/ico" />
        <link rel="icon1" href="./resources/Logo.ico" type="image/ico" />
        <link rel="iconElectro" href="./resources/Electro.jpg" type="image/jpg" />
        <link rel="iconAdmin" href="./resources/administrador.png" type="image/png" />
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="w-100 col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center " id="encabezado">
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
                                    <a href="servletEmpleado?accion" class="d-block text-light p-3 border-0"><i class="bi bi-person-lines-fill lead mr-2"></i>
                                        Gestión Empleados</a>
                                    <a href="gestionServicios.jsp" class="d-block text-light p-3 border-0"><i class="bi bi-hdd-rack lead mr-2"></i>
                                        Gestión Servicios</a>
                                    <a href="gestionVentas.jsp" class="d-block text-light p-3 border-0"><i class="bi bi-cart4 lead mr-2"></i>
                                        Gestión Ventas</a>
                                    <a href="gestionProductos.jsp" class="d-block text-light p-3 border-0"><i class="bi bi-box-seam lead mr-2"></i>
                                        Gestión Productos</a>
                                    <a href="reporteProductos.jsp" class="d-block text-light p-3 border-0"> <i class="bi bi-card-list lead mr-2"></i>
                                        Reporte</a>
                                    
                                </div>
                            </div>


                        </div>

                    </nav>
                </div>
                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                    <div id="contenido">
                        <h1>

                        </h1>
                        <form action="servletEmpleado?accion=Guardar" method="POST" autocomplete="off">
                            <div class="card">
                                <div class="card-header bg-warning">
                                    <h6><b>Actualizar empleado </b></h6>
                                </div>
                                <div class="card-body">
                                    <div class="form-row">
                                        <div class="form-group col-sm-4">
                                            <label for="id">Id</label>
                                            <input type="number" id="id" name="id" class="form-control col" value="<c:out value="${empleado.id}"/>" readonly required>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label for="cedula">Cedula</label>
                                            <input id="cedula" type="number" pattern="[0-9]*" class="form-control text-center" name="cedula" value="<c:out value="${empleado.cedula}"/>" required>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label for="nombre">Nombre</label>
                                            <input id="nombre" type="text" class="form-control text-center" name="nombre" pattern="[a-zA-z]*" value="<c:out value="${empleado.nombre}"/>" required>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-sm-4">
                                            <label for="salario">Salario</label>
                                            <input id="salario" type="number" class="form-control text-center" name="salario" value="<c:out value="${empleado.salario}"/>" required>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label for="correo">E-mail</label>
                                            <input id="correo" type="email" class="form-control text-center" name="correo" value="<c:out value="${empleado.correo}"/>" placeholder="Correo electronico" required>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label for="celular">Telefono de contacto</label>
                                            <input id="celular" type="number" pattern="[0-9]*" class="form-control text-center" name="celular" value="<c:out value="${empleado.celular}"/>" placeholder="Telefono de contacto" required>
                                        </div>
                                    </div>
                                    <div class="form-row">

                                        <div class="form-group col-sm-4">
                                            <label for="tipoEmpleado">Tipo empleado</label>
                                            <select id="tipoEmpleado" name="tipoEmpleado" class="form-control" required>                            
                                                <c:if test="${'1'==empleado.tipoEmpleado}">
                                                    <option value="1">Administrador</option>
                                                    <option value="2">Empleado</option> 
                                                </c:if>
                                                <c:if test="${'1'!=empleado.tipoEmpleado}">
                                                    <option value="2">Empleado</option>
                                                    <option value="1">Administrador</option>
                                                </c:if>                         
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-8">
                                            <label for="fechaNacimiento">Fecha de Nacimiento</label>
                                            <input type="date" id="fechaNacimiento" name="fechaNacimiento" class="form-control col" value="<c:out value="${empleado.fechaNacimiento}"/>" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <button type="submit" class="btn btn-secondary">GUARDAR</button>
                                    <a href="servletEmpleado?action" class="btn btn-primary">CANCELAR</a>
                                </div>
                            </div>       
                        </form>

                    </div>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </body>
</html>