<?php 
    error_reporting(E_ALL);
    ini_set('display_errors', '1');
	require_once ('include/class.conexion.php');
	if (isset($_GET['controller'])&&isset($_GET['action'])) {
		$controller=$_GET['controller'];
		$action=$_GET['action'];
	}else{
		$controller='index';
		$action='index';
	}
	require_once('vistas/index/index.php');	
 ?>