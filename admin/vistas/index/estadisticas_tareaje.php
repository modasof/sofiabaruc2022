<?php 
function contarserviciosestado($estado,$FechaStart,$FechaEnd){
	$db = Db::getConnect();
	//$mesactual = date("n");
	$sql="SELECT COUNT(id_tareaje) AS totales FROM tareaje WHERE fecha_reporte >='".$FechaStart."' and fecha_reporte <='".$FechaEnd."' AND estado_tareaje='".$estado."' and tareaje_publicado='1';";
	$select = $db->prepare($sql);
	//echo($sql);
	$select->execute();
	$valor = $select->fetchAll(); 
	foreach($valor as $campo){
		$total = $campo['totales'];
		}
	return $total;
	}

function contarserviciosestadoconductor($estado,$FechaStart,$FechaEnd,$usuario){
	$db = Db::getConnect();
	//$mesactual = date("n");
	$sql="SELECT COUNT(id_tareaje) AS totales FROM tareaje WHERE fecha_reporte >='".$FechaStart."' and fecha_reporte <='".$FechaEnd."' AND estado_tareaje='".$estado."' and tareaje_publicado='1' and conductor_id_conductor='".$usuario."';";
	$select = $db->prepare($sql);
	//echo($sql);
	$select->execute();
	$valor = $select->fetchAll(); 
	foreach($valor as $campo){
		$total = $campo['totales'];
		}
	return $total;
	}





 ?>