<%-- 
    Document   : gestionVentas
    Created on : 30/05/2022, 3:02:07 p. m.
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Gestion_Ventas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--<link rel="stylesheet" href="css/bootstrap.min.css" >-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
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
        
        <div class="d-flex">
            <div class="col-sm-4">
                <div class="card">
                    <form action="servletVentas?accion=BuscarProducto" method="POST">
                        <div class="card-body">                            
                            <div class="form-group">
                                <label>DATOS PRODUCTO: </label>
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">                                    
                                    <input type="text" name="codigoProducto" value="${product.getProductId()}" class="form-control" placeholder="idProducto" >
                                    <button type="submit" name="accion" value="Buscar" class="btn btn-outline-info ">Buscar</button>
                                </div>                            
                                <div class="col-sm-7">
                                    <input typ="text" name="datosProducto" value="${product.getProductName()}" class="form-control" placeholder="datosProducto" readonly>
                                </div>
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="tipoProducto" value="${product.getProductType()}"class="form-control" placeholder="tipoProducto" readonly>                                                                   
                                </div>                            
                                <div class="col-sm-4 d-flex">
                                    <input type="text" name="precio" value="${product.getPrice()}" class="form-control " placeholder="$/0.00" readonly>
                                </div>
                                <div class="col-sm-3 d-flex">
                                    <input type="text" name="stockDisponible" value="${product.getStock()}"class="form-control" placeholder="stock" readonly>                                                                   
                                </div>                                
                            </div>
                    </form>
                                <form action="servletVentas?accion=Agregar" method="POST">
                                    
                                    <div class="form-group d-flex">
                                        <div class="col-sm-6 d-flex">
                                            <input type="date" name="fecha" class="form-control ">
                                        </div>                            
                                        <div class="col-sm-4 d-flex">
                                            <input type="text" name="nombreCliente" class="form-control " placeholder="Cliente">
                                        </div>
                                        <div class="col-sm-3 d-flex">
                                            <input type="number" name="cantidad" class="form-control " min="1" max="100" placeholder="0">                                    
                                        </div>                                
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm">
                                            <button type="submit" name="accion" value="Agregar"  class="btn btn-outline-info">AGREGAR</button>
                                        </div>
                                    </div>
                                </form>                                        
                        </div>                                            
                </div>
                
            </div>
            <div class="col-sm-8">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex col-sm-6 ml-auto">
                            <label>Número Serie</label>
                            <input type="text" name="numSerie" class="form-control">                    
                        </div>
                        
                        <div class="form-row">
                            <div class="table-responsive" id="tablaProd">
                                <table class="table table-striped">
                                        <thead>
                                            <th>Nro</th>
                                            <th>ID Producto</th>
                                            <th>Nombre Producto</th>
                                            <th>TipoProducto</th>
                                            <th>Precio</th>
                                            <th>Cantidad</th>
                                            <th>Fecha</th>
                                            <th>Total</th>
                                            <th>Acciones</th>

                                        </thead>
                                        <tbody>
                                            <c:forEach var="list" items="${listVentas}">
                                              <tr>
                                                <td><c:out value="${list.idVenta}"/></td>
                                                <td><c:out value="${list.idProducto}"/></td>
                                                <td><c:out value="${list.productName}"/></td>
                                                <td><c:out value="${list.productType}"/></td>
                                                <td><c:out value="${list.priceProduct}"/></td>                                                
                                                <td><c:out value="${list.cantidad}"/></td>
                                                <td><c:out value="${list.fecha}"/></td>
                                                <td><c:out value="${list.precioTotal}"/></td>
                                                <td>
                                                     <a href="servletVentas?accion=Actualizar&servicio=${prod.productId}"><i class="bi bi-pencil-square"></i></a>  |  <a href="servletVentas?accion=Eliminar&producto=${prod.productId}"><i class="bi bi-trash3-fill"></i></a>
                                                </td>
                                              </tr>
                                            </c:forEach>
                                        </tbody>
                                </table>
                            </div>                            
                        </div>
                        <div class="card-footer d-flex">
                            <div class="col-sm-6">
                                <button type="submit" class="btn btn-success">Generar Venta</button>
                                <button type="submit" class="btn btn-danger">Cancelar Venta</button>
                            </div>                                                            
                            <div class="col-sm-4 ml-auto">                             
                                <input type="text" class="form-control" value="$ ${totalPagar}"name="txtTotal">
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

