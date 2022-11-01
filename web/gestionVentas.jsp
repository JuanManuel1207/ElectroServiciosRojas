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
        <title>Gesti&oacute;n Ventas</title>
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
                            <!-- comment<h6 class="form-inline position-relative d-inline-block my-2" style="color: #263580">ElectroServicios Rojas @ ElectroServicios Rojas @ ElectroServicios Rojas @ ElectroServicios</h6> -->
                            <a href="index.html" type="button" class="btn btn-danger form-inline position-relative d-inline-block my-2" id="cerrar"><i class="bi bi-box-arrow-right lead mr-2"></i></a>
                            <h1>

                            </h1>
                        </div>
                        <div class="d-flex">
                            <div class="col-sm-4">
                                <div class="card">
                                    <form action="servletVentas?accion=BuscarProducto" method="POST">
                                        <div class="card-body">                            
                                            <div class="form-group">
                                                <label>DATOS PRODUCTO: </label>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-12 col-sm">
                                                    <input type="number" min="0" name="codigoProducto" value="${product.getProductId()}" class="form-control" placeholder="idProducto" required>
                                                </div>
                                                <div class="form-group col-12 col-sm">
                                                    <button type="submit" name="accion" value="Buscar" class="btn btn-block btn-outline-info ">Buscar</button>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-12 col-sm">                           
                                                    <input typ="text" name="datosProducto" value="${product.getProductName()}" class="form-control" placeholder="datosProducto" readonly>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-12 col-sm">
                                                    <input type="text" name="tipoProducto" value="${product.getProductType()}"class="form-control" placeholder="tipoProducto" readonly>                                                                   
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-12 col-sm">                           
                                                    <input type="text" name="precio" value="${product.getPrice()}" class="form-control " placeholder="$/0.00" readonly>
                                                </div>
                                                <div class="form-group col-12 col-sm"> 
                                                    <input type="text" name="stockDisponible" value="${product.getStock()}"class="form-control" placeholder="stock" readonly>                                                                   
                                                </div>
                                            </div>
                                    </form>
                                    <form action="servletVentas?accion=Agregar" method="POST">
                                        <div class="form-row">
                                            <div class="form-group col-12 col-sm">
                                                <input type="date" name="fecha" class="form-control" value="${dateNow}" readonly>                                       
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-12 col-sm">
                                                <input type="text" name="nombreCliente" class="form-control " placeholder="Cliente" required>
                                            </div>
                                            <div class="form-group col-12 col-sm">
                                                <input type="number" name="cantidad" class="form-control " min="1" max="100" placeholder="0" required>                                    
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-12 col-sm">
                                                <button type="submit" name="accion" value="Agregar"  class="btn btn-block btn-outline-info">AGREGAR</button>
                                            </div>
                                        </div>
                                                </form>                                        
                                        </div>                                            
                                </div>
                            </div>
                                                        
            <div class="col-sm-8">
                <div class="card">
                    <div class="card-body">                                                
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
                                                    <a href="servletVentas?accion=Eliminar&venta=${list.idVenta}"><i class="bi bi-trash3-fill"></i></a>
                                                </td>
                                              </tr>
                                            </c:forEach>
                                        </tbody>
                                </table>
                            </div>                            
                        </div>
                        <div class="card-footer d-flex">
                            <div class="row">
                                <div class="form-group col-12 col-sm">
                                    <a href="servletVentas?accion=generarVenta" class="btn btn-block btn-success">Generar Venta</a>
                                </div>
                                <div class="form-group col-12 col-sm">
                                    <a href="servletVentas?accion=Cancelar" class="btn btn-block btn-danger">Cancelar Venta</a>
                                </div>
                                <div class="form-group col-12 col-sm">
                                    <input type="text" class="form-control" value="$ ${totalPagar}"name="txtTotal">   
                                </div>
                            </div>                                                            
                        </div> 
                            <div class="container">
                                    <c:if test="${action==1}">
                                        <div class="col-12 alert alert-success alert-dismissible fade show" role="alert">
                                            Acción realizada con éxito.
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                    </c:if>
                                    <c:if test="${action==0}">
                                        <div class="col-12 alert alert-danger alert-dismissible fade show" role="alert">
                                            Acción no realizada.
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                    </c:if>                                
                                    <c:if test="${action==2}">
                                        <div class="col-12 alert alert-danger alert-dismissible fade show" role="alert">
                                            Producto no encontrado. Revisar que ID exista.
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                    </c:if>
                                    <c:if test="${action==3}">
                                        <div class="col-12 alert alert-danger alert-dismissible fade show" role="alert">
                                            Falta idProducto.
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                    </c:if>
                                
                                </div>
                    </div>
                    
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