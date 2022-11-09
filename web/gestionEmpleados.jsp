<%-- 
    Document   : gestionEmpleados.jsp
    Created on : 24/05/2022, 10:21:27 a. m.
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%
    if(session.getAttribute("infoEmpleado") != null){
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Gesti&oacute;n Empleados</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/stylesMenu.css" type="text/css" />
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
                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#añadirEmpleado"><i class="bi bi-person-plus-fill lead mr-2"></i>Crear empleado</button>
                            <!-- comment<h6 class="form-inline position-relative d-inline-block my-2" style="color: #263580">ElectroServicios Rojas @ ElectroServicios Rojas @ ElectroServicios Rojas @ ElectroServicios</h6> -->
                            <a href="servletEmpleado?accion=cerrarSesion" type="button" class="btn btn-danger form-inline position-relative d-inline-block my-2" id="cerrar"><i class="bi bi-box-arrow-right lead mr-2"></i>Cerrar Sesi&oacute;n</a>
                        </div>
                        <div class="tab-content" id="myTabContent">
                            <div class="card">
                                <div class="card-header">
                                    <h4>Lista de empleados</h4>
                                </div>
                                <div class="card-body">
                                    <c:if test="${listaEmpleados.isEmpty()}">
                                        <div class="alert alert-danger" role="alert">No existen empleados.</div>
                                    </c:if>
                                    <c:if test="${listaEmpleados.isEmpty()==false}">
                                        <div class="table-responsive">
                                            <table id="userList" class="table table-bordered table-hover table-striped">
                                                <thead class="text-center">
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">C.C.</th>
                                                        <th scope="col">Nombre</th>
                                                        <th scope="col">Fecha Nacimiento</th>
                                                        <th scope="col">E-mail</th>
                                                        <th scope="col">Celular</th>
                                                        <th scope="col">Salario</th>
                                                        <th scope="col">Tipo</th>
                                                        <th scope="col">Accion</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="emp" items="${listaEmpleados}">
                                                        <tr class="text-center">
                                                            <td><c:out value="${emp.id}"/></td>
                                                            <td><c:out value="${emp.cedula}"/></td>
                                                            <td><c:out value="${emp.nombre}"/></td>
                                                            <td><c:out value="${emp.fechaNacimiento}"/></td>
                                                            <td><c:out value="${emp.correo}"/></td>
                                                            <td><c:out value="${emp.celular}"/></td>
                                                            <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${emp.salario}" /></td>                                                           
                                                            <td><c:out value="${ (emp.tipoEmpleado == '1') ? 'ADMINISTRADOR':'EMPLEADO' }"/></td>
                                                            <td>
                                                                <a data-toggle="" href="servletEmpleado?accion=Editar&id=${emp.id}"<i class="bi bi-pencil-square"></i></a>
                                                                <a href="#" data-href="servletEmpleado?accion=Eliminar&id=${emp.id}" class="bi bi-trash3-fill" data-toggle="modal" data-target="#eliminar"></a> 
                                                                
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </c:if>

                                </div>
                                <div class="container">
                                    <c:if test="${action==1}">
                                        <div class=" col-12 alert alert-success alert-dismissible fade show" role="alert">
                                            Acci&oacute;n realizada con &eacute;xito.
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                    </c:if>
                                    <c:if test="${action==0}">
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                          Acci&oacute;n no realizada.
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <form action="servletEmpleado?accion=Agregar" method="POST" autocomplete="off">

                        <div class="modal fade" tabindex="-1" aria-hidden="true" id="añadirEmpleado">
                            <div class="modal-dialog modal-dialog-scrollable">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3>Nuevo empleado</h3>
                                        <button class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="card-body">
                                                <div class="form-row">
                                                <!--    <div class="form-group col-sm-4">
                                                        <label for="id">Id</label>
                                                        <input type="text" id="id" name="id" class="form-control col" readonly>
                                                    </div>
                                                -->    
                                                    <div class="form-group col-sm-5">
                                                        <label for="cedula">Cedula</label>
                                                        <input id="cedula" type="number" pattern="[0-9]*" class="form-control text-center" name="cedula" placeholder="n° de cedula" required>
                                                    </div>
                                                    <div class="form-group col-sm-7">
                                                        <label for="nombre">Nombre</label>
                                                        <input id="nombre" type="text" class="form-control text-center" name="nombre" pattern="[a-zA-Z\s]*" placeholder="Nombres completos"required>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="salario">Salario</label>
                                                        <input id="salario" type="number" class="form-control text-center" name="salario" placeholder="Salario" required>
                                                    </div>
                                                    <div class="form-group col-sm-4">
                                                        <label for="correo">E-mail</label>
                                                        <input id="correo" type="email" class="form-control text-center" name="correo" placeholder="Correo" pattern="[^@\s]+@[^@\s]+\.[^@\s]+"required>
                                                    </div>
                                                    <div class="form-group col-sm-4">
                                                        <label for="celular">Telefono</label>
                                                        <input id="celular" type="number" pattern="[0-9]*" class="form-control text-center" name="celular"  placeholder="# de contacto" required>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="tipoEmpleado">Tipo</label>
                                                        <select id="tipoEmpleado" name="tipoEmpleado" class="form-control" required> 
                                                            <option value="1">Administrador</option>
                                                            <option value="2">Empleado</option>         
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <label for="fechaNacimiento">Fecha de Nacimiento</label>
                                                        <input type="date" id="fechaNacimiento" min="1900-01-01" max="2022-10-24" name="fechaNacimiento" class="form-control col" required>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>  
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-success">Añadir</button>
                                        <button class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
            </div>

            <div class="modal fade" id="eliminar" tabindex="-1" aria-labelledby="delEmpleado" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header bg-danger">
                            <h5 class="modal-title text-center" style="color: white"  id="delEmpleado">Eliminar Empleado</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="color: white">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <p>¿Est&aacute; seguro de que desea eliminar este Empleado?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <a class="btn btn-danger btn-ok">Eliminar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script>
	$('#eliminar').on('show.bs.modal', function(e) {
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
