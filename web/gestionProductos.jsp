<%-- 
    Document   : gestionProductos
    Created on : 30/05/2022, 3:58:26 p. m.
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if(session.getAttribute("infoEmpleado") != null){
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gesti&oacute;n Productos</title>
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
                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#añadirProducto"><i class="bi bi-box-seam lead mr-2"></i>Nuevo producto</button>
                            <a href="servletEmpleado?accion=cerrarSesion" type="button" class="btn btn-danger form-inline position-relative d-inline-block my-2" id="cerrar"><i class="bi bi-box-arrow-right lead mr-2"></i>Cerrar Sesi&oacute;n</a>
                        </div>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="list" role="tabpanel" aria-labelledby="list-tab">
                                <div class="card">
                                    <div class="card-header">
                                        <h4>Lista de productos</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="productsList" class="table table-bordered table-hover table-striped">
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
                                                            <td> <a href="servletProducto?accion=Actualizar&servicio=${prod.productId}"><i class="bi bi-pencil-square"></i></a>  |  <a href="servletProducto?accion=Eliminar&producto=${prod.productId}"><i class="bi bi-trash3-fill"></i></a>
                                                            </td>
                                                        </tr>

                                                    </c:forEach>
                                                </tbody>
                                            </table>
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
                                                Acción no realizada. ID Duplicado
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                        </c:if>                                    
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
                                                <input id="idProducto" type="number" min="0" class="form-control text-center" name="idProducto" value="<c:out value="${producto.id}"/>" required>                                                                                       
                                            </div>                                            
                                        </div>
                                        <div style="margin-bottom: 10px" class="input-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                  <span class="input-group-text" id="inputGroup-sizing-default">Nombre</span>
                                                </div>
                                                <input id="name" type="text" class="form-control text-center" name="name" value="<c:out value="${producto.id}"/>" required>                                       
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
                                                <input id="cantidad" type="number" class="form-control text-center" name="cantidad" min="0" value="<c:out value="${producto.id}"/>" required>                                       
                                            </div>                                            
                                        </div>
                                        <div style="margin-bottom: 10px" class="input-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend"><span class="input-group-text"><i class="bi bi-coin"></i></span></div>
                                                <input id="precio" type="number" class="form-control text-center" name="precio" min="0" value="<c:out value="${producto.id}"/>" placeholder="Precio c/u" required>
                                            </div>
                                        </div>
                                        <div style="margin-bottom: 10px" class="input-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend"><span class="input-group-text"><i class="bi bi-caret-up-square"></i></span></div>
                                                <input id="marca" type="text" class="form-control text-center" name="marca" value="<c:out value="${producto.id}"/>" placeholder="Marca" required>
                                            </div>
                                        </div>
                                        
                                        <div style="margin-bottom: 10px" class="input-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend"><span class="input-group-text"><i class="bi bi-card-text"></i></span></div>
                                                <input id="modelo" type="text" class="form-control text-center" name="modelo" value="<c:out value="${producto.id}"/>" placeholder="Modelo" required>
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



    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</body>
</html>
<%
    } else {
        response.sendRedirect("index.jsp");
    }
%>