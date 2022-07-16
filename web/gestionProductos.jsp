<%-- 
    Document   : gestionProductos
    Created on : 30/05/2022, 3:58:26 p. m.
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Gestion_Productos</title>
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
        <link rel="stylesheet" href="./css/styles.css">
        <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
        
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
                        
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <div class="menu">
                                <a href="gestionEmpleados.jsp" class="d-block text-light p-3 border-0"><i class="bi bi-person-lines-fill lead mr-2"></i>
                                    Gestión Empleados</a>
                                <a href="gestionServicios.jsp" class="d-block text-light p-3 border-0"><i class="bi bi-hdd-rack lead mr-2"></i>
                                    Gestión Servicios</a>
                                <a href="servletVentas" class="d-block text-light p-3 border-0"><i class="bi bi-cart4 lead mr-2"></i>
                                    Gestión Ventas</a>
                                <a href="servletProducto" class="d-block text-light p-3 border-0"><i class="bi bi-box-seam lead mr-2"></i>
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
            <div id="content" class="w-100 h-100">

                <div class="container">
                <div class="mx-auto col-sm-12 main-section" id="myTab" role="tablist">
                    <div>
                        <h1>
                            
                        </h1>
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#añadirProducto">Nuevo producto</button>
                        <h1>
                         
                        </h1>
                    </div>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="list" role="tabpanel" aria-labelledby="list-tab">
                            <div class="card">
                                <div class="card-header">
                                    <h4>Lista de productos</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="userList" class="table table-bordered table-hover table-striped">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th scope="col">ID Producto</th>
                                                    <th scope="col">Nombre</th>
                                                    <th scope="col">Tipo</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">Precio c/u</th>
                                                    <th scope="col">Marca</th>
                                                    <th scope="col">Modelo</th>
                                                    <th scope="col">Accion</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="prod" items="${listaProductos}"> 
                                                    <tr>
                                                        <td><c:out value="${prod.productId}"/></td>
                                                        <td><c:out value="${prod.productName}"/></td>
                                                        <td><c:out value="${prod.productType}"/></td>
                                                        <td><c:out value="${prod.stock}"/></td>
                                                        <td><c:out value="${prod.price}"/></td>
                                                        <td><c:out value="${prod.brand}"/></td>
                                                        <td><c:out value="${prod.model}"/></td>   
                                                        <td> <a data-toggle="modal" data-target="#añadirProducto"><i class="bi bi-pencil-square"></i></a>  |  <a href="servletProducto?accion=Eliminar&producto=${prod.productId}"><i class="bi bi-trash3-fill"></i></a>
                                                        </td>
                                                    </tr>
                                                    
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>                        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                    <!-- modal añadir -->
                    <div class="modal" tabindex="-1" aria-hidden="true" id="añadirProducto">
                        <div class="modal-dialog modal-dialog-scrollable">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3>Nuevo producto</h3>
                                    <button class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <form action="servletProducto?accion=Insertar" method="POST" autocomplete="off">
                                    <div class="card-body">
                                        <div style="margin-bottom: 10px" class="input-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                  <span class="input-group-text" id="inputGroup-sizing-default">ID producto</span>
                                                </div>
                                                <input id="idProducto" type="text" class="form-control text-center" name="idProducto" value="" required>                                       
                                            </div>                                            
                                        </div>
                                        <div style="margin-bottom: 10px" class="input-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                  <span class="input-group-text" id="inputGroup-sizing-default">Nombre</span>
                                                </div>
                                                <input id="name" type="text" class="form-control text-center" name="name" value="" required>                                       
                                            </div>                                            
                                        </div>
                                        <div style="margin-bottom: 10px" class="input-group">
                                            <div class="input-group">
                                                <label for="select" class=" col-form-label text-dark">Tipo de producto</label>
                                                <div class="col-sm-8">
                                                    <div class="input-group selection">
                                                        <select class="form-control" id="select" name="select">
                                                            <option value="0" >Electrodomestico</option>
                                                            <option value="1">Repuesto</option>
                                                </select> 
                                                    </div>
                                                </div>                                
                                            </div>                                            
                                        </div>
                                        <div style="margin-bottom: 10px" class="input-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                  <span class="input-group-text" id="inputGroup-sizing-default">Cantidad</span>
                                                </div>
                                                <input id="cantidad" type="text" class="form-control text-center" name="cantidad" value="" required>                                       
                                            </div>                                            
                                        </div>
                                        <div style="margin-bottom: 10px" class="input-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend"><span class="input-group-text"><i class="bi bi-coin"></i></span></div>
                                                <input id="precio" type="text" class="form-control text-center" name="precio" value="" placeholder="Precio c/u" required>
                                            </div>
                                        </div>
                                        <div style="margin-bottom: 10px" class="input-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend"><span class="input-group-text"><i class="bi bi-caret-up-square"></i></span></div>
                                                <input id="marca" type="text" class="form-control text-center" name="marca" value="" placeholder="Marca" required>
                                            </div>
                                        </div>
                                        
                                        <div style="margin-bottom: 10px" class="input-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend"><span class="input-group-text"><i class="bi bi-card-text"></i></span></div>
                                                <input id="modelo" type="text" class="form-control text-center" name="modelo" value="" placeholder="Modelo" required>
                                            </div>
                                        </div>

                                    </div>
                                        <div class="modal-footer">
                                    <button type="submit" id="btnAdd" class="btn btn-success">Añadir</button>
                                    <button class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                </div>
                                    </form>  
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <div class="modal" tabindex="-1" aria-hidden="true" id="eliminarProducto">
                        <div class="modal-dialog modal-dialog-scrollable">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3>
                                        Eliminar producto
                                    </h3> 
                                    <button class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    
                                    <h5>
                                        ¿Esta seguro de realizar esta acción?
                                    </h5> 
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-success">Si</button>
                                    
                                    <button class="btn btn-danger" data-dismiss="modal">No</button>
                                </div>
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
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script><!-- comment -->
    <script type="text/javascript">
	$(document).ready(function() {
	        //Asegurate que el id que le diste a la tabla sea igual al texto despues del simbolo #
	        $('#userList').DataTable();
	    } );
	</script>    
    <script type="text/javascript">
        $(function() {
            $('#datepicker').datepicker();
        });
    </script>
</head>
    </body>
</html>

