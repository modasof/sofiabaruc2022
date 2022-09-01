<?php
//Include database configuration file
include '../../include/class.conexion.php';

if(isset($_POST["operador_id_operador"]) && !empty($_POST["operador_id_operador"])){
	$db=Db::getConnect();
	$select=$db->query("SELECT * FROM clientes WHERE operador_id_operador = '".$_POST['operador_id_operador']."' and estado_cliente='1'");
	$campo=$select->fetchAll();
	$i = 0;
	echo("<option value=''>Seleccionar Empresa</option>");
	foreach($campo as $campos){
		$i = $i+1;
		$nombre_cliente = $campos['nombre_cliente'];
		$id_cliente = $campos['id_cliente'];
		echo '<option value="'.$id_cliente.'">'.utf8_encode($nombre_cliente).'</option>';
	}

    $rowCount = $i;
    //Display states list
    if($rowCount > 0){
    }else{
        echo ("<option value=''>Operadora sin empresas</option>");
    }
}

?>
