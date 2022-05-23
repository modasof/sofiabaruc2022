<?php
$hostname = "localhost";
$username = "u732693446_obinco2022";
$password = "Teksystem@80761478";
$database = "u732693446_obinco2022";
$conexion = new mysqli($hostname, $username, $password, $database);

if ($conn ->connect_error) {
die('Error de Conexión (' . $conn->connect_errno . ') '
. $conn->connect_error);
} 

