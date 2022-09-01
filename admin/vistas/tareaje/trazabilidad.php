<?php 
	ini_set('display_errors', '0');
include_once 'modelos/estadosreq.php';
include_once 'controladores/estadosreqController.php';
include_once 'modelos/usuarios.php';
include_once 'controladores/usuariosController.php';
include_once 'modelos/servicios.php';
include_once 'controladores/serviciosController.php';
include_once 'modelos/insumos.php';
include_once 'controladores/insumosController.php';
include_once 'modelos/equipos.php';
include_once 'controladores/equiposController.php';
include_once 'modelos/requisicionesitems.php';
include_once 'controladores/requisicionesitemsController.php';


$RolSesion = $_SESSION['IdRol'];
$IdSesion = $_SESSION['IdUser'];

$iditem=$_GET['iditem'];

 ?>
<!-- CCS Y JS PARA LA CARGA DE IMAGEN -->


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark">Gestionar S-00<?php echo($iditem); ?></h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="?controller=index&&action=index">Inicio</a></li>
            <li class="breadcrumb-item active"><a href="?controller=tareaje&&action=todos">Consolidado Tareaje</a></li>
            	
             
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
          <!-- DIRECT CHAT PRIMARY -->
          <div class="box box-primary direct-chat direct-chat-primary">
            <div class="box-header with-border">
              <h3 class="box-title">
              
              <?php echo("<strong>Servicio Id:</strong>:".$iditem); ?>

            </h3>

              <div class="box-tools pull-right">
                <span data-toggle="tooltip" title="" class="badge bg-light-blue" data-original-title="Total Mensajes">
                	<?php 
                	$totalcomentarios=contarcomentariostareaje($iditem);
                	echo($totalcomentarios);
                	 ?>
                </span>
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="" data-widget="chat-pane-toggle" data-original-title="Contacts">
                  <i class="fa fa-comments"></i></button>
                
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <!-- Conversations are loaded here -->
              <div class="direct-chat-messages">
                <!-- Message. Default to the left -->

               <?php
										$res = Tareaje::datostrazabilidad($iditem);
										 $campos = $res->getCampos();
										foreach ($campos as $campo){
											$id = $campo['id'];
											$fecha_reporte = $campo['fecha_reporte'];
											$usuario_creador = $campo['usuario_creador'];
											$estadotareje_id = $campo['estadotareje_id'];
											$tareaje_id = $campo['tareaje_id'];
											$observaciones = $campo['observaciones'];
											$marca_temporal = $campo['marca_temporal'];
											$nomsolicita=Usuarios::obtenerNombreUsuario($usuario_creador);
											$imagen=Usuarios::obtenerImagenPerfil($usuario_creador);
											$nomestado=Tareaje::obtenerNombreEstado($estadotareje_id);
								?>

                <div class="direct-chat-msg">
                  <div class="direct-chat-info clearfix">
                    <span class="direct-chat-name pull-left"><?php echo($nomsolicita); ?></span>
                    <span class="direct-chat-timestamp pull-right"><?php echo($marca_temporal) ?></span>
                  </div>
                  <!-- /.direct-chat-info -->
                <img src="<?php echo($imagen);?>" height="50" width="50">
                  <div class="direct-chat-text">
                    <strong>Estado: <?php echo($nomestado); ?></strong>
                    <br>
                     <?php echo ($observaciones); ?>
                  </div>
                  <hr>
                  <!-- /.direct-chat-text -->

                </div>
                <!-- /.direct-chat-msg -->

                <?php 
              }
               ?>
              </div>
              <!--/.direct-chat-messages-->

            </div>
            <!-- /.box-body -->
            <div style="display: none;" class="box-footer">
              <form action="?controller=requisicionesitems&action=actualizarestado&&id=<?php echo($idreq); ?>&&cargo=<?php echo($RolSesion) ?>" method="post">
              	<div class="form-group">
              		<input type="hidden" name="items" value="<?php echo($iditem); ?>">
                	<input type="hidden" name="usuario_creador" value="<?php echo($IdSesion) ?>">

										  <label for="sel1">Lista de Estados:</label>
										  <select class="form-control mi-selector" id="estado_item" name="estado_item" required>
											<option value="" selected>Seleccionar...</option>
										<?php
										$rubros = Estadosreq::ObtenerListaEstadosTareaje();
										foreach ($rubros as $campo){
											$id = $campo['id'];
											$nombre = $campo['nombre'];
										?>
										<option value="<?php echo $id; ?>"><?php echo utf8_encode($nombre); ?></option>
										<?php } ?>
										  </select>
										</div>
                <div class="input-group">
                  <input type="text" name="observaciones" placeholder="Agregar Observación ..." class="form-control">
                      <span class="input-group-btn">
                        <button type="submit" class="btn btn-primary btn-flat">Send</button>
                      </span>
                </div>
              </form>
            </div>
            <!-- /.box-footer-->
          </div>
          <!--/.direct-chat -->
        </div>

					</div> <!-- FIN DE ROW-->
				</div><!-- FIN DE CONTAINER FORMULARIO-->
			</div> <!-- Fin Row -->
		</div> <!-- Fin Container -->
	</div> <!-- Fin Content -->



</div> <!-- Fin Content-Wrapper -->

<script>
  $(function () {

    $('.select2').select2()


  })
</script>

<style type="text/css">
	.select2-container--default .select2-selection--multiple .select2-selection__choice {
	    background-color: navy;
	    border: 1px solid #aaa;
	    border-radius: 4px;
	    cursor: default;
	    float: left;
	    margin-right: 5px;
	    margin-top: 5px;
	    padding: 0 5px;
	}

</style>
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
