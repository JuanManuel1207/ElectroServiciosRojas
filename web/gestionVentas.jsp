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
            <div class="col-sm-4">
                <div class="card">
                    <form action="servletVentas?accion=BuscarProducto" method="POST">
                        <div class="card-body">                            
                            <div class="form-group">
                                <label>DATOS PRODUCTO: </label>
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-7 d-flex">                                    
                                    <input type="text" name="codigoProducto" value="${product.getProductId()}" class="form-control" placeholder="idProducto" >
                                    <button type="submit" name="accion" value="Buscar" class="btn btn-outline-info ">Buscar</button>
                                </div>                            
                                <div class="col-sm-6">
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
                                    <input type="number" name="cantidad" class="form-control " min="1" max="100" placeholder="1">                                    
                                </div>
                            </div>                            
                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">
                                    <input type="date" name="fecha" class="form-control ">
                                </div>                            
                                <div class="col-sm-6">
                                    <input typ="text" name="nombresCliente" class="form-control " placeholder="Cliente">
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-outline-info">
                            </div>
                        </div>                        
                    </form>                                        
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
                        </div>
                        <div class="card-footer">
                                <div>
                                    <button type="submit" class="btn btn-success">Generar Venta</button>
                                    <button type="submit" class="btn btn-danger">Cancelar Venta</button>
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

