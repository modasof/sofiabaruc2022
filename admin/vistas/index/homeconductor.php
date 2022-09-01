<!-- Content Wrapper. Contains page content -->
<?php
error_reporting(E_ALL);
ini_set('display_errors', '0');

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

$RolSesion = $_SESSION['IdRol'];
$IdSesion  = $_SESSION['IdUser'];

$idcajaporuser             = Ingresos::obtenerIdcajaporUser($IdSesion);
$_SESSION['idcajaporuser'] = $idcajaporuser;

date_default_timezone_set("America/Bogota");
$totaldiasmes  = date('t');
$anoactual     = date('Y');
$mesactual     = date('n');
$hoy           = date('d');
$MarcaTemporal = date('Y-m-d');

// Fecha del día
$FechaInicioDiaActual = ($MarcaTemporal . " 00:00:000");
$FechaFinalDiaActual  = ($MarcaTemporal . " 23:59:000");

// Total Días del mes
$primerdiames = $anoactual . "-" . $mesactual . "-01";
$ultimodiames = $anoactual . "-" . $mesactual . "-" . $totaldiasmes;

// Fecha inicio y fin de mes actual
$FechaInicioMes = ($primerdiames . " 00:00:000");
$FechaFinalMes  = ($ultimodiames . " 23:59:000");

$quincedias        = date("Y-m-d", strtotime($fecha_actual . "- 4 week"));
$FechaInicio30dias = $quincedias . " 00:00:0000";
$FechaFinal30dias  = $anoactual . "-" . $mesactual . "-" . $hoy . " 23:59:0000";

$consumoporconductor = ConsumoCombustiblediaUsuario($FechaInicio30dias, $FechaFinal30dias, $IdSesion);
$gastoporconductor   = GastoCombustiblediaUsuario($FechaInicio30dias, $FechaFinal30dias, $IdSesion);

?>


  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        DashBoard Perfil Conductor
        <small>version 1.0</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
     <div class="row">


    <div class="col-md-12 col-xs-12">
      <?php
if ($idcajaporuser == "") {
    ?>
         <a href="">
        <div style="display: none;"  class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-default"><i class="fa fa-dollar"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Usuario</span>
              <span class="info-box-number">Sin Caja</span><br>
              <span class="info-box-number">Asignada </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </a>

        <?php
} else {
    ?>
         <a href="?controller=index&&action=micajamenor&&id_caja=<?php echo ($idcajaporuser); ?>">
        <div style="display: none;"  class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-default"><i class="fa fa-dollar"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Ver mi </span>
              <span class="info-box-number">Caja</span><br>
              <span class="info-box-number">Menores</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </a>
        <?php
}

?>

      <a href="?controller=reportes&&action=combustibles">
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-default"><i class="fa fa-train"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Registro </span>
              <span class="info-box-number">Combustible </span><small>últimos 30 días</small>
              <span class="info-box-number"><?php echo round(($consumoporconductor), 1); ?> GL. // <?php echo ("$" . number_format($gastoporconductor, 0)) ?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </a>


     </div>

</div>
<div class="row">

  <?php

# =====================================================
# =           Parametrización de Fechas Tab  1         =
# =====================================================
$hoy              = date('Y-m-d');
$InicioDia        = ($hoy . " 00:00:000");
$FinalDia         = ($hoy . " 23:59:000");
$estadoasignado   = 1;
$estadoencurso    = 2;
$estadofinalizado = 8;
# ======  End of Parametrización de Fechas Tab  =======

?>

  <?php

# =====================================================
# =           Parametrización de Fechas Tab 2           =
# =====================================================
$hoy              = date('Y-m-d');
$InicioDia        = ($hoy . " 00:00:000");
$FinalDia         = ($hoy . " 23:59:000");
$estadoasignado   = 1;
$estadoencurso    = 2;
$estadofinalizado = 8;
# ======  End of Parametrización de Fechas Tab  =======

?>

 <?php

# =====================================================
# =           Parametrización de Fechas Tab 3          =
# =====================================================

$anoactual= date('Y');
$totaldiasmes= date('t');
$mesactual= date('n');
$primerdiamescons=$anoactual."-".$mesactual."-01 00:00:000";
$ultimodiamescons=$anoactual."-".$mesactual."-".$totaldiasmes." 23:59:000";
$estadoasignado   = 1;
$estadoencurso    = 2;
# ======  End of Parametrización de Fechas Tab  =======

?>

  <div class="col-md-12 col-xs-12">

<div class="nav-tabs-custom">
<ul class="nav nav-tabs">
<li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">Hoy
<?php 
$totalasignados= contarserviciosestadoconductor($estadoasignado,$InicioDia,$FinalDia,$IdSesion);
  echo("<strong class='text-dark'>(".$totalasignados.")</strong>");
 ?>
</a></li>
<li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false">Cerrar Servicio
<?php 
$totalporcerrar= contarserviciosestadoconductor($estadoencurso,$InicioDia,$FinalDia,$IdSesion);
   echo("<strong class='text-dark'>(".$totalporcerrar.")</strong>");
 ?>
</a></li>
<li class=""><a href="#tab_3" data-toggle="tab" aria-expanded="false">Programación
<?php 
$totalmesasignados= contarserviciosestadoconductor($estadoasignado,$primerdiamescons,$ultimodiamescons,$IdSesion);
 echo("<strong class='text-success'>(".$totalmesasignados.")</strong>");
 ?>
</a></li>
</ul>
<div class="tab-content">
<div class="tab-pane active" id="tab_1">


   <?php
$res    = Tareaje::ReporteporfechaConductor($InicioDia, $FinalDia, $IdSesion, $estadoasignado);
$campos = $res->getCampos();

foreach ($campos as $campo) {
    $id                     = $campo['id_tareaje'];
    $cliente_id_cliente     = $campo['cliente_id_cliente'];
    $operador_id_operador   = $campo['operador_id_operador'];
    $equipo_id_equipo       = $campo['equipo_id_equipo'];
    $conductor_id_conductor = $campo['conductor_id_conductor'];
    $fecha_reporte          = $campo['fecha_reporte'];
    $origen                 = $campo['origen'];
    $destino                = $campo['destino'];
    $observaciones          = $campo['observaciones'];
    $solicitado_por         = $campo['solicitado_por'];
    $contacto               = $campo['contacto'];
    $creado_por             = $campo['creado_por'];
    $marca_temporal         = $campo['marca_temporal'];
    $estado_tareaje         = $campo['estado_tareaje'];
    $tareaje_publicado      = $campo['tareaje_publicado'];
    $valor_servicio         = $campo['valor_servicio'];
    $estado_facturado       = $campo['estado_facturado'];
    $tipo_servicio          = $campo['tipo_servicio'];

    $nomcliente   = Clientes::obtenerNombreCliente($cliente_id_cliente);
    $nomconductor = Usuarios::obtenerNombreUsuario($conductor_id_conductor);
    $nomcreado    = Usuarios::obtenerNombreUsuario($creado_por);
    $nomoperador  = Operadores::obtenerNombre($operador_id_operador);
    $nomequipo    = Equipos::obtenerNombreEquipo($equipo_id_equipo);
    $estadoactual = Tareaje::obtenerNombreEstado($estado_tareaje);
    $coloractual  = Tareaje::obtenerColorEstado($estado_tareaje);

    ?>

<div class="box box-success direct-chat direct-chat-success">
<div class="box-header with-border">
<h3 class="box-title">Servicio Nº S-00<?php echo ($id); ?></h3>
<div class="box-tools pull-right">

<strong>Fecha:</strong><?php echo utf8_encode($fecha_reporte); ?>
</div>
</div>

<div class="box-body">

<div class="direct-chat-messages">

<div class="direct-chat-msg">
<div class="direct-chat-info clearfix">
<span class="direct-chat-name pull-left"><strong>Registrado por: </strong><?php echo utf8_encode($nomcreado); ?></span>
<span class="direct-chat-timestamp pull-right"><?php echo ($marca_temporal); ?></span>
</div>
<div class="direct-chat-text">
<strong>Operadora:</strong> <?php echo utf8_encode($nomoperador); ?> <br>
<strong>Cliente:</strong> <?php echo utf8_encode($nomcliente); ?> <br>
<strong>Usuario:</strong> <?php echo utf8_encode($solicitado_por); ?> <br>
<strong>Tel:</strong> <?php echo utf8_encode($contacto); ?> <br>
<strong>Punto Partida:</strong> <?php echo utf8_encode($origen); ?> <br>
<strong>Placa:</strong> <?php echo utf8_encode($nomequipo); ?> <br>
</div>

</div>

</div>

</div>


<div class="direct-chat-contacts">

<a href="#" onclick="aceptar(<?php echo $id; ?>,<?php echo $IdSesion; ?>);" class="btn btn-success">
Aceptar Servicio
</a>


<a style="display: none;" href="#" class="btn btn-danger">
Cancelar Servicio
</a>
</div>

</div>

<script>
function aceptar(id,usuario){
   eliminar=confirm("¿Acepta prestar este servicio?");
   if (eliminar)
    window.location.href="?controller=tareaje&&action=aceptarservicio&&id="+id+"&&conductor="+usuario;
else
  //Y aquí pon cualquier cosa que quieras que salga si le diste al boton de cancelar
    alert('No se ha confirmado la aceptación del servicio...')
}
</script>

<?php }?>

</div>

<div class="tab-pane" id="tab_2">



   <?php
$res    = Tareaje::ReporteporfechaConductor($InicioDia, $FinalDia, $IdSesion, $estadoencurso);
$campos = $res->getCampos();

foreach ($campos as $campo) {
    $id                     = $campo['id_tareaje'];
    $cliente_id_cliente     = $campo['cliente_id_cliente'];
    $operador_id_operador   = $campo['operador_id_operador'];
    $equipo_id_equipo       = $campo['equipo_id_equipo'];
    $conductor_id_conductor = $campo['conductor_id_conductor'];
    $fecha_reporte          = $campo['fecha_reporte'];
    $origen                 = $campo['origen'];
    $destino                = $campo['destino'];
    $observaciones          = $campo['observaciones'];
    $solicitado_por         = $campo['solicitado_por'];
    $contacto               = $campo['contacto'];
    $creado_por             = $campo['creado_por'];
    $marca_temporal         = $campo['marca_temporal'];
    $estado_tareaje         = $campo['estado_tareaje'];
    $tareaje_publicado      = $campo['tareaje_publicado'];
    $valor_servicio         = $campo['valor_servicio'];
    $estado_facturado       = $campo['estado_facturado'];
    $tipo_servicio          = $campo['tipo_servicio'];

    $nomcliente   = Clientes::obtenerNombreCliente($cliente_id_cliente);
    $nomconductor = Usuarios::obtenerNombreUsuario($conductor_id_conductor);
    $nomcreado    = Usuarios::obtenerNombreUsuario($creado_por);
    $nomoperador  = Operadores::obtenerNombre($operador_id_operador);
    $nomequipo    = Equipos::obtenerNombreEquipo($equipo_id_equipo);
    $estadoactual = Tareaje::obtenerNombreEstado($estado_tareaje);
    $coloractual  = Tareaje::obtenerColorEstado($estado_tareaje);

    ?>
<form method="post" action="?controller=tareaje&&action=actualizarservicio">
  <input type="hidden" value="<?php echo($id); ?>" name="idservicio">
  <input type="hidden" value="<?php echo($IdSesion); ?>" name="creado_por">
<div class="box box-success direct-chat direct-chat-success">
<div class="box-header with-border">
<h3 class="box-title">Servicio Nº S-00<?php echo ($id); ?></h3>
<div class="box-tools pull-right">

<strong>Fecha:</strong><?php echo utf8_encode($fecha_reporte); ?>
</div>
</div>

<div class="box-body">

<div class="direct-chat-messages">

<div class="direct-chat-msg">
<div class="direct-chat-info clearfix">
<span class="direct-chat-name pull-left"><strong>Registrado por: </strong><?php echo utf8_encode($nomcreado); ?></span>
<span class="direct-chat-timestamp pull-right"><?php echo ($marca_temporal); ?></span>
</div>
<div class="direct-chat-text">
<strong>Operadora:</strong> <?php echo utf8_encode($nomoperador); ?> <br>
<strong>Cliente:</strong> <?php echo utf8_encode($nomcliente); ?> <br>
<strong>Usuario:</strong> <?php echo utf8_encode($solicitado_por); ?> <br>
<strong>Tel:</strong> <?php echo utf8_encode($contacto); ?> <br>
<strong>Punto Partida:</strong> <?php echo utf8_encode($origen); ?> <br>
<strong>Placa:</strong> <?php echo utf8_encode($nomequipo); ?> <br>
</div>

</div>

</div>

</div>


<div class="direct-chat-contacts">
<h3>Diligenciar Datos</h3>
<hr>
        <div class="form-group">
                    <label for="nombres">Punto Partida</label>
                    <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-check"></i></span>
                <input type="text" name="origen" value="" class="form-control" id="origen" placeholder="Ingrese el punto inicial" maxlength="150" required autocomplete="off">
              </div>   
        </div>
         <div class="form-group">
                    <label for="nombres">Punto Final</label>
                    <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-check"></i></span>
                <input type="text" name="destino" value="" class="form-control" id="origen" placeholder="Ingrese el punto final" maxlength="150" required autocomplete="off">
              </div>   
        </div>
        <div class="bootstrap-timepicker">
<div class="form-group">
<label>Hora Inicial:</label>
<div class="input-group">
<input type="text" name="hora_inicio" id="horainicial" class="form-control timepicker">
<div class="input-group-addon">
<i class="fa fa-clock-o"></i>
</div>
</div>

</div>

</div>

 

<div class="bootstrap-timepicker">
<div class="form-group">
<label>Hora Final:</label>
<div class="input-group">
<input type="text" class="form-control timepicker" name="hora_final">
<div class="input-group-addon">
<i class="fa fa-clock-o"></i>
</div>
</div>

</div>

</div>
                        <div class="form-group">
                          <label>Kilometra Inicial<span>*</span></label>
                          <input type="number" step="any" name="km_inicial" placeholder="Horómetro Inicial" class="form-control" required value="">
                          <small>Decimales separados con punto</small>
                        </div>


  <div class="form-group">
                          <label>Kilometraje Final<span>*</span></label>
                          <input type="number" step="any" name="km_final" placeholder="Horómetro Inicial" class="form-control" required value="">
                          <small>Decimales separados con punto</small>
  </div>

  <div class="card-footer">
                  <button name="Submit" type="submit" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" title="Haz clic aqui para guardar la información">Cerrar Servicio S-00<?php echo utf8_encode($id) ?></button>
                </div>




</div>

</div>
<script>
  $(function () {
    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false,
      interval :30,
    });
  });
</script>
</form>

<?php }?>
</div>

<div class="tab-pane" id="tab_3">




   <?php
$res    = Tareaje::ReporteporfechaConductor($primerdiamescons, $ultimodiamescons, $IdSesion, $estadoasignado);
$campos = $res->getCampos();

foreach ($campos as $campo) {
    $id                     = $campo['id_tareaje'];
    $cliente_id_cliente     = $campo['cliente_id_cliente'];
    $operador_id_operador   = $campo['operador_id_operador'];
    $equipo_id_equipo       = $campo['equipo_id_equipo'];
    $conductor_id_conductor = $campo['conductor_id_conductor'];
    $fecha_reporte          = $campo['fecha_reporte'];
    $origen                 = $campo['origen'];
    $destino                = $campo['destino'];
    $observaciones          = $campo['observaciones'];
    $solicitado_por         = $campo['solicitado_por'];
    $contacto               = $campo['contacto'];
    $creado_por             = $campo['creado_por'];
    $marca_temporal         = $campo['marca_temporal'];
    $estado_tareaje         = $campo['estado_tareaje'];
    $tareaje_publicado      = $campo['tareaje_publicado'];
    $valor_servicio         = $campo['valor_servicio'];
    $estado_facturado       = $campo['estado_facturado'];
    $tipo_servicio          = $campo['tipo_servicio'];

    $nomcliente   = Clientes::obtenerNombreCliente($cliente_id_cliente);
    $nomconductor = Usuarios::obtenerNombreUsuario($conductor_id_conductor);
    $nomcreado    = Usuarios::obtenerNombreUsuario($creado_por);
    $nomoperador  = Operadores::obtenerNombre($operador_id_operador);
    $nomequipo    = Equipos::obtenerNombreEquipo($equipo_id_equipo);
    $estadoactual = Tareaje::obtenerNombreEstado($estado_tareaje);
    $coloractual  = Tareaje::obtenerColorEstado($estado_tareaje);

    ?>

<div class="box box-success direct-chat direct-chat-success">
<div class="box-header with-border">
<h3 class="box-title">Servicio Nº S-00<?php echo ($id); ?></h3>
<div class="box-tools pull-right">

<strong>Fecha:</strong><?php echo utf8_encode($fecha_reporte); ?>
</div>
</div>

<div class="box-body">

<div class="direct-chat-messages">

<div class="direct-chat-msg">
<div class="direct-chat-info clearfix">
<span class="direct-chat-name pull-left"><strong>Registrado por: </strong><?php echo utf8_encode($nomcreado); ?></span>
<span class="direct-chat-timestamp pull-right"><?php echo ($marca_temporal); ?></span>
</div>
<div class="direct-chat-text">
<strong>Operadora:</strong> <?php echo utf8_encode($nomoperador); ?> <br>
<strong>Cliente:</strong> <?php echo utf8_encode($nomcliente); ?> <br>
<strong>Usuario:</strong> <?php echo utf8_encode($solicitado_por); ?> <br>
<strong>Tel:</strong> <?php echo utf8_encode($contacto); ?> <br>
<strong>Punto Partida:</strong> <?php echo utf8_encode($origen); ?> <br>
<strong>Placa:</strong> <?php echo utf8_encode($nomequipo); ?> <br>
</div>

</div>

</div>

</div>


</div>


<?php }?>
</div>

</div>

</div>

</div>



</div>

    </section>
    <!-- /.content -->
  </div>

  <!-- /.content-wrapper -->
  <script>
function eliminar(id){
   eliminar=confirm("¿Deseas eliminar este registro?");
   if (eliminar)
     window.location.href="?controller=reportes&&action=eliminardespachoclientes&&id="+id;
else
  //Y aquí pon cualquier cosa que quieras que salga si le diste al boton de cancelar
    alert('No se ha podido eliminar el registro...')
}
</script>
<!-- Inicio Libreria formato moneda -->

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
  $(function () {
    $('#cotizaciones33').DataTable({
      "paging": true,
      "lengthChange": true,
      "lengthMenu": [[25, 50, 150, -1], [25, 50, 150, "All"]],
      "searching": true,
      "order": [[ 0, "asc" ]],
      "ordering": true,
      "info": true,
      "autoWidth": false,
    language: {
    "sProcessing":     "Procesando...",
    "sLengthMenu":     "Mostrar _MENU_ registros",
    "sZeroRecords":    "No se encontraron resultados",
    "sEmptyTable":     "Ningún dato disponible en esta tabla",
    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
    "sInfoPostFix":    "",
    "sSearch":         "Buscar:",
    "sUrl":            "",
    "sInfoThousands":  ",",
    "sLoadingRecords": "Cargando...",
    "oPaginate": {
        "sFirst":    "Primero",
        "sLast":     "Último",
        "sNext":     "Siguiente",
        "sPrevious": "Anterior"
    },
    "oAria": {
        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
    }
}

    });
  });
</script>
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
        "order": [[ 1, "desc" ]],
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


            // Total over all pages



              pageTotal3 = api
                .column( 3, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );

             pageTotal4 = api
                .column( 4, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );

             // Update footer



              $( api.column( 3 ).footer() ).html(
                ''+formatmoneda(pageTotal3,'m3' )
            );
               $( api.column( 4 ).footer() ).html(
                '$'+formatmoneda(pageTotal4,'' )
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

          //"bProcessing": true,
              //"bServerSide": true,
              //"sAjaxSource": "http://127.0.0.1/table.php" ,

          //,

          //"sScrollXInner": "120%",
          //"bScrollCollapse": true,
          //Note: if you are applying horizontal scrolling (sScrollX) on a ".table-bordered"
          //you may want to wrap the table inside a "div.dataTables_borderWrap" element

          //"iDisplayLength": 50


          } );





        $.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';

        new $.fn.dataTable.Buttons( myTable, {
         buttons: [


            {
            "extend": "csv",
            "text": "<i class='fa fa-database bigger-110 orange'></i> <span class='hidden'></span>",
            "className": "btn btn-white btn-primary btn-bold"
            },
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
            {
            "extend": "print",
            "text": "<i class='fa fa-print bigger-110 grey'></i> <span class='hidden'></span>",
            "className": "btn btn-white btn-primary btn-bold",
            autoPrint: true,
            message: 'Está impresión se produjo desde la App'
            }
          ]
        } );
        myTable.buttons().container().appendTo( $('.tableTools-container') );

        // style the message box
        // var defaultCopyAction = myTable.button(1).action();
        // myTable.button(1).action(function (e, dt, button, config) {
        //   defaultCopyAction(e, dt, button, config);
        //   $('.dt-button-info').addClass('gritter-item-wrapper gritter-info gritter-center white');
        // });




        // var defaultColvisAction = myTable.button(0).action();
        // myTable.button(0).action(function (e, dt, button, config) {

        //   defaultColvisAction(e, dt, button, config);


        //   if($('.dt-button-collection > .dropdown-menu').length == 0) {
        //     $('.dt-button-collection')
        //     .wrapInner('<ul class="dropdown-menu dropdown-light " />')
        //     .find('a').attr('href', '#').wrap("<li />")
        //   }
        //   $('.dt-button-collection').appendTo('.tableTools-container .dt-buttons')
        // });

        //

        setTimeout(function() {
          $($('.tableTools-container')).find('a.dt-button').each(function() {
            var div = $(this).find(' > div').first();
            if(div.length == 1) div.tooltip({container: 'body', title: div.parent().text()});
            else $(this).tooltip({container: 'body', title: $(this).text()});
          });
        }, 500);





        myTable.on( 'select', function ( e, dt, type, index ) {
          if ( type === 'row' ) {
            $( myTable.row( index ).node() ).find('input:checkbox').prop('checked', true);
          }
        } );
        myTable.on( 'deselect', function ( e, dt, type, index ) {
          if ( type === 'row' ) {
            $( myTable.row( index ).node() ).find('input:checkbox').prop('checked', false);
          }
        } );






        /////////////////////////////////
        //table checkboxes
        $('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);

        //select/deselect all rows according to table header checkbox
        $('#cotizaciones > thead > tr > th input[type=checkbox], #cotizaciones_wrapper input[type=checkbox]').eq(0).on('click', function(){
          var th_checked = this.checked;//checkbox inside "TH" table header

          $('#cotizaciones').find('tbody > tr').each(function(){
            var row = this;
            if(th_checked) myTable.row(row).select();
            else  myTable.row(row).deselect();
          });
        });

        //select/deselect a row when the checkbox is checked/unchecked
        $('#cotizaciones').on('click', 'td input[type=checkbox]' , function(){
          var row = $(this).closest('tr').get(0);
          if(this.checked) myTable.row(row).deselect();
          else myTable.row(row).select();
        });



        $(document).on('click', '#cotizaciones .dropdown-toggle', function(e) {
          e.stopImmediatePropagation();
          e.stopPropagation();
          e.preventDefault();
        });



        //And for the first simple table, which doesn't have TableTools or dataTables
        //select/deselect all rows according to table header checkbox
        var active_class = 'active';
        $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
          var th_checked = this.checked;//checkbox inside "TH" table header

          $(this).closest('table').find('tbody > tr').each(function(){
            var row = this;
            if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
            else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
          });
        });

        //select/deselect a row when the checkbox is checked/unchecked
        $('#simple-table').on('click', 'td input[type=checkbox]' , function(){
          var $row = $(this).closest('tr');
          if($row.is('.detail-row ')) return;
          if(this.checked) $row.addClass(active_class);
          else $row.removeClass(active_class);
        });



        /********************************/
        //add tooltip for small view action buttons in dropdown menu
        $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});

        //tooltip placement on right or left
        function tooltip_placement(context, source) {
          var $source = $(source);
          var $parent = $source.closest('table')
          var off1 = $parent.offset();
          var w1 = $parent.width();

          var off2 = $source.offset();
          //var w2 = $source.width();

          if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
          return 'left';
        }




        /***************/
        $('.show-details-btn').on('click', function(e) {
          e.preventDefault();
          $(this).closest('tr').next().toggleClass('open');
          $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
        });
        /***************/


      })
    </script>
