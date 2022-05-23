<!-- CCS Y JS PARA LA CARGA DE IMAGEN -->
<script src="plugins/dropify/dropify.min.js"></script>
<link rel="stylesheet" href="plugins/dropify/dropify.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>

<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>

<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

<script type="text/javascript">
  jQuery(document).ready(function($){
    $(document).ready(function() {
        $('.mi-selector0').select2();
    });
});
</script>
<script type="text/javascript">
  jQuery(document).ready(function($){
    $(document).ready(function() {
        $('.mi-selector1').select2();
    });
});
</script>

<script type="text/javascript">
  jQuery(document).ready(function($){
    $(document).ready(function() {
        $('.mi-selector2').select2();
    });
});
</script>
<div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"> Registrar Combustible
              	<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                </button>
              </h3>

              <div class="box-tools pull-right">
              <!--   <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                </button> -->
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
	<form role="form" autocomplete="off" action="?controller=reportes&&action=guardarcombustible" method="POST" enctype="multipart/form-data" >
							<?php  
								date_default_timezone_set("America/Bogota");
								$TiempoActual = date('Y-m-d H:i:s');
							?>
							
					<input type="hidden" name="creado_por" value="<?php echo($IdSesion);?>">
					<input type="hidden" name="estado_reporte" value="1">
					<input type="hidden" name="reporte_publicado" value="1">
					<input type="hidden" name="marca_temporal" value="<?php echo($TiempoActual);?>">

					<div class="card-body">
							<div class="row">
								<div class="col-md-12">
                    <div class="form-group">
                      <label for="fila2_columna1">Documento <small>Tamaño máximo 10MB</small></label>
                        <div class="custom-file">
                           <input name="imagen" type="file" id="input-file-now" class="dropify" data-default-file=""  multiple="multiple" data-allowed-file-extensions="png jpg jpeg mp4 pdf xls xlsx webm" data-show-errors="true" data-max-file-size="10M" data-errors-position="outside" accept="image/png, .jpeg, .jpg, image/gif,.pdf,.xlsx"/ required>
                        </div>
                    </div>
                </div>
											<div class="col-md-12">
												<div class="form-group">
													<label>Fecha del Despacho: <span>*</span></label>
													<input type="date" name="fecha_reporte" placeholder="Fecha" class="form-control required" required id="fecha_reporte">
												</div>
											</div>
											
											
											<div id="divplaca" class="col-md-12">
												<div class="form-group">
													<label> Seleccione el Equipo: <span>*</span></label>
							<select style="width: 250px;" class="form-control mi-selector0" id="equipo_id_equipo" name="equipo_id_equipo" required>
								
										<option value="" selected>Seleccionar...</option>
								<?php
								if ($RolSesion==4) {
									$rubros = Equipos::obtenerListaEquiposAsf();
								}
								else{
									$rubros = Equipos::obtenerListaEquiposAsf();
								}
										foreach ($rubros as $campo){
											$id_equipo = $campo['id_equipo'];
											$nombre_equipo = $campo['nombre_equipo'];
										?>
										<option value="<?php echo $id_equipo; ?>"><?php echo utf8_encode($nombre_equipo); ?></option>
								<?php } ?>
								</select>
												</div>
											</div>


											<div class="col-md-12">
												<div class="form-group">
													<label> Seleccione el Proyecto: <span>*</span></label>
								<select style="width: 250px;" class="form-control mi-selector2" id="proyecto_id_proyecto" name="proyecto_id_proyecto" required>
										<option value="" selected>Seleccionar Proyecto...</option>
										<?php
										$rubros = Proyectos::obtenerListaProyectos();
										foreach ($rubros as $campo){
											$id_proyecto = $campo['id_proyecto'];
											$nombre_proyecto = $campo['nombre_proyecto'];
										?>
										<option value="<?php echo $id_proyecto; ?>"><?php echo utf8_encode($nombre_proyecto); ?></option>
										<?php } ?>
								</select>

												</div>
											</div>

											<div  id="" class="col-md-12">
												<div class="form-group">
													<label> Punto Despacho: <span>*</span></label>
								<select style="width: 250px;" class="form-control mi-selector1" id="punto_despacho" name="punto_despacho" required>
										<option value="" selected>Seleccionar...</option>
										<?php
										$rubros = Estaciones::obtenerListaEstaciones();
										foreach ($rubros as $campo){
											$id_estacion = $campo['id_estacion'];
											$nombre_estacion = $campo['nombre_estacion'];
										?>
										<option value="<?php echo $id_estacion; ?>"><?php echo utf8_encode($nombre_estacion); ?></option>
										<?php } ?>
								</select>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label>Valor Galon: <span>*</span></label>
													<input type="text" name="valor_m3" placeholder="Valor Galon" class="form-control" id="demo1">
												</div>
											</div>
											  <div id="" class="col-md-12">
                        <div style="display: none;
                        " class="form-group">
                          <label> ¿Requiere Autorización?: <span>*</span></label>
                <select class="form-control" id="selectocultar" name="autorizado" required>
                    <option value="No" selected="">Seleccionar...</option>
                    <option value="Si">Si</option>
                    <option value="No" >No</option>
                    
                </select>
                        </div>
                      </div>

							<div style="display: none;"  id="autorizacion" class="col-md-12">
												<div class="form-group">
													<label> Autorizado por: <span>*</span></label>
								<select style="width: 250px;" class="form-control mi-selector" id="despachado_por" name="despachado_por" >
										<option value="0" selected >Seleccionar...</option>
										<?php
										$rubros = Funcionarios::obtenerListaFuncionarios();
										foreach ($rubros as $campo){
											$id_funcionario = $campo['id_funcionario'];
											$nombre_funcionario = $campo['nombre_funcionario'];
										?>
										<option value="<?php echo $id_funcionario; ?>"><?php echo utf8_encode($nombre_funcionario); ?></option>
										<?php } ?>
								</select>
												</div>
											</div>

									<?php 
									if ($RolSesion==4) {
										?>

									<input type="hidden" name="recibido_por" value="<?php echo ($IdSesion) ?>">

										<?php
									}

									else
									{
									 ?>

											<div id="" class="col-md-12">
												<div class="form-group">
													<label> Recibido por: <span>*</span></label>
								<select style="width: 250px;" class="form-control mi-selector2" id="recibido_por" name="recibido_por" >
										<option value="" selected>Seleccionar...</option>
										<?php
										$rubros = Usuarios::ListaUsuariosCond();
										foreach ($rubros as $campo){
											$id_usuario = $campo['id_usuario'];
											$nombre_usuario = $campo['nombre_usuario'];
										?>
										<option value="<?php echo $id_usuario; ?>"><?php echo utf8_encode($nombre_usuario); ?></option>
										<?php } ?>
								</select>
												</div>
											</div>
											
										<?php 
									}
										 ?>	
										
											
											<div class="col-md-12">
												<div class="form-group">
													<label>Cantidad<span>*</span></label>
													<input type="number" step="any" name="cantidad" placeholder="Indique la cantidad" class="form-control" required value="">
													<small>Decimales separados con punto</small>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label>Kilometraje-Horómetro<span>*</span></label>
													<input type="number" step="any" name="indicador" placeholder="Medidor" class="form-control" required value="">
													<small>Decimales separados con punto</small>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label>Observaciones<span>*</span></label>
									<textarea class="form-control" rows="2" id="descripcion" name="observaciones"></textarea>
												</div>
											</div>
											
										</div>
							<div class="row">
								<div class="card-footer">
								  <button name="Submit" type="submit" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" title="Haz clic aqui para guardar la información">Reportar Despacho</button>
								</div>
						  </div>
						  </form>
</div>
</div>


</div> <!-- Fin Content-Wrapper -->
<!-- Inicio Libreria formato moneda -->
<script src="dist/js/jquery.maskMoney.js" type="text/javascript"></script>
<script type="text/javascript">			
$("#demo1").maskMoney({
prefix:'$ ', // The symbol to be displayed before the value entered by the user
allowZero:true, // Prevent users from inputing zero
allowNegative:true, // Prevent users from inputing negative values
defaultZero:false, // when the user enters the field, it sets a default mask using zero
thousands: '.', // The thousands separator
decimal: '.' , // The decimal separator
precision: 0, // How many decimal places are allowed
affixesStay : true, // set if the symbol will stay in the field after the user exits the field. 
symbolPosition : 'left' // use this setting to position the symbol at the left or right side of the value. default 'left'
}); //
		</script>
<script type="text/javascript">
	var datefield = document.createElement("input")

datefield.setAttribute("type", "date")

if (datefield.type!="date"){ //if browser doesn't support input type="date", load files for jQuery UI Date Picker
    document.write('<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />\n')
    document.write('<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"><\/script>\n') 
}        
if (datefield.type != "date"){ //if browser doesn't support input type="date", initialize date picker widget:
    $(document).ready(function() {
        $('#fecha_reporte').datepicker();
        //dateFormat: 'dd/mm/yy'
    }); 
} 
</script>

<script type="text/javascript">
  $(function () {
   $('[data-toggle="tooltip"]').tooltip();
  })
</script>

<script type="text/javascript">
 $('#selectocultar').change(function() {
    var el = $(this);
    if(el.val() === "Si") {  
          $('#autorizacion').show();    
    } else {      
          $('#autorizacion').hide();  
    }      
});
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
