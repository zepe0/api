<?php
include_once("../../headers.php");
require "../../model/ins.php";
require "../../model/Validator.php";
$json_data = file_get_contents('php://input');
$inputs = json_decode($json_data, true);

$rol = $inputs['rol'];
$tipo = $inputs['tipo'];
$fecha = $inputs['fecha'];

$quey = new Inscripcion();
$eventos = $quey->getAllParticipantes($rol, $tipo, $fecha);

echo json_encode($eventos);