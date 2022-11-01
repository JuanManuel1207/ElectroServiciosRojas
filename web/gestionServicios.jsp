<%-- 
    Document   : gestionServicios
    Created on : 24/05/2022, 3:46:36 p. m.
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Gesti&oacute;n Servicios</title>
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
                                    <a href="servletEmpleado" class="d-block text-light p-3 border-0"><i class="bi bi-person-lines-fill lead mr-2"></i>
                                        Gestión Empleados</a>
                                    <a href="servletServicio" class="d-block text-light p-3 border-0"><i class="bi bi-hdd-rack lead mr-2"></i>
                                        Gestión Servicios</a>
                                    <a href="servletVentas" class="d-block text-light p-3 border-0"><i class="bi bi-cart4 lead mr-2"></i>
                                        Gestión Ventas</a>
                                    <a href="servletProducto" class="d-block text-light p-3 border-0"><i class="bi bi-box-seam lead mr-2"></i>
                                        Gestión Productos</a>
                                    <a href="reporteServicios.jsp" class="d-block text-light p-3 border-0"> <i class="bi bi-card-list lead mr-2"></i>
                                        Reportes</a>
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
                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#gestionServiciosModal"><i class="bi bi-hdd-rack lead mr-2"></i>
                                Agregar Servicio
                            </button>
                            <!-- comment<h6 class="form-inline position-relative d-inline-block my-2" style="color: #263580">ElectroServicios Rojas @ ElectroServicios Rojas @ ElectroServicios Rojas @ ElectroServicios</h6> -->
                            <a href="index.html" type="button" class="btn btn-danger form-inline position-relative d-inline-block my-2" id="cerrar"><i class="bi bi-box-arrow-right lead mr-2"></i></a>
                            <h1>

                            </h1>
                        </div>
                        <div class="tab-content" id="myTabContent">
                            <div class="card">
                                <div class="card-header">
                                    <h4>Lista de Servicios</h4>
                                </div>
                                <div class="card-body">
                                    <c:if test="${listaServicio.isEmpty()}">
                                        <div class="alert alert-danger" role="alert">Lo sentimos, no hay servicios que mostrar.</div>
                                    </c:if>
                                    <c:if test="${listaServicio.isEmpty() == false}">
                                        <div class="table-responsive">
                                            <table id="tableServicios" class="table table-bordered table-hover table-striped">
                                                <thead class="text-center">
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Servicio</th>
                                                        <th scope="col">Cliente</th>
                                                        <th scope="col">Estado</th>
                                                        <th scope="col">Ingreso</th>
                                                        <th scope="col">Salida</th>
                                                        <th scope="col">Descripci&oacute;n</th>
                                                        <th scope="col">Valor</th>
                                                        <th scope="col">Empleado</th>
                                                        <th scope="col">Acciones</th>
                                                    </tr>
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
                                                                    <td><c:out value="${emple.nombre}"/></td>
                                                                </c:if>
                                                            </c:forEach> 
                                                            <td>
                                                                <a href="servletServicio?action=Editar&servicio=${prod.id}" class="bi bi-pencil-square"></a> |
                                                                <a href="#" data-href="servletServicio?action=Eliminar&servicio=${prod.id}" class="bi bi-trash3-fill" data-toggle="modal" data-target="#deleteServicio"></a> 
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
                    <!-- Modal Agregar -->
                    <form action="servletServicio?action=Agregar" method="POST" autocomplete="off"> 
                        <div class="modal fade" id="gestionServiciosModal" tabindex="-1" aria-labelledby="gestionServicios" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-scrollable">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Agregar Servicios</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-row">
                                    <!--        <div class="form-group col-12 col-sm">
                                                <label for="id">ID</label>
                                                <input type="text" id="id" name="id" class="form-control col" pattern="[0-9]*" placeholder="Ingrese el id del producto" value="${idValue}" readonly required>
                                            </div> -->
                                            <div class="form-group col-12 col-sm">
                                                <label for="cliente">Cliente</label>
                                                <input type="text" id="cliente" name="cliente" class="form-control col" placeholder="Nombre del cliente" pattern="[a-zA-Z\s]*" required>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-12 col-sm">
                                                <label for="tipoServicio">Tipo de Servicio</label>
                                                <select id="tipoServicio" name="tipoServicio" class="form-control" aria-label="GG" required>                            
                                                    <option value="1">REPARACIÓN</option>
                                                    <option value="2">REVISIÓN</option>                            
                                                </select>
                                            </div>
                                            <div class="form-group col-12 col-sm">
                                                <label for="estado">Estado</label>
                                                <select id="estado" name="estado" class="form-control" aria-label="GG" required>                            
                                                    <option value="1">EN PROCESO</option>
                                                    <option value="2">TERMINADO</option>                           
                                                </select>
                                            </div>                  
                                        </div>                                     
                                        <div class="form-row">
                                            <div class="form-group col-12 col-sm">
                                                <label for="fecha_ingreso">Fecha Ingreso</label>
                                                <input type="date" id="fecha_ingreso" name="fecha_ingreso" class="form-control col" value="${dateNow}" readonly required>
                                            </div>
                                            <div class="form-group col-12 col-sm">
                                                <label for="fecha_salida">Fecha Salida</label>
                                                <input type="date" id="fecha_salida" name="fecha_salida" class="form-control col" value="${dateNow}" min="${dateNow}" required>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-12 col-sm">
                                                <label for="precio">Precio</label>
                                                <input type="number" id="precio" name="precio" class="form-control"  min="0" max="10000000" pattern="[0-9]*" placeholder="0 - 10.000.000" required>
                                            </div>
                                            <div class="form-group col-12 col-sm">
                                                <label for="empleado">Empleado</label>
                                                <select id="empleado" name="empleado" class="form-control" aria-label="GG" required>                            
                                                    <c:forEach var="emple" items="${empleados}">
                                                        <c:if test="${emple.tipoEmpleado==2}">
                                                            <option value="<c:out value="${emple.id}"/>"><c:out value="${emple.nombre}"/></option>                                                            
                                                        </c:if>
                                                    </c:forEach> 
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-12 col-sm">
                                                <label for="descripcion">Descripci&oacute;n</label>
                                                <textarea class="form-control" id="descripcion" name="descripcion" rows="3"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-success">A&ntilde;adir</button>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                    </div>               
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- modal eliminar -->
                    <div class="modal fade" id="deleteServicio" tabindex="-1" aria-labelledby="delServicio" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-danger">
                                    <h5 class="modal-title text-center" style="color: white"  id="delServicio">Eliminar Servicio</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="color: white">&times;</span></button>
                                </div>
                                <div class="modal-body">
                                    <p>¿Est&aacute; seguro de que desea eliminar este Servicio?</p>
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
