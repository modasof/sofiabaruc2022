<?php
ini_set('display_errors', '1');
$RolSesion = $_SESSION['IdRol'];
$IdSesion = $_SESSION['IdUser'];

include_once 'modelos/operadores.php';
include_once 'controladores/operadoresController.php';

include_once 'modelos/clientes.php';
include_once 'controladores/clientesController.php';

include_once 'modelos/tareaje.php';
include_once 'controladores/tareajeController.php';

include_once 'modelos/equipos.php';
include_once 'controladores/equiposController.php';

include_once 'modelos/usuarios.php';
include_once 'controladores/usuariosController.php';

include 'vistas/index/estadisticas_tareaje.php';

?>


<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>

<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

<script type="text/javascript">
  jQuery(document).ready(function($){
    $(document).ready(function() {
        $('.mi-selector2').select2();
    });
});
</script>

<script type="text/javascript">
$(document).ready(function(){
    $('#operador_id_operador').on('change',function(){
        var datoSel = $(this).val();
        //alert (datoSel);
        if(datoSel){
            $.ajax({
                type:'POST',
                url:'vistas/tareaje/ajax.php',
                data:'operador_id_operador='+datoSel,
                success:function(html){
                    $('#cliente_id_cliente').html(html);  
                }
            });
        }else{
            $('#cliente_id_cliente').html('<option value="">Seleccione primero el rubro</option>');
            
        }
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
         
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="?controller=index&&action=index">Inicio</a></li>
            <li style="display: none;" class="breadcrumb-item active"><a href="?controller=tareaje&&action=todos">Consolidado Tareaje</a></li>
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
						<div class="col-md-3">

<div class="box box-info">
<div class="box-header">
<h3 class="box-title">Programación</h3>
</div>
<div class="box-body">

	<form role="form" action="?controller=tareaje&&action=guardar" method="POST" enctype="multipart/form-data">
	<?php 
		$marca_temporal = date('Y-m-d H:m:s');
	 ?>
				<input type="hidden" name="estado_cliente" value="1">
				<input type="hidden" name="hora_inicio" value="0">
				<input type="hidden" name="hora_final" value="0">
				<input type="hidden" name="km_inicial" value="0">
				<input type="hidden" name="hora_extra" value="0">
				<input type="hidden" name="km_final" value="0">
				<input type="hidden" name="total_km" value="0">
				<input type="hidden" name="km_extra" value="0">
				<input type="hidden" name="destino" value="0">
				<input type="hidden" name="observaciones" value="0">
				<input type="hidden" name="creado_por" value="<?php echo ($IdSesion); ?>">
				<input type="hidden" name="marca_temporal" value="<?php echo ($marca_temporal); ?>">
				<input type="hidden" name="estado_tareaje" value="1">
				<input type="hidden" name="tareaje_publicado" value="1">
				<input type="hidden" name="valor_servicio" value="0">
				<input type="hidden" name="estado_facturado" value="0">



							  <div class="card-body">
							<div class="row">


<div  class="col-md-12">
                        <div class="form-group">
                          <label> Operadora: <span>*</span></label>
                         <select  class="form-control mi-selector2" id="operador_id_operador" name="operador_id_operador" required>
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
            
          <div id="divsubrubro" class="col-md-12">
												<div class="form-group">
													  <label for="sel1">Empresa/Cliente:<span>*</span></label>
													  <select class="form-control" id="cliente_id_cliente" name="cliente_id_cliente" required>
													  	<option value="">Seleccione primero la operadora</option>
													  </select>
												</div>
					</div>
					<div  class="col-md-12">
                        <div class="form-group">
                          <label> Conductor: <span>*</span></label>
                        <select  class="form-control mi-selector2" id="conductor_id_conductor" name="conductor_id_conductor" required>
                            <option value="" selected>Seleccionar...</option>
                            <?php                     
                        $campamentos = Usuarios::ListaUsuariosCond(); 
                            foreach ($campamentos as $campamento ){
                              $id_usuario  = $campamento['id_usuario'];
                              $nombre_usuario = $campamento['nombre_usuario'];
                            ?>
                            <option value="<?php echo $id_usuario ; ?>"><?php echo utf8_encode($nombre_usuario); ?></option>
                            <?php } ?>
                          </select>

                        </div>
            </div>

            <div  class="col-md-12">
                        <div class="form-group">
                          <label> Vehículo: <span>*</span></label>
                        <select  class="form-control mi-selector2" id="equipo_id_equipo" name="equipo_id_equipo" required>
                            <option value="" selected>Seleccionar...</option>
                            <?php                     
                        $campamentos = Equipos::obtenerListaEquiposAsf(); 
                            foreach ($campamentos as $campamento ){
                              $id_equipo  = $campamento['id_equipo'];
                              $nombre_equipo = $campamento['nombre_equipo'];
                            ?>
                            <option value="<?php echo $id_equipo ; ?>"><?php echo utf8_encode($nombre_equipo); ?></option>
                            <?php } ?>
                          </select>

                        </div>
            </div>
             <div  class="col-md-12">
                        <div class="form-group">
                          <label> Servicio: <span>*</span></label>
                        <select  class="form-control mi-selector2" id="tipo_servicio" name="tipo_servicio" required>
                            <option value="" selected>Seleccionar...</option>
                            <option value="OR8HR" >Turno Ordinario 8 Horas</option>
                            <option value="OR12HR" >Turno Ordinario 12 Horas</option>
                            <option value="OR16HR" >Turno Ordinario 16 Horas</option>
                            <option value="OR24HR" >Turno Ordinario 24 Horas</option>
                            <option value="FD8HR" >Turno Festivo-Dominical 8 Horas</option>
                            <option value="FD12HR" >Turno Festivo-Dominical 12 Horas</option>
                            <option value="FD16HR" >Turno Festivo-Dominical 16 Horas</option>
                            <option value="FD24HR" >Turno Festivo-Dominical 24 Horas</option>
                            <option value="VJ" >Viaje</option>
                           
                          </select>

                        </div>
            </div>


								
								  <div  class="col-md-12">
												<div class="form-group">
													<label>Fecha programada: <span>*</span></label>
													
													<input type="text" name="fecha_reporte" id="fecha_reporte" placeholder="Selecione las fechas" autocomplete="off" class="form-control required" required>
												</div>
</div>
<script>
$(function() {
  $('input[name="fecha_reporte"]').daterangepicker({
    timePicker: false,
    minDate:new Date(),
    autoUpdateInput: false,
    //maxDate: "+1M +5D",
    //startDate: moment().startOf('hour'),
    //endDate: moment().startOf('hour').add(32, 'hour'),
    locale: {
      //format: 'YYYY-MM-DD hh:mm A',
      format: 'YYYY-MM-DD',
      applyLabel: "Aplicar",
      cancelLabel: "Cancelar",
    },
  });
  $('input[name="fecha_reporte"]').on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.startDate.format('YYYY-MM-DD') + ' al ' + picker.endDate.format('YYYY-MM-DD'));
  });

   


});
</script>

								  <div class="col-md-12">
									<div class="form-group">
									  <label for="nombres">¿Ususario que toma el servicio? *</label>
									  <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-check"></i></span>
                <input type="text" name="solicitado_por" value="" class="form-control" id="solicitado_por" placeholder="Ingrese el nombre del cliente" maxlength="150" required autocomplete="off">
              </div>
									 
									</div>
								  </div>
								  <div class="col-md-12">
									<div class="form-group">
									  <label for="nombres">Origen</label>
									  <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-check"></i></span>
                <input type="text" name="origen" value="" class="form-control" id="origen" placeholder="Ingrese el punto inicial" maxlength="150" required autocomplete="off">
              </div>
									 
									</div>
								  </div>
								  
								<div class="col-md-12">
									<div class="form-group">
									  <label for="nombres">Número Contacto usuario</label>
									  <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-check"></i></span>
                <input type="text" name="contacto" value="" class="form-control" id="contacto" placeholder="Ingrese el teléfono del contacto" maxlength="150" autocomplete="off">
              </div>
									 
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

						  <!-- general form elements -->
						  <div class="card card-primary">
							<!-- /.card-header -->
							<!-- form start -->
							
						</div>
					  </div>

					  <div class="col-md-9">

<div class="nav-tabs-custom">
<ul class="nav nav-tabs">
<li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">Tareaje Hoy</a></li>
<li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false">Tareaje Mes</a></li>
</ul>
<div class="tab-content">
<div class="tab-pane active" id="tab_1">
<div class="box-body">
	<?php 

# =====================================================
# =           Parametrización de Fechas Tab           =
# =====================================================
$hoy= date('Y-m-d');
$InicioDia=($hoy." 00:00:000");
$FinalDia=($hoy." 23:59:000");
$estadoasignado = 1;
$estadoencurso = 2;
$estadofinalizado = 3;
# ======  End of Parametrización de Fechas Tab  =======

	 ?>
	<div class="col-md-4 col-sm-6 col-xs-12">
<div class="info-box">
<span class="info-box-icon bg-aqua"><i class="fa fa-taxi"></i></span>
<div class="info-box-content">
<span class="info-box-text">Asignados</span>
<span class="info-box-number">
	<?php 
		$totalasignados= contarserviciosestado($estadoasignado,$InicioDia,$FinalDia);
		echo($totalasignados);
	 ?>
</span>
</div>

</div>

</div>
<div class="col-md-4 col-sm-6 col-xs-12">
<div class="info-box">
<span class="info-box-icon bg-green"><i class="fa fa-taxi"></i></span>
<div class="info-box-content">
<span class="info-box-text">En Ruta</span>
<span class="info-box-number">
	<?php 
		$totalencurso= contarserviciosestado($estadoencurso,$InicioDia,$FinalDia);
		echo($totalencurso);
	 ?>
</span>
</div>

</div>

</div>
<div class="col-md-4 col-sm-6 col-xs-12">
<div class="info-box">
<span class="info-box-icon bg-aqua"><i class="fa fa-taxi"></i></span>
<div class="info-box-content">
<span class="info-box-text">Finalizados</span>
<span class="info-box-number">
	<?php 
		$totalfinalizados= contarserviciosestado($estadofinalizado,$InicioDia,$FinalDia);
		echo($totalfinalizados);
	 ?>
</span>
</div>

</div>

</div>


 <div class="clearfix">
                      <div class="pull-left tableTools-container"></div>
                    </div>
              <div class="table-responsive mailbox-messages">
          <table id="cotizaciones" class="table  table-responsive table-striped table-bordered table-hover" style="width: 100%;font-size: 12px;">
            <tfoot style="display: table-header-group;">

            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
          

                            </tfoot>
          <thead>
            <tr style="background-color: #4f5962;color: white;">
              <th>Id</th>
              <th style="width: 2%;">#</th>
              <th>Estado</th>
              <th>Operadora</th>
              <th>Empresa</th>
              <th>Conductor</th>
              <th>Vehículo</th>
              <th>Fecha</th>
              <th>Servicio</th>
            
              <th>Acción</th>
            </tr>
            <tr>
              <th>Id</th>
              <th style="width: 2%;">#</th>
               <th>Estado</th>
              <th>Operadora</th>
              <th>Empresa</th>
              <th>Conductor</th>
              <th>Vehículo</th>
              <th>Fecha</th>
              <th>Servicio</th>
             
              <th>Acción</th>
            </tr>
          </thead>
       <tbody>
            <?php
$res=Tareaje::Reporteporfecha($InicioDia,$FinalDia);
$campos = $res->getCampos();
            
foreach ($campos as $campo) {
    $id                     = $campo['id_tareaje'];
    $cliente_id_cliente     = $campo['cliente_id_cliente'];
    $operador_id_operador   = $campo['operador_id_operador'];
    $equipo_id_equipo       = $campo['equipo_id_equipo'];
    $conductor_id_conductor = $campo['conductor_id_conductor'];
    $fecha_reporte          = $campo['fecha_reporte'];
    $hora_inicio            = $campo['hora_inicio'];
    $hora_final             = $campo['hora_final'];
    $km_inicial             = $campo['km_inicial'];
    $km_final               = $campo['km_final'];
    $total_km               = $campo['total_km'];
    $origen                 = $campo['origen'];
    $destino                = $campo['destino'];
    $observaciones          = $campo['observaciones'];
    $solicitado_por         = $campo['solicitado_por'];
    $creado_por             = $campo['creado_por'];
    $marca_temporal         = $campo['marca_temporal'];
    $estado_tareaje         = $campo['estado_tareaje'];
    $tareaje_publicado      = $campo['tareaje_publicado'];
    $valor_servicio         = $campo['valor_servicio'];
    $estado_facturado       = $campo['estado_facturado'];
    $tipo_servicio          = $campo['tipo_servicio'];

    $nomcliente       = Clientes::obtenerNombreCliente($cliente_id_cliente);
    $nomconductor     = Usuarios::obtenerNombreUsuario($conductor_id_conductor);
    $nomoperador      = Operadores::obtenerNombre($operador_id_operador);
    $nomequipo        = Equipos::obtenerNombreEquipo($equipo_id_equipo);
    $estadoactual     = Tareaje::obtenerNombreEstado($estado_tareaje);
    $coloractual      = Tareaje::obtenerColorEstado($estado_tareaje);
    

    ?>
            <tr>
              <td><?php echo utf8_decode("S-00" . $id); ?></td>
              <td>1</td>
             <td>
                  <small style="background-color:<?php echo ($coloractual); ?>;" class="label pull-left"><?php echo ($estadoactual); ?></small>
             </td>
              <td><?php echo utf8_decode($nomoperador); ?></td>
              <td><?php echo utf8_decode($nomcliente); ?></td>
              <td><?php echo utf8_decode($nomconductor); ?></td>
              <td><?php echo utf8_decode($nomequipo); ?></td>
              <td><?php echo utf8_decode($fecha_reporte); ?></td>
              <td><?php echo utf8_decode($tipo_servicio); ?></td>

        


              <td>
              <a href="?controller=clientes&&action=editar&&id=<?php echo $id; ?>" class="tooltip-primary text-success" data-rel="tooltip" data-placement="top" title="" data-original-title="Editar Cliente">
                <i class="fa fa-edit bigger-110 "></i>
              </a>
                <a href="#" onclick="eliminar(<?php echo $id; ?>);" class="tooltip-primary text-danger" data-rel="tooltip" data-placement="top" title="" data-original-title="Eliminar Cliente">
                <i class="fa fa-trash bigger-110 "></i>
              </a>


              </td>
            </tr>
            <?php
}
?>
          </tbody>
          </table>
        </div> <!-- Fin Row -->

</div>

</div>

<div class="tab-pane" id="tab_2">
<div class="box-body">
<?php 
# =====================================================
# =           Parametrización de Fechas Tab           =
# =====================================================

$anoactual= date('Y');
$totaldiasmes= date('t');
$mesactual= date('n');
$primerdiamescons=$anoactual."-".$mesactual."-01 00:00:000";
$ultimodiamescons=$anoactual."-".$mesactual."-".$totaldiasmes." 23:59:000";
$estadoasignado = 1;
$estadoencurso = 2;
$estadofinalizado = 3;
# ======  End of Parametrización de Fechas Tab  =======

 ?>

	<div class="col-md-4 col-sm-6 col-xs-12">
<div class="info-box">
<span class="info-box-icon bg-aqua"><i class="fa fa-taxi"></i></span>
<div class="info-box-content">
<span class="info-box-text">Asignados</span>
<span class="info-box-number">
	<?php 
		$totalasignados= contarserviciosestado($estadoasignado,$primerdiamescons,$ultimodiamescons);
		echo($totalasignados);
	 ?>
</span>
</div>

</div>

</div>
<div class="col-md-4 col-sm-6 col-xs-12">
<div class="info-box">
<span class="info-box-icon bg-green"><i class="fa fa-taxi"></i></span>
<div class="info-box-content">
<span class="info-box-text">En ruta</span>
<span class="info-box-number">
	<?php 
		$totalencurso= contarserviciosestado($estadoencurso,$primerdiamescons,$ultimodiamescons);
		echo($totalencurso);
	 ?>
</span>
</div>

</div>

</div>
<div class="col-md-4 col-sm-6 col-xs-12">
<div class="info-box">
<span class="info-box-icon bg-aqua"><i class="fa fa-taxi"></i></span>
<div class="info-box-content">
<span class="info-box-text">Finalizados</span>
<span class="info-box-number">
	<?php 
		$totalfinalizados= contarserviciosestado($estadofinalizado,$primerdiamescons,$ultimodiamescons);
		echo($totalfinalizados);
	 ?>
</span>
</div>

</div>

</div>


 <div class="clearfix">
                      <div class="pull-left tableTools-container2"></div>
                    </div>
              <div class="table-responsive mailbox-messages">
          <table id="cotizaciones2" class="table  table-responsive table-striped table-bordered table-hover" style="width: 100%;font-size: 12px;">
            <tfoot style="display: table-header-group;">

            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
            <th style="background-color: #fcf8e3" class="success"></th>
          

                            </tfoot>
          <thead>
            <tr style="background-color: #4f5962;color: white;">
              <th>Id</th>
              <th style="width: 2%;">#</th>
              <th>Estado</th>
              <th>Operadora</th>
              <th>Empresa</th>
              <th>Conductor</th>
              <th>Vehículo</th>
              <th>Fecha</th>
              <th>Servicio</th>
            
              <th>Acción</th>
            </tr>
            <tr>
              <th>Id</th>
              <th style="width: 2%;">#</th>
               <th>Estado</th>
              <th>Operadora</th>
              <th>Empresa</th>
              <th>Conductor</th>
              <th>Vehículo</th>
              <th>Fecha</th>
              <th>Servicio</th>
             
              <th>Acción</th>
            </tr>
          </thead>
       <tbody>
            <?php
$res=Tareaje::Reporteporfecha($primerdiamescons,$ultimodiamescons);
$campos = $res->getCampos();
            
foreach ($campos as $campo) {
    $id                     = $campo['id_tareaje'];
    $cliente_id_cliente     = $campo['cliente_id_cliente'];
    $operador_id_operador   = $campo['operador_id_operador'];
    $equipo_id_equipo       = $campo['equipo_id_equipo'];
    $conductor_id_conductor = $campo['conductor_id_conductor'];
    $fecha_reporte          = $campo['fecha_reporte'];
    $hora_inicio            = $campo['hora_inicio'];
    $hora_final             = $campo['hora_final'];
    $km_inicial             = $campo['km_inicial'];
    $km_final               = $campo['km_final'];
    $total_km               = $campo['total_km'];
    $origen                 = $campo['origen'];
    $destino                = $campo['destino'];
    $observaciones          = $campo['observaciones'];
    $solicitado_por         = $campo['solicitado_por'];
    $creado_por             = $campo['creado_por'];
    $marca_temporal         = $campo['marca_temporal'];
    $estado_tareaje         = $campo['estado_tareaje'];
    $tareaje_publicado      = $campo['tareaje_publicado'];
    $valor_servicio         = $campo['valor_servicio'];
    $estado_facturado       = $campo['estado_facturado'];
    $tipo_servicio          = $campo['tipo_servicio'];

    $nomcliente       = Clientes::obtenerNombreCliente($cliente_id_cliente);
    $nomconductor     = Usuarios::obtenerNombreUsuario($conductor_id_conductor);
    $nomoperador      = Operadores::obtenerNombre($operador_id_operador);
    $nomequipo        = Equipos::obtenerNombreEquipo($equipo_id_equipo);
    $estadoactual     = Tareaje::obtenerNombreEstado($estado_tareaje);
    $coloractual      = Tareaje::obtenerColorEstado($estado_tareaje);
    

    ?>
            <tr>
              <td><?php echo utf8_decode("S-00" . $id); ?></td>
              <td>1</td>
             <td>
                  <small style="background-color:<?php echo ($coloractual); ?>;" class="label pull-left"><?php echo ($estadoactual); ?></small>
             </td>
              <td><?php echo utf8_decode($nomoperador); ?></td>
              <td><?php echo utf8_decode($nomcliente); ?></td>
              <td><?php echo utf8_decode($nomconductor); ?></td>
              <td><?php echo utf8_decode($nomequipo); ?></td>
              <td><?php echo utf8_decode($fecha_reporte); ?></td>
              <td><?php echo utf8_decode($tipo_servicio); ?></td>

        


              <td>
              <a href="?controller=clientes&&action=editar&&id=<?php echo $id; ?>" class="tooltip-primary text-success" data-rel="tooltip" data-placement="top" title="" data-original-title="Editar Cliente">
                <i class="fa fa-edit bigger-110 "></i>
              </a>
                <a href="#" onclick="eliminar(<?php echo $id; ?>);" class="tooltip-primary text-danger" data-rel="tooltip" data-placement="top" title="" data-original-title="Eliminar Cliente">
                <i class="fa fa-trash bigger-110 "></i>
              </a>


              </td>
            </tr>
            <?php
}
?>
          </tbody>
          </table>
        </div> <!-- Fin Row -->

</div>
</div>

<div class="tab-pane" id="tab_3">
Lorem Ipsum is simply dummy text of the printing and typesetting industry.
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
when an unknown printer took a galley of type and scrambled it to make a type specimen book.
It has survived not only five centuries, but also the leap into electronic typesetting,
remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset
sheets containing Lorem Ipsum passages, and more recently with desktop publishing software
like Aldus PageMaker including versions of Lorem Ipsum.
</div>

</div>

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
<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.js"></script>
<script src="plugins/datatables/dataTables.bootstrap4.js"></script>
<!-- SlimScroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>


<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
      <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
          <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
          <script src="dist/js/buttons.colVis.min.js"></script>
          <script src="dist/js/buttons.print.min.js"></script>
           <script src="dist/js/dataTables.select.min.js"></script>
           <script src="dist/js/buttons.flash.min.js"></script>


<!-- page script -->
<script>
   function format2(n, currency) {
    return currency + " " + n.toFixed(1).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
}
function formatmoneda(n, currency) {
    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
}
        $(document).ready(function() {
    $('#example').DataTable( {
         "searching": true,
        "ordering": true,
        "paging":   true,
        "info":     true,
        "aLengthMenu": [[100, 200, 300, -1], [100, 200, 300, "Todas"]],
    "pageLength": 100,


    } );
} );
    </script>
<script type="text/javascript">
      jQuery(function($) {

$('#cotizaciones thead tr:eq(1) th').each( function () {
        var title = $('#cotizaciones thead tr:eq(0) th').eq( $(this).index() ).text();
        $(this).html( '<input style="width:100%;border:black solid 1px;" type="text" placeholder=" '+title+'" />' );
    } );

    var table = $('#cotizaciones').DataTable({
      responsive:true,
      "ordering": true,
        "order": [[ 6, "asc" ]],
        orderCellsTop: true,
        "language": {
            "lengthMenu": "Mostrar _MENU_ registros por página",
            "zeroRecords": "No se ha encontrado nada - Lo sentimos",
            "info": "Mostrar página _PAGE_ de _PAGES_",
            "infoEmpty": "No hay registros disponibles",
           },

    "lengthMenu": [[5000, 7000, 10000, -1], [5000, 7000, 10000, "All"]],

          select: {
            style: 'multi'
          },
           "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;

            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };

          pageTotal1 = api
                .column( 1, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );

                $( api.column( 1 ).footer() ).html(
                ''+formatmoneda(pageTotal1,'' )
            );

        },

    });

    // Apply the search
    table.columns().every(function (index) {
        $('#cotizaciones thead tr:eq(1) th:eq(' + index + ') input').on('keyup change', function () {
            table.column($(this).parent().index() + ':visible')
                .search(this.value)
                .draw();
        });
    });

        var myTable =
        $('#cotizaciones')
        //.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
        .DataTable( {
retrieve: true,


          "aoColumns": [
            { "bSortable": false },
            null, null,null, null,null,null,null,null, null,null, null,null,null,null,null, null,null, null,null,null,null,
            { "bSortable": false }
          ],
          "aaSorting": [],
          "scrollX": true,


          } );


        $.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';

        new $.fn.dataTable.Buttons( myTable, {
         buttons: [

            {

            "extend": "excelHtml5",
            "text": "<i class='fa fa-file-excel-o bigger-110 green'></i> <span class='hidden'></span>",
            "className": "btn btn-white btn-primary btn-bold"

            },
            {

            "extend": "pdf",
            "text": "<i class='fa fa-file-pdf-o bigger-110 red'></i> <span class='hidden'></span>",
            "className": "btn btn-white btn-primary btn-bold",
            orientation: 'landscape',
                     pageSize: 'LEGAL',
            },
            
            
          ]
        } );
        myTable.buttons().container().appendTo( $('.tableTools-container') );



        setTimeout(function() {
          $($('.tableTools-container')).find('a.dt-button').each(function() {
            var div = $(this).find(' > div').first();
            if(div.length == 1) div.tooltip({container: 'body', title: div.parent().text()});
            else $(this).tooltip({container: 'body', title: $(this).text()});
          });
        }, 500);


      })
    </script>

    <script type="text/javascript">
      jQuery(function($) {

$('#cotizaciones2 thead tr:eq(1) th').each( function () {
        var title = $('#cotizaciones2 thead tr:eq(0) th').eq( $(this).index() ).text();
        $(this).html( '<input style="width:100%;border:black solid 1px;" type="text" placeholder=" '+title+'" />' );
    } );

    var table = $('#cotizaciones2').DataTable({
      responsive:true,
      "ordering": true,
        "order": [[ 6, "asc" ]],
        orderCellsTop: true,
        "language": {
            "lengthMenu": "Mostrar _MENU_ registros por página",
            "zeroRecords": "No se ha encontrado nada - Lo sentimos",
            "info": "Mostrar página _PAGE_ de _PAGES_",
            "infoEmpty": "No hay registros disponibles",
           },

    "lengthMenu": [[5000, 7000, 10000, -1], [5000, 7000, 10000, "All"]],

          select: {
            style: 'multi'
          },
           "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;

            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };

          pageTotal1 = api
                .column( 1, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );

                $( api.column( 1 ).footer() ).html(
                ''+formatmoneda(pageTotal1,'' )
            );

        },

    });

    // Apply the search
    table.columns().every(function (index) {
        $('#cotizaciones2 thead tr:eq(1) th:eq(' + index + ') input').on('keyup change', function () {
            table.column($(this).parent().index() + ':visible')
                .search(this.value)
                .draw();
        });
    });

        var myTable =
        $('#cotizaciones2')
        //.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
        .DataTable( {
retrieve: true,


          "aoColumns": [
            { "bSortable": false },
            null, null,null, null,null,null,null,null, null,null, null,null,null,null,null, null,null, null,null,null,null,
            { "bSortable": false }
          ],
          "aaSorting": [],
          "scrollX": true,


          } );


        $.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';

        new $.fn.dataTable.Buttons( myTable, {
         buttons: [

            {

            "extend": "excelHtml5",
            "text": "<i class='fa fa-file-excel-o bigger-110 green'></i> <span class='hidden'></span>",
            "className": "btn btn-white btn-primary btn-bold"

            },
            {

            "extend": "pdf",
            "text": "<i class='fa fa-file-pdf-o bigger-110 red'></i> <span class='hidden'></span>",
            "className": "btn btn-white btn-primary btn-bold",
            orientation: 'landscape',
                     pageSize: 'LEGAL',
            },
            
            
          ]
        } );
        myTable.buttons().container().appendTo( $('.tableTools-container2') );



        setTimeout(function() {
          $($('.tableTools-container2')).find('a.dt-button').each(function() {
            var div = $(this).find(' > div').first();
            if(div.length == 1) div.tooltip({container: 'body', title: div.parent().text()});
            else $(this).tooltip({container: 'body', title: $(this).text()});
          });
        }, 500);


      })
    </script>

