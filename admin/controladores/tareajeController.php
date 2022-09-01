<?php
class TareajeController
{
    public function __construct()
    {}

/*************************************************************/
/* FUNCION PARA MOSTRAR TODOS LLAMADO DESDE ROUTING.PHP*/
/*************************************************************/

    public function todos()
    {
        $campos = Tareaje::Reportetodos();
        require_once 'vistas/tareaje/todos.php';
    }

/*************************************************************/
/* FUNCION PARA AGREGAR NUEVO LLAMADO DESDE ROUTING.PHP */
/*************************************************************/
    public function nuevo()
    {
        require_once 'vistas/tareaje/nuevo.php';
    }

/*************************************************************/
/* FUNCION PARA MOSTRAR LA TRAZABILIDAD*/
/*************************************************************/

    public function trazabilidad()
    {

        (isset($_GET['iditem'])) ? $getitem = $_GET['iditem'] : $getitem = '';

        $campos = Tareaje::datostrazabilidad($getitem);
        require_once 'vistas/tareaje/trazabilidad.php';
    }
/*************************************************************/
/* FUNCION PARA MOSTRAR REPORTE POR RANGO DE FECHAS*/
/*************************************************************/

    public function porfecha()
    {

        if (isset($_POST['daterange'])) {
            $fechaform = $_POST['daterange'];
        } elseif (isset($_GET['daterange'])) {
            $fechaform = $_GET['daterange'];
        }
        $campos = Tareaje::Reporteporfecha();
        require_once 'vistas/tareaje/todos.php';
    }

/*************************************************************/
/* FUNCION PARA GUARDAR NUEVO REGISTRO */
/*************************************************************/
    public function guardar()
    {

        $variable     = $_POST;
        $nuevoarreglo = array();
        extract($variable);
        foreach ($variable as $campo => $valor) {
            //ELIMINAR CUALQUIER ETIQUETA <> PARA INYECCION SCRIPT
            $campo = strip_tags(trim($campo));
            $campo = htmlspecialchars($campo, ENT_QUOTES, 'UTF-8');

            $valor = strip_tags(trim($valor));
            $valor = htmlspecialchars($valor, ENT_QUOTES, 'UTF-8');
            if ($campo == "imagen2") {
                $nuevoarreglo[$campo] = $ruta_imagen;
            } else {
                $nuevoarreglo[$campo] = $valor;
            }
        }

        $fecha_reporte = $_POST['fecha_reporte'];

        $cadena         = explode(" al ", $fecha_reporte);
        $fecha_comienzo = $cadena[0];
        $fecha_final    = $cadena[1];

        $comienzo = new DateTime($fecha_comienzo);
        $final    = new DateTime($fecha_final);
// Necesitamos modificar la fecha final en 1 día para que aparezca en el bucle
        $final = $final->modify('+1 day');

        $intervalo = DateInterval::createFromDateString('1 day');
        $periodo   = new DatePeriod($comienzo, $intervalo, $final);

        foreach ($periodo as $dt) {
            $fechareporte           = $dt->format("Y-m-d");
            $conductor_id_conductor = $_POST['conductor_id_conductor'];
            $marca_temporal         = $_POST['marca_temporal'];
            $tipo_servicio          = $_POST['tipo_servicio'];
            $estado_tareaje         = $_POST['estado_tareaje'];
            $creado_por             = $_POST['creado_por'];
            $nomconductor           = Tareaje::obtenerNombreUsuario($conductor_id_conductor);

            $Mensaje = ("Servicio Asignado  " . $tipo_servicio . " a conductor " . $nomconductor . ".");

            $validarduplicado = Tareaje::validacionpor($fechareporte, $conductor_id_conductor);

            if ($validarduplicado > 0) {
                echo "<script>jQuery(function(){Swal.fire(\"¡Error al guardar!\", \"No se han guardado los datos, el conductor " . $nomconductor . " ya tiene un servicio asignado el día. " . $fechareporte . "\", \"info\").then(function(){window.location='?controller=tareaje&&action=nuevo';});});</script>";
            } else {

                $campo = new Tareaje('', $nuevoarreglo);
                $res   = Tareaje::guardar($campo, $fechareporte);

                $obtenerultimoid = Tareaje::obtenerUltimo();

                $registrotrazabilidad = Tareaje::guardartrazabilidad($fechareporte, $creado_por, $estado_tareaje, $obtenerultimoid, $Mensaje, $marca_temporal);

                if ($res) {
                    //echo "<script>jQuery(function(){Swal.fire(\"¡Datos guardados!\", \"Se han guardado correctamente los datos\", \"success\");});</script>";
                    echo "<script>jQuery(function(){Swal.fire(\"¡Datos actualizados!\", \"Se ha actualizado correctamente la pagina\", \"success\").then(function(){window.location='?controller=tareaje&&action=nuevo';});});</script>";
                } else {
                    echo "<script>jQuery(function(){Swal.fire(\"¡Erro al guardar!\", \"No se han guardado correctamente los datos\", \"error\");});</script>";
                }
            }

        }

        //$this->shownew();

    }

/*************************************************************/
/* FUNCION PARA ELIMINAR  LLAMADO DESDE ROUTING.PHP*/
/*************************************************************/
    public function eliminar()
    {
        $id  = $_GET['id'];
        $res = Tareaje::eliminarPor($id);
        if ($res) {
            echo "<script>jQuery(function(){Swal.fire(\"¡Datos eliminados!\", \"Se han eliminado correctamente los datos\", \"success\");});</script>";
        } else {
            echo "<script>jQuery(function(){Swal.fire(\"¡Error al eliminar!\", \"No se han eliminado correctamente los datos\", \"error\");});</script>";
        }
        $campos = Tareaje::Reportetodos();
        require_once 'vistas/tareaje/todos.php';
    }

/*************************************************************/
/* FUNCION PARA MODIFICAR  LLAMADO DESDE ROUTING.PHP*/
/*************************************************************/
    public function editar()
    {
        $id        = $_GET['id'];
        $vereditar = $_GET['vereditar'];
        $campos    = Tareaje::editarPor($id);
        require_once 'vistas/tareaje/editar.php';
    }

/*************************************************************/
/* FUNCION PARA ACTUALIZAR*/
/*************************************************************/
    public function aceptarservicio()
    {
        $obtenerultimoid = $_GET['id'];
        $conductor       = $_GET['conductor'];
        $marca_temporal  = date('Y-m-d H:m:s');
        $fechareporte    = date('Y-m-d');
        $Mensaje         = ("Servicio confirmado y aceptado por conductor");
        $estado_tareaje  = 2;

        $res = Tareaje::cambiarestadoPor($obtenerultimoid, $estado_tareaje);
        $res = Tareaje::guardartrazabilidad($fechareporte, $conductor, $estado_tareaje, $obtenerultimoid, $Mensaje, $marca_temporal);

        if ($res) {
            echo "<script>jQuery(function(){Swal.fire(\"¡Error al actualizar!\", \"Hubo un error al actualizar, comunique con el administrador del sistema\", \"error\");});</script>";

        } else {
            echo "<script>jQuery(function(){Swal.fire(\"¡Datos actualizados!\", \"Se ha actualizado correctamente la pagina\", \"success\").then(function(){window.location='?controller=index&&action=index';});});</script>";
        }
        //$this->show();
    }

/*************************************************************/
/* FUNCION PARA ACTUALIZAR*/
/*************************************************************/
    public function actualizarservicio()
    {
        $idservicio      = $_POST['idservicio'];
        $conductor       = $_POST['creado_por'];
        $origen          = $_POST['origen'];
        $destino         = $_POST['destino'];
        $hora_inicio     = $_POST['hora_inicio'];
        $hora_final      = $_POST['hora_final'];
        $km_inicial      = $_POST['km_inicial'];
        $km_final        = $_POST['km_final'];
        $total_km        = round($km_final, 2) - round($km_inicial, 2);
        $nuevohorainicio = date("H:i", strtotime($hora_inicio));
        $nuevohorafinal  = date("H:i", strtotime($hora_final));

        $marca_temporal = date('Y-m-d H:m:s');
        $fechareporte   = date('Y-m-d');
        $Mensaje        = ("Servicio actualizado por conductor con hora inicial: " . $nuevohorainicio . ", hora final :" . $nuevohorafinal . " kilometraje Inicial :" . $km_inicial . " Km Final : " . $km_final . " total recorrido : " . $total_km."kilometros.");
        $estado_tareaje = 4;

        $res = Tareaje::actualizardatosservicio($origen, $destino, $km_inicial, $km_final, $nuevohorainicio, $nuevohorafinal, $total_km, $idservicio);
        $res = Tareaje::cambiarestadoPor($idservicio, $estado_tareaje);
        $res = Tareaje::guardartrazabilidad($fechareporte, $conductor, $estado_tareaje, $idservicio, $Mensaje, $marca_temporal);

        if ($res) {
            echo "<script>jQuery(function(){Swal.fire(\"¡Error al actualizar!\", \"Hubo un error al actualizar, comunique con el administrador del sistema\", \"error\");});</script>";

        } else {
            echo "<script>jQuery(function(){Swal.fire(\"¡Datos actualizados!\", \"Se ha actualizado correctamente la pagina\", \"success\").then(function(){window.location='?controller=index&&action=index';});});</script>";
        }
        //$this->show();
    }

/*************************************************************/
/* FUNCION PARA ACTUALIZAR*/
/*************************************************************/
    public function actualizar()
    {

        $id           = $_GET['id'];
        $variable     = $_POST;
        $nuevoarreglo = array();
        extract($variable);
        foreach ($variable as $campo => $valor) {
            //ELIMINAR CUALQUIER ETIQUETA <> PARA INYECCION SCRIPT
            $campo = strip_tags(trim($campo));
            $campo = htmlspecialchars($campo, ENT_QUOTES, 'UTF-8');

            $valor = strip_tags(trim($valor));
            $valor = htmlspecialchars($valor, ENT_QUOTES, 'UTF-8');
            if ($campo == "imagen") {
                $nuevoarreglo[$campo] = $ruta_imagen;
            } else {
                $nuevoarreglo[$campo] = $valor;
            }

        }
        $datosguardar = new Tareaje($id, $nuevoarreglo);
        $res          = Tareaje::actualizar($id, $datosguardar);
        if ($res) {
            echo "<script>jQuery(function(){Swal.fire(\"¡Datos actualizados!\", \"Se ha actualizado correctamente la pagina\", \"success\");});</script>";
        } else {
            echo "<script>jQuery(function(){Swal.fire(\"¡Error al actualizar!\", \"Hubo un error al actualizar, comunique con el administrador del sistema\", \"error\");});</script>";
        }
        $this->show();
    }
/*************************************************************/
/* FUNCION PARA MOSTRAR LA PAGINA*/
/*************************************************************/
    public function show()
    {
        $campos = Tareaje::Reportetodos();
        require_once 'vistas/tareaje/todos.php';
    }

    public function shownew()
    {
        $campos = Tareaje::Reportetodos();
        require_once 'vistas/tareaje/nuevo.php';
    }

/*************************************************************/
/* FUNCION PARA SUBIR UN ARCHIVO  */
/*************************************************************/

    public function subir_fichero($directorio_destino, $nombre_fichero)
    {
        $tmp_name = $_FILES[$nombre_fichero]['tmp_name'];
        //si hemos enviado un directorio que existe realmente y hemos subido el archivo
        if (is_dir($directorio_destino) && is_uploaded_file($tmp_name)) {
            $img_file   = $_FILES[$nombre_fichero]['name'];
            $Aleaotorio = rand(0, 99999);
            $img_file   = $Aleaotorio . $img_file;
            $img_type   = $_FILES[$nombre_fichero]['type'];
            // Si se trata de una imagen
            if (((strpos($img_type, "gif") || strpos($img_type, "jpeg") || strpos($img_type, "jpg")) || strpos($img_type, "png"))) {
                //¿Tenemos permisos para subir la imágen?
                if (move_uploaded_file($tmp_name, $directorio_destino . '/' . $img_file)) {
                    $retornar = $directorio_destino . '/' . $img_file; //RETORNAMOS EL NOMBRE Y RUTA DEL FICHERO
                    return $retornar;
                }
            } else {
                if (move_uploaded_file($tmp_name, $directorio_destino . '/' . $img_file)) {
                    $retornar = $directorio_destino . '/' . $img_file; //RETORNAMOS EL NOMBRE Y RUTA DEL FICHERO
                    return $retornar;
                }
            }
        }
        //Si llegamos hasta aquí es que algo ha fallado
        $vacio = '';
        return $vacio;
    }

}
