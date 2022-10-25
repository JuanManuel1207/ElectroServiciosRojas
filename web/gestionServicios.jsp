<%-- 
    Document   : gestionServicios
    Created on : 24/05/2022, 3:46:36 p. m.
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Reporte Productos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--<link rel="stylesheet" href="css/bootstrap.min.css" >-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">		
        <link rel="icon" href="./resources/Logo_1.ico" type="image/ico" />
        <link rel="icon1" href="./resources/Logo.ico" type="image/ico" />
        <link rel="iconElectro" href="./resources/Electro.jpg" type="image/jpg" />
        <link rel="iconAdmin" href="./resources/administrador.png" type="image/png" />
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/stylesMenu.css">
        <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
        
    </head>
    
    <body>
        <!-- Ignoren -->
        <div class="d-flex">
        
            <div id="menu1">
                <nav class="navbar navbar-expand-lg navbar-light border-bottom">
                    <div class="container1" id="container">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <!<!-- ssssss -->
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <div class="menu">
                                <a href="gestionEmpleados.jsp" class="d-block text-light p-3 border-0"><i class="bi bi-person-lines-fill lead mr-2"></i>
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
                        <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#gestionServiciosModal">
                    AGREGAR
                </button>
        
                <div class="form-row">
                        <div class="table-responsive" id="tablaProd">
                            <table class="table table-striped">
                                    <thead>
                                    <th>ID</th>
                                    <th>Tipo Servicio</th>
                                    <th>Cliente</th>
                                    <th>Estado</th>
                                    <th>Fecha Ingreso</th>
                                    <th>Fecha Salida</th>
                                    <th>Acciones</th>
                                    
                                    </thead>
                                    <tbody>
                                        <c:forEach var="prod" items="${listaProd}">
                                          <tr>
                                            <td><c:out value="${prod.codigo}"/></td>
                                            <td><c:out value="${prod.nombre}"/></td>
                                            <td><c:out value="${prod.cantidad}"/></td>
                                            <td><c:out value="${prod.valor}"/></td>
                                            <td><c:out value="${prod.descripcion}"/></td>
                                          </tr>
                                        </c:forEach>
                                    </tbody>
                            </table>
                        </div>
                    </div
                    <!--Gg-->
        <!-- Modal -->
                <div class="modal fade" id="gestionServiciosModal" tabindex="-1" aria-labelledby="gestionServicios" aria-hidden="true">
                 <div class="modal-dialog modal-dialog-scrollable">
                    <div class="modal-content">
                      <div class="modal-header bg-success">
                        <h5 class="modal-title" id="exampleModalLabel">Agregar Servicios</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">

                <div class="card-body">   

                        <div class="form-row">
                            <div class="form-group col-12 col-sm">
                                <label for="ID">ID</label>
                                <input type="text" id="id" name="id" class="form-control col" placeholder="Ingrese el id del producto"required>
                            </div>
                            <div class="form-group col-12 col-sm">
                                <label for="Nombre">Tipo de Servicio</label>
                                <select class="form-control" aria-label="GG" required>                            
                                    <option value="0">REPARACIÓN</option>
                                    <option value="1">REVISIÓN</option>                            
                                </select>
                            </div>                  
                        </div>

                        <div class="form-row">
                            <div class="form-group col-12 col-sm">
                                <label for="Cliente">Cliente</label>
                                <input type="text" id="cliente" name="cliente" class="form-control col" placeholder="Nombre del cliente" required>
                            </div>
                            <div class="form-group col-12 col-sm">
                                <label for="Nombre">ESTADO</label>
                                <select class="form-control" aria-label="GG" required>                            
                                    <option value="2">EN PROCESO</option>
                                    <option value="3">TERMINADO</option>                           
                                </select>
                            </div>                  
                        </div>                                     

                        <div class="form-row">
                                <div class="form-group col-12 col-sm">
                                    <label for="Valor">Fecha Ingreso</label>
                                    <input type="date" id="fecha_ingreso" name="fecha_ingreso" class="form-control col" required>
                                </div>
                                <div class="form-group col-12 col-sm">
                                    <label for="Descripcion">Fecha Salida</label>
                                    <input type="date" id="fecha_salida" name="fecha_salida" class="form-control col" required>
                                </div>
                        </div>                           
                </div>
                      </div>

                      <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">SI</button>
                      <button type="button" class="btn btn-primary">NO</button>
                      </div>               
                    </div>
                  </div>
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
