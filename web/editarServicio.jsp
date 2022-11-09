<%-- 
    Document   : editarServicio
    Created on : 2/08/2022, 09:59:24 AM
    Author     : juanm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%
    if(session.getAttribute("infoEmpleado") != null){
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Editar Servicios</title>
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
                <div class="w-100 col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center " id="encabezado">
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
                            <h1>

                            </h1>
                            <!-- comment<h6 class="form-inline position-relative d-inline-block my-2" style="color: #263580">ElectroServicios Rojas @ ElectroServicios Rojas @ ElectroServicios Rojas @ ElectroServicios</h6> -->
                            <a href="index.jsp" type="button" class="btn btn-danger form-inline position-relative d-inline-block my-2" id="cerrar"><i class="bi bi-box-arrow-right lead mr-2"></i></a>
                            <h1>

                            </h1>
                        </div>
                        <div class="card">
                            <c:forEach var="serv" items="${servicio}">
                                <form action="servletServicio?action=GuardarCambios" method="POST" autocomplete="off">
                                    <div class="card-header">
                                        <h5><b>Editar Servicio: </b><c:out value="${serv.id}"/></h5>
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
                                                        <c:if test="${emple.tipoEmpleado==2}">
                                                            <c:if test="${emple.id==serv.empleado}">
                                                                <option value="<c:out value="${emple.id}"/>" selected><c:out value="${emple.nombre}"/></option>
                                                            </c:if>
                                                            <c:if test="${emple.id!=serv.empleado}">
                                                                <option value="<c:out value="${emple.id}"/>"><c:out value="${emple.nombre}"/></option>
                                                            </c:if>
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
                                </form>
                            </c:forEach> 
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>



    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script>
	$('#deleteServicio').on('show.bs.modal', function(e) {
            $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
            $('.debug-url').html('Delete URL: <strong>' + $(this).find('.btn-ok').attr('href') + '</strong>');
	});
    </script>
</body>
</html>
<%
    } else {
        response.sendRedirect("index.jsp");
    }
%>