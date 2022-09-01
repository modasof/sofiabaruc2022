<?php
/**
* CLASE PARA TRABAJAR CON LOS MODELOS
*/
class Operadores
{
    private $id;
    private $campos; //devuelve todos los campos de la tabla


	function __construct($id,$campos)
	{
        $this->setId($id);
        $this->setCampos($campos);
	}

	/************************************************************************************
	** FUNCIONES PARA ESTABLECER Y OBTENER LAS VARIABLES DE LA TABLA       ***
	/***********************************************************************************/

	//ESTABLECER Y OBTENER ID
	public function getId(){
		return $this->id;
	}
	public function setId($id){ //Establece el nuevo valor del campo
		$this->id = $id;
	}

	//ESTABLECER Y OBTENER LOS CAMPOS
	public function getCampos(){
		return $this->campos;
	}
	public function setCampos($campos){ //Establece el nuevo valor del campo
		$this->campos = $campos;
	}


/*******************************************************
** FUNCION PARA MOSTRAR TODOS LOS CAMPOS	  **
********************************************************/
public static function obtenerPagina(){
	try {
		$db=Db::getConnect();
		$consulta="SELECT * FROM operadores WHERE estado_operador='1' order by nombre_operador asc";
		$select=$db->query($consulta);
		//echo($consulta);
    	$camposs=$select->fetchAll();
    	$campos = new Operadores('',$camposs);
		return $campos;
	}
	catch(PDOException $e) {
		echo '{"error en obtener la pagina":{"text":'. $e->getMessage() .'}}';
	}
}

/*******************************************************
** FUNCION PARA MOSTRAR EL NOMBRE DEL PRODUCTO **
********************************************************/
public static function validacionpor($nombre_operador){
	try {
		$db=Db::getConnect();

		$select=$db->query("SELECT COUNT(nombre_operador) AS total FROM operadores WHERE nombre_operador='".$nombre_operador."' and estado_operador='1'");
    	$camposs=$select->fetchAll();
    	$campos = new Operadores('',$camposs);
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




/***************************************************************
** FUNCION PARA MOSTRAR TODOS LOS CAMPOS DE FILTRADOS POR ID  **
***************************************************************/
public static function obtenerPaginaPor($id){
	try {
		$db=Db::getConnect();
		$select=$db->query("SELECT * FROM operadores WHERE id_operador='".$id."' and estado_operador='1'");
		$camposs=$select->fetchAll();
		$campos = new Operadores('',$camposs);
		return $campos;
	}
	catch(PDOException $e) {
		echo '{"error en obtener la pagina":{"text":'. $e->getMessage() .'}}';
	}
}


/***************************************************************
** FUNCION PARA ELIINAR POR ID  **
***************************************************************/
public static function eliminarPor($id){
	try {
		$db=Db::getConnect();
		$select=$db->query("UPDATE operadores SET estado_operador='0' WHERE id_operador='".$id."'");
		if ($select){
			return true;
			}else{return false;}
	}
	catch(PDOException $e) {
		echo '{"error en obtener la pagina":{"text":'. $e->getMessage() .'}}';
	}
}


/********************************************************************
*** FUNCION PARA MODIFICAR ****
********************************************************************/
public static function actualizar($id,$campos){
	try {
		$db=Db::getConnect();
		$campostraidos = $campos->getCampos();
		extract($campostraidos);

		$update=$db->prepare('UPDATE operadores SET
								nombre_operador=:nombre_operador,
								estado_operador=:estado_operador
								WHERE id=:id');
		$update->bindValue('nombre_operador',$nombre_operador);
		$update->bindValue('estado_operador',$estado_operador);
		$update->bindValue('id_operador',$id_operador);
		$update->execute();
		return true;
	}
	catch(PDOException $e) {
		echo '{"error al guardar la configuración ":{"text":'. $e->getMessage() .'}}';
	}
}


/***************************************************************
** FUNCION PARA ACTUALIZAR NONBRE  **
***************************************************************/
public static function actualizarNombre($campo,$id){
	try {
		$db=Db::getConnect();
		$select=$db->query("UPDATE operadores SET nombre_operador='".utf8_decode($campo)."' WHERE id_operador='".$id."'");
		if ($select){
			return true;
			}else{return false;}
	}
	catch(PDOException $e) {
		echo '{"error en obtener la pagina":{"text":'. $e->getMessage() .'}}';
	}
}
/***************************************************************
*** FUNCION PARA GUARDAR **
***************************************************************/
public static function guardar($campos){
	try {
		$db=Db::getConnect();
		$campostraidos = $campos->getCampos();
		extract($campostraidos);

		$insert=$db->prepare('INSERT INTO operadores VALUES (NULL,:nombre_operador,:estado_operador)');
		$insert->bindValue('nombre_operador',utf8_decode($nombre_operador));
		$insert->bindValue('estado_operador',utf8_decode($estado_operador));
		$insert->execute();

		return true;
	}
	catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}

/*******************************************************
** FUNCION PARA OBTENER LA LISTA DE CLIENTES	  **
********************************************************/
public static function obtenerLista(){
	try {
		$db=Db::getConnect();
		$select=$db->query("SELECT * FROM operadores WHERE estado_operador='1' order by nombre_operador");
    	$campos=$select->fetchAll();
		$camposs = new Operadores('',$campos);
		$campostraidos = $camposs->getCampos();
		return $campostraidos;
	}
	catch(PDOException $e) {
		echo '{"error en obtener la pagina":{"text":'. $e->getMessage() .'}}';
	}
}

/*******************************************************
** FUNCION PARA MOSTRAR EL NOMBRE DEL PRODUCTO **
********************************************************/
public static function obtenerNombre($id){
	try {
		$db=Db::getConnect();

		$select=$db->query("SELECT nombre_operador FROM operadores WHERE id_operador='".$id."'");
    	$camposs=$select->fetchAll();
    	$campos = new Operadores('',$camposs);
    	$marcas = $campos->getCampos();
		foreach($marcas as $marca){
			$mar = $marca['nombre_operador'];
		}
		return $mar;
	}
	catch(PDOException $e) {
		echo '{"error en obtener la pagina":{"text":'. $e->getMessage() .'}}';
	}
}

}




?>
