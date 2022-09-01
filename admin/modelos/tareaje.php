<?php
/**
 * CLASE PARA TRABAJAR CON LAS MARCAS
 */
class Tareaje
{
    private $id;
    private $campos; //devuelve todos los campos de la tabla

    public function __construct($id, $campos)
    {
        $this->setId($id);
        $this->setCampos($campos);
    }
    /************************************************************************************
     ** FUNCIONES PARA ESTABLECER Y OBTENER LAS VARIABLES DE LA TABLA       ***
    /***********************************************************************************/
    //ESTABLECER Y OBTENER ID
    public function getId()
    {
        return $this->id;
    }
    public function setId($id)
    {
        //Establece el nuevo valor del campo
        $this->id = $id;
    }

    //ESTABLECER Y OBTENER LOS CAMPOS
    public function getCampos()
    {
        return $this->campos;
    }
    public function setCampos($campos)
    {
        //Establece el nuevo valor del campo
        $this->campos = $campos;
    }

/*******************************************************
 ** FUNCION PARA MOSTRAR TODOS LOS CAMPOS DE FECHAS      **
 ********************************************************/
    public static function Reportetodos()
    {
        try {
            $db = Db::getConnect();

            $select  = $db->query("SELECT * FROM tareaje WHERE tareaje_publicado='1' order by fecha_reporte DESC");
            $camposs = $select->fetchAll();
            $campos  = new Tareaje('', $camposs);
            return $campos;
        } catch (PDOException $e) {
            echo '{"error en obtener la pagina":{"text":' . $e->getMessage() . '}}';
        }
    }


     /*******************************************************
** FUNCION PARA MOSTRAR EL NOMBRE DEL PRODUCTO **
********************************************************/
public static function validacionpor($fechareporte,$conductor_id_conductor){
	try {
		$db=Db::getConnect();

		$select=$db->query("SELECT COUNT(id_tareaje) AS total FROM tareaje WHERE fecha_reporte='".$fechareporte."' and conductor_id_conductor='".$conductor_id_conductor."' and estado_tareaje='1'");
    	$camposs=$select->fetchAll();
    	$campos = new Tareaje('',$camposs);
    	$marcas = $campos->getCampos();
		foreach($marcas as $marca){
			$mar = $marca['total'];
		}
		return $mar;
	}
	catch(PDOException $e) {
		echo '{"error en obtener la pagina":{"text":'. $e->getMessage() .'}}';
	}
}

/*******************************************************
** FUNCION PARA MOSTRAR EL NOMBRE DEL PRODUCTO **
********************************************************/
public static function obtenerColorEstado($id){
    try {
        $db=Db::getConnect();

        $select=$db->query("SELECT color FROM estados_tareaje WHERE id='".$id."'");
        $camposs=$select->fetchAll();
        $campos = new Tareaje('',$camposs);
        $marcas = $campos->getCampos();
        foreach($marcas as $marca){
            $mar = $marca['color'];
        }
        return $mar;
    }
    catch(PDOException $e) {
        echo '{"error en obtener la pagina":{"text":'. $e->getMessage() .'}}';
    }
}

/*******************************************************
** FUNCION PARA MOSTRAR EL NOMBRE DEL PRODUCTO **
********************************************************/
public static function obtenerNombreEstado($id){
    try {
        $db=Db::getConnect();

        $select=$db->query("SELECT nombre FROM estados_tareaje WHERE id='".$id."'");
        $camposs=$select->fetchAll();
        $campos = new Tareaje('',$camposs);
        $marcas = $campos->getCampos();
        foreach($marcas as $marca){
            $mar = $marca['nombre'];
        }
        return $mar;
    }
    catch(PDOException $e) {
        echo '{"error en obtener la pagina":{"text":'. $e->getMessage() .'}}';
    }
}

/*******************************************************
** FUNCION PARA MOSTRAR EL ULTIMO USUARIO CREADO **
********************************************************/
public static function obtenerUltimo(){
    try {
        $db=Db::getConnect();

        $select=$db->query("SELECT id_tareaje FROM tareaje ORDER BY id_tareaje DESC LIMIT 1");
        $camposs=$select->fetchAll();
        $campos = new Tareaje('',$camposs);
        $rubros = $campos->getCampos();
        foreach($rubros as $nrubro){
            $elrubro = $nrubro['id_tareaje'];
        }
        return $elrubro;
    }
    catch(PDOException $e) {
        echo '{"error en obtener la pagina":{"text":'. $e->getMessage() .'}}';
    }
}



/***************************************************************
 *** FUNCION PARA GUARDAR **
 ***************************************************************/
    public static function guardartrazabilidad($fechareporte, $creado_por, $estado_tareaje, $obtenerultimoid, $Mensaje, $marca_temporal)
    {
        try {

            $db       = Db::getConnect();
                $insert = $db->prepare('INSERT INTO trazabilidad_tareaje VALUES (NULL,:fecha_reporte,:usuario_creador,:estadotareje_id,:tareaje_id,:observaciones,:marca_temporal)');
                $insert->bindValue('fecha_reporte', utf8_encode($fechareporte));
                $insert->bindValue('usuario_creador', utf8_encode($creado_por));
                $insert->bindValue('estadotareje_id', utf8_encode($estado_tareaje));
                $insert->bindValue('tareaje_id', utf8_encode($obtenerultimoid));
                $insert->bindValue('observaciones', utf8_encode($Mensaje));
                $insert->bindValue('marca_temporal', utf8_encode($marca_temporal));
                $insert->execute();
            
           
        } catch (PDOException $e) {
            echo '{"error al guardar la configuraciónes ":{"text":' . $e->getMessage() . '}}';
        }
    }


/***************************************************************
 ** FUNCION PARA ELIINAR POR ID  **
 ***************************************************************/
    public static function cambiarestadoPor($id,$estado)
    {
        try {
            $db     = Db::getConnect();
            $select = $db->query("UPDATE tareaje SET estado_tareaje='".$estado."' WHERE id_tareaje='" . $id . "'");
            if ($select) {
                return true;
            } else {return false;}
        } catch (PDOException $e) {
            echo '{"error en obtener la pagina":{"text":' . $e->getMessage() . '}}';
        }
    }

/***************************************************************
 ** FUNCION PARA ELIINAR POR ID  **
 ***************************************************************/
    public static function actualizardatosservicio($origen,$destino,$km_inicial,$km_final,$nuevohorainicio,$nuevohorafinal,$total_km,$idservicio)
    {
        try {
            $db     = Db::getConnect();
            $select = $db->query("UPDATE tareaje SET origen='".utf8_decode($origen)."', destino='".utf8_decode($origen)."', km_inicial='".utf8_decode($km_inicial)."',km_final='".utf8_decode($km_final)."',total_km='".utf8_decode($total_km)."',hora_inicio='".utf8_decode($nuevohorainicio)."', hora_final='".utf8_decode($nuevohorafinal)."' WHERE id_tareaje='" . $idservicio . "'");
            if ($select) {
                return true;
            } else {return false;}
        } catch (PDOException $e) {
            echo '{"error en obtener la pagina":{"text":' . $e->getMessage() . '}}';
        }
    }

/*******************************************************
 ** FUNCION PARA MOSTRAR TODOS LOS CAMPOS DE FECHAS      **
 ********************************************************/

    public static function datostrazabilidad($id)
    {
        try {
            $db  = Db::getConnect();
            $sql = "SELECT * FROM trazabilidad_tareaje WHERE tareaje_id='" . $id . "' order by id DESC";
            //echo($sql);
            $select  = $db->query($sql);
            $camposs = $select->fetchAll();
            $campos  = new Tareaje('', $camposs);
            return $campos;
        } catch (PDOException $e) {
            echo '{"error en obtener la pagina":{"text":' . $e->getMessage() . '}}';
        }
    }
/*******************************************************
** FUNCION PARA MOSTRAR EL NOMBRE DEL USUARIO **
********************************************************/
public static function obtenerNombreUsuario($id){
	try {
		$db=Db::getConnect();

		$select=$db->query("SELECT nombre_usuario FROM usuarios WHERE id_usuario='".$id."'");
    	$camposs=$select->fetchAll();
    	$campos = new Tareaje('',$camposs);
    	$marcas = $campos->getCampos();
		foreach($marcas as $marca){
			$mar = $marca['nombre_usuario'];
		}
		return $mar;
	}
	catch(PDOException $e) {
		echo '{"error en obtener la pagina":{"text":'. $e->getMessage() .'}}';
	}
}


/*******************************************************
 ** FUNCION PARA MOSTRAR TODOS LOS CAMPOS POR RANGO DE FECHA      **
 ********************************************************/
    public static function Reporteporfecha($FechaStart, $FechaEnd)
    {
        try {
            $db = Db::getConnect();
            $sql = "SELECT * FROM tareaje WHERE tareaje_publicado='1' and fecha_reporte >='" . $FechaStart . "' and fecha_reporte <='" . $FechaEnd . "' order by fecha_reporte DESC";
            $select  = $db->query($sql);
            //echo ($sql);
            $camposs = $select->fetchAll();
            $campos  = new Tareaje('', $camposs);
            return $campos;
        } catch (PDOException $e) {
            echo '{"error en obtener la pagina":{"text":' . $e->getMessage() . '}}';
        }
    }

/*******************************************************
 ** FUNCION PARA MOSTRAR TODOS LOS CAMPOS POR RANGO DE FECHA      **
 ********************************************************/
    public static function ReporteporfechaConductor($FechaStart, $FechaEnd,$conductor,$estado)
    {
        try {
            $db = Db::getConnect();
            $sql = "SELECT * FROM tareaje WHERE tareaje_publicado='1' and fecha_reporte >='" . $FechaStart . "' and fecha_reporte <='" . $FechaEnd . "' and estado_tareaje='".$estado."' and conductor_id_conductor='".$conductor."' order by fecha_reporte ASC";
            $select  = $db->query($sql);
            //echo ($sql);
            $camposs = $select->fetchAll();
            $campos  = new Tareaje('', $camposs);
            return $campos;
        } catch (PDOException $e) {
            echo '{"error en obtener la pagina":{"text":' . $e->getMessage() . '}}';
        }
    }

/***************************************************************
 *** FUNCION PARA GUARDAR **
(`id_tareaje`, `cliente_id_cliente`, `operador_id_operador`, `equipo_id_equipo`, `usuario_id_usuario`, `fecha_reporte`, `hora_inicio`, `hora_final`, `origen`, `destino`, `observaciones`, `solicitado_por`, `creado_por`, `marca_temporal`, `estado_tareaje`, `tareaje_publicado`, `valor_servicio`, `estado_facturado`, `tipo_servicio`)
 ***************************************************************/
    public static function guardar($campos,$fechainicial)
    {
        try {

            $db = Db::getConnect();
            $campostraidos = $campos->getCampos();
			extract($campostraidos);

            $insert = $db->prepare('INSERT INTO tareaje VALUES (NULL,:cliente_id_cliente,:operador_id_operador,:equipo_id_equipo,:conductor_id_conductor,:fecha_reporte,:hora_inicio,:hora_final,:hora_extra,:km_inicial,:km_final,:total_km,:km_extra,:origen,:destino,:observaciones,:solicitado_por,:contacto,:creado_por, :marca_temporal, :estado_tareaje,:tareaje_publicado, :valor_servicio,:estado_facturado,:tipo_servicio)');

            $insert->bindValue('cliente_id_cliente', utf8_encode($cliente_id_cliente));
            $insert->bindValue('operador_id_operador', utf8_encode($operador_id_operador));
            $insert->bindValue('equipo_id_equipo', utf8_encode($equipo_id_equipo));
            $insert->bindValue('conductor_id_conductor', utf8_encode($conductor_id_conductor));
            $insert->bindValue('fecha_reporte', utf8_encode($fechainicial));
            $insert->bindValue('hora_inicio', utf8_encode($hora_inicio));
            $insert->bindValue('hora_final', utf8_encode($hora_final));
            $insert->bindValue('hora_extra', utf8_encode($hora_extra));
            $insert->bindValue('km_inicial', utf8_encode($km_inicial));
            $insert->bindValue('km_final', utf8_encode($km_final));
            $insert->bindValue('total_km', utf8_encode($total_km));
            $insert->bindValue('km_extra', utf8_encode($km_extra));
            $insert->bindValue('origen', utf8_encode($origen));
            $insert->bindValue('destino', utf8_encode($destino));
            $insert->bindValue('observaciones', utf8_encode($observaciones));
            $insert->bindValue('solicitado_por', utf8_encode($solicitado_por));
            $insert->bindValue('contacto', utf8_encode($contacto));
            $insert->bindValue('creado_por', utf8_encode($creado_por));
            $insert->bindValue('marca_temporal', utf8_encode($marca_temporal));
            $insert->bindValue('estado_tareaje', utf8_encode($estado_tareaje));
            $insert->bindValue('tareaje_publicado', utf8_encode($tareaje_publicado));
            $insert->bindValue('valor_servicio', utf8_encode($valor_servicio));
            $insert->bindValue('estado_facturado', utf8_encode($estado_facturado));
            $insert->bindValue('tipo_servicio', utf8_encode($tipo_servicio));
            $insert->execute();

            return true;
        } catch (PDOException $e) {
            echo '{"error":{"text":' . $e->getMessage() . '}}';
        }
    }



/***************************************************************
 ** FUNCION PARA ELIINAR POR ID  **
 ***************************************************************/
    public static function eliminarPor($id)
    {
        try {
            $db     = Db::getConnect();
            $select = $db->query("UPDATE tareaje FROM reporte_horasmq SET tareaje_publicado='0' WHERE id_tareaje='" . $id . "'");
            if ($select) {
                return true;
            } else {return false;}
        } catch (PDOException $e) {
            echo '{"error en obtener la pagina":{"text":' . $e->getMessage() . '}}';
        }
    }



/***************************************************************
 ** FUNCION PARA MOSTRAR TODOS LOS CAMPOS DE FILTRADOS POR ID  **
 ***************************************************************/
    public static function editarPor($id)
    {
        try {
            $db      = Db::getConnect();
            $select  = $db->query("SELECT * FROM tareaje WHERE id_tareaje='" . $id . "' and tareaje_publicado='1'");
            $camposs = $select->fetchAll();
            $campos  = new Tareaje('', $camposs);
            return $campos;
        } catch (PDOException $e) {
            echo '{"error en obtener la pagina":{"text":' . $e->getMessage() . '}}';
        }
    }

/********************************************************************
 *** FUNCION PARA MODIFICAR REPORTE DE EQUIPO ****
 *
 * (`id_tareaje`, `cliente_id_cliente`, `operador_id_operador`, `equipo_id_equipo`, `usuario_id_usuario`, `fecha_reporte`, `hora_inicio`, `hora_final`, `origen`, `destino`, `observaciones`, `solicitado_por`, `creado_por`, `marca_temporal`, `estado_tareaje`, `tareaje_publicado`, `valor_servicio`, `estado_facturado`, `tipo_servicio`)
 ********************************************************************/
    public static function actualizar($id, $campos)
    {
        try {
            $db            = Db::getConnect();
            $campostraidos = $campos->getCampos();
            extract($campostraidos);

            $update = $db->prepare('UPDATE tareaje SET
								cliente_id_cliente=:cliente_id_cliente,
								operador_id_operador=:operador_id_operador,
								equipo_id_equipo=:equipo_id_equipo,
								usuario_id_usuario=:usuario_id_usuario,
								fecha_reporte=:fecha_reporte,
								hora_inicio=:hora_inicio,
								hora_final=:hora_final,
								origen=:origen,
								destino=:destino,
								observaciones=:observaciones,
								solicitado_por=:solicitado_por,
								creado_por=:creado_por,
								marca_temporal=:marca_temporal,
								estado_tareaje=:estado_tareaje,
								tareaje_publicado=:tareaje_publicado,
								valor_servicio=:valor_servicio,
								estado_facturado=:estado_facturado,
								tipo_servicio=:tipo_servicio,
								WHERE id_tareaje=:id_tareaje');

            $update->bindValue('cliente_id_cliente', utf8_encode($cliente_id_cliente));
            $update->bindValue('operador_id_operador', utf8_encode($operador_id_operador));
            $update->bindValue('equipo_id_equipo', utf8_encode($equipo_id_equipo));
            $update->bindValue('usuario_id_usuario', utf8_encode($usuario_id_usuario));
            $update->bindValue('hora_inicio', utf8_encode($hora_inicio));
            $update->bindValue('hora_final', utf8_encode($hora_final));
            $update->bindValue('origen', utf8_encode($origen));
            $update->bindValue('destino', utf8_encode($destino));
            $update->bindValue('observaciones', utf8_encode($observaciones));
            $update->bindValue('creado_por', utf8_encode($creado_por));
            $update->bindValue('marca_temporal', utf8_encode($marca_temporal));
            $update->bindValue('estado_tareaje', utf8_encode($estado_tareaje));
            $update->bindValue('tareaje_publicado', utf8_encode($tareaje_publicado));
            $update->bindValue('valor_servicio', utf8_encode($valor_servicio));
            $update->bindValue('estado_facturado', utf8_encode($estado_facturado));
            $update->bindValue('tipo_servicio', utf8_encode($tipo_servicio));
            $update->bindValue('id_tareaje', utf8_encode($id));

            $update->execute();
            return true;
        } catch (PDOException $e) {
            echo '{"error al guardar la configuración ":{"text":' . $e->getMessage() . '}}';
        }
    }

}
