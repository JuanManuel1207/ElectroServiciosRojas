<%-- 
    Document   : prueba.jsp
    Created on : 24/05/2022, 10:21:27 a. m.
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Menu</title>
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
                                <a href="./prueba.jsp" class="d-block text-light p-3 border-0"><i class="bi bi-person-lines-fill lead mr-2"></i>
                                    Gestión Empleados</a>
                                <a href="#" class="d-block text-light p-3 border-0"><i class="bi bi-hdd-rack lead mr-2"></i>
                                    Gestión Servicios</a>
                                <a href="#" class="d-block text-light p-3 border-0"><i class="bi bi-cart4 lead mr-2"></i>
                                    Gestión Ventas</a>
                                <a href="#" class="d-block text-light p-3 border-0"><i class="bi bi-box-seam lead mr-2"></i>
                                    Gestión Productos</a>
                                <a href="#" class="d-block text-light p-3 border-0"> <i class="bi bi-card-list lead mr-2"></i>
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
                <div class="mx-auto col-sm-10 main-section" id="myTab" role="tablist">
                    <div>
                        <h1>
                            
                        </h1>
                        <button type="button" class="btn btn-success">Añadir</button>
                        <h1>
                            Nueva version
                        </h1>
                    </div>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="list" role="tabpanel" aria-labelledby="list-tab">
                            <div class="card">
                                <div class="card-header">
                                    <h4>Lista de empleados</h4>
                                </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="userList" class="table table-bordered table-hover table-striped">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Tipo</th>
                                                <th scope="col">Nombres</th>
                                                <th scope="col">Apellidos</th>
                                                <th scope="col">C.C.</th>
                                                <th scope="col">Fecha de Nacimiento</th>
                                                <th scope="col">Celular</th>
                                                <th scope="col">Salario</th>
                                                <th scope="col">E-mail</th>
                                                <th scope="col">Accion</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">8775</th>
                                                    <td>Administrdor</td>
                                                    <td>Yesika</td>
                                                    <td>Nuñez</td>
                                                    <td>7777777</td>
                                                    <td>xx/xx/xx</td>
                                                    <td>2222222</td>
                                                    <td>1000</td>
                                                    <td>xxxx@xxxx</td>
                                                    <td>
                                                        <a href="#"><i class="bi bi-pencil-square"></i></a> | <a href="#"><i class="bi bi-person-x-fill"></i></a>
                                                    </td>
                                             </tr>
                                        </tbody>
                                    </table>
                                </div>                        
                            </div>
                            </div>
                        </div>
                                <div class="tab-pane fade" id="form" role="tabpanel" aria-labelledby="form-tab">
                                        <div class="card">
                                                <div class="card-header">
                                                        <h4>User Information</h4>
                                                </div>
                                                <div class="card-body">
                                                        <form class="form" role="form" autocomplete="off">
                                                                <div class="form-group row">
                                                                        <label class="col-lg-3 col-form-label form-control-label">First name</label>
                                                                        <div class="col-lg-9">
                                                                                <input class="form-control" type="text" >
                                                                        </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                        <label class="col-lg-3 col-form-label form-control-label">Last
                                                                                name</label>
                                                                        <div class="col-lg-9">
                                                                                <input class="form-control" type="text" >
                                                                        </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                        <label class="col-lg-3 col-form-label form-control-label">Email</label>
                                                                        <div class="col-lg-9">
                                                                                <input class="form-control" type="email">
                                                                        </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                        <label class="col-lg-3 col-form-label form-control-label">Username</label>
                                                                        <div class="col-lg-9">
                                                                                <input class="form-control" type="text">
                                                                        </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                        <label class="col-lg-3 col-form-label form-control-label">Password</label>
                                                                        <div class="col-lg-9">
                                                                                <input class="form-control" type="password">
                                                                        </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                        <label class="col-lg-3 col-form-label form-control-label">Confirm</label>
                                                                        <div class="col-lg-9">
                                                                                <input class="form-control" type="password" >
                                                                        </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                        <div class="col-lg-12 text-center">
                                                                                <input type="reset" class="btn btn-secondary" value="Cancel">
                                                                                <input type="button" class="btn btn-primary"
                                                                                        value="Save Changes">
                                                                        </div>
                                                                </div>
                                                        </form>
                                                </div>
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
    <script type="text/javascript">
	$(document).ready(function() {
	        //Asegurate que el id que le diste a la tabla sea igual al texto despues del simbolo #
	        $('#userList').DataTable();
	    } );
	</script>    
</head>
    </body>
</html>
