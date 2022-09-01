<?php

ini_set('display_errors', '0');
include_once 'modelos/operadores.php';
include_once 'controladores/operadoresController.php';

?>
<!-- CCS Y JS PARA LA CARGA DE IMAGEN -->
<script src="plugins/dropify/dropify.min.js"></script>
<link rel="stylesheet" href="plugins/dropify/dropify.min.css">

<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>

<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

<script type="text/javascript">
  jQuery(document).ready(function($){
    $(document).ready(function() {
        $('.mi-selector2').select2();
    });
});
</script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark">Nuevo cliente</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="?controller=index&&action=index">Inicio</a></li>
            <li class="breadcrumb-item active"><a href="?controller=clientes&&action=todos">clientes</a></li>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div>
    <!-- /.content-header -->

	<!-- Main content -->
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="container-fluid">
					<div class="row">
						<!-- ESTE DIV LO USO PARA CENTRAR EL FORMULARIO -->
						<!-- left column -->
						<div class="col-md-12">
						  <!-- general form elements -->
						  <div class="card card-primary">
							<!-- /.card-header -->
							<!-- form start -->
							<form role="form" action="?controller=clientes&&action=guardar" method="POST" enctype="multipart/form-data">
								<input type="hidden" name="estado_cliente" value="1">
							  <div class="card-body">
								<div class="card-header">
								  <h3 class="card-title">Agregar nuevo cliente</h3>
								</div>
							
							<div class="row">
								 <div class="col-md-6">
									<div class="form-group">
									  <label for="nombres">Nit cliente *</label>
									  <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-check"></i></span>
                <input type="text" name="nit" value="" class="form-control" id="nit" placeholder="Ingrese el nit del cliente" maxlength="150" required>
              </div>
									 
									</div>
								  </div>
								  <div class="col-md-6">
									<div class="form-group">
									  <label for="nombres">Nombre cliente *</label>
									  <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-check"></i></span>
                <input type="text" name="nombre_cliente" value="" class="form-control" id="nombre_cliente" placeholder="Ingrese el nombre del cliente" maxlength="150" required>
              </div>
									 
									</div>
								  </div>
								  <div class="col-md-6">
									<div class="form-group">
									  <label for="nombres">E-mail cliente</label>
									  <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-check"></i></span>
                <input type="email" name="correo_cliente" value="" class="form-control" id="nombre_cliente" placeholder="Ingrese el E-mail del cliente" maxlength="150" >
              </div>
									 
									</div>
								  </div>
								  <div class="col-md-6">
									<div class="form-group">
									  <label for="nombres">Teléfono 1 cliente</label>
									  <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-check"></i></span>
                <input type="text" name="tel1_cliente" value="" class="form-control" id="nombre_cliente" placeholder="Ingrese el teléfono del cliente" maxlength="150" >
              </div>
									 
									</div>
								  </div>
								    <div class="col-md-6">
									<div class="form-group">
									  <label for="nombres">Teléfono 2 cliente</label>
									  <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-check"></i></span>
                <input type="text" name="tel2_cliente" value="" class="form-control" id="nombre_cliente" placeholder="Ingrese el teléfono del cliente" maxlength="150" >
              </div>
									 
									</div>
								  </div>

								   <div class="col-md-6">
									<div class="form-group">
									  <label for="nombres">Dirección cliente</label>
									  <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-check"></i></span>
                <input type="text" name="direccion_cliente" value="" class="form-control" id="nombre_cliente" placeholder="Ingrese dirección del cliente" maxlength="150" >
              </div>
									 
									</div>
								  </div>
								  <div class="col-md-6">
									<div class="form-group">
									  <label for="nombres">Contacto cliente</label>
									  <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-check"></i></span>
                <input type="text" name="contacto_cliente" value="" class="form-control" id="nombre_cliente" placeholder="Ingrese el contacto del cliente" maxlength="150" >
              </div>
									 
									</div>
								  </div>

								  <div  class="col-md-6">
                        <div class="form-group">
                          <label> Seleccione el Operador: <span>*</span></label>
                         <select style="width:300px;" class="form-control mi-selector2" id="equipo_id_equipo" name="operador_id_operador" required>
                            <option value="" selected>Seleccionar...</option>
                            <?php                     
                        $campamentos = Operadores::obtenerLista(); 
                            foreach ($campamentos as $campamento ){
                              $id_operador  = $campamento['id_operador'];
                              $nombre_operador = $campamento['nombre_operador'];
                            ?>
                            <option value="<?php echo $id_operador ; ?>"><?php echo utf8_encode($nombre_operador); ?></option>
                            <?php } ?>
                          </select>

                        </div>
                      </div>

							</div>
							<div class="card-footer">
							  <button name="Submit" type="submit" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" title="Haz clic aqui para guardar la información">Guardar</button>
							</div>
						  </div>
						  <!-- /.card -->

							</form>
						</div>
					  </div>

					</div> <!-- FIN DE ROW-->
				</div><!-- FIN DE CONTAINER FORMULARIO-->
			</div> <!-- Fin Row -->
		</div> <!-- Fin Container -->
	</div> <!-- Fin Content -->



</div> <!-- Fin Content-Wrapper -->


<script type="text/javascript">
  $(function () {
   $('[data-toggle="tooltip"]').tooltip();
  })
</script>

<script>
	//CARGA DE IMAGENES
	$(document).ready(function(){
    // Basic
		$('.dropify').dropify();
		$('.dropify2').dropify();
    });

	$('.dropify').dropify({
				messages: {
					'default': 'Arrastra y suelta un archivo aquí o haz clic',
					'replace': 'Arrastra y suelta o haz clic para reemplazar',
					'remove':  'Remover',
					'error':   'Oops, sucedió algo mal.'
				},
				error: {
						'fileSize': 'El tamaño del archivo es demasiado grande ({{ value }} maximo).',
						'imageFormat': 'El formato de imagen no está permitido ({{ value }} solamente).',
						'fileExtension': 'El archivo no está permitido ({{ value }} solamente).'
				}
	});

	var drEvent = $('.dropify').dropify();

	drEvent.on('dropify.beforeClear', function(event, element){
		return confirm("Realmente desea eliminar la imagen \"" + element.filename + "\" ?");
	});

	drEvent.on('dropify.error.fileSize', function(event, element){
		alert('Imagen demasiado grande!');
	});
	drEvent.on('dropify.error.minWidth', function(event, element){
		alert('Min width error message!');
	});
	drEvent.on('dropify.error.maxWidth', function(event, element){
		alert('Max width error message!');
	});
	drEvent.on('dropify.error.minHeight', function(event, element){
		alert('Min height error message!');
	});
	drEvent.on('dropify.error.maxHeight', function(event, element){
		alert('Max height error message!');
	});
	drEvent.on('dropify.error.imageFormat', function(event, element){
		alert('Error en el formato de la imagen!');
	});

	drEvent.on('dropify.errors', function(event, element){
		alert('Ha ocurrido un error!');
	});
	  var drEvent = $('.dropify').dropify();

	drEvent.on('dropify.afterClear', function(event, element){
		alert('Archivo Eliminado');
	});
</script>
