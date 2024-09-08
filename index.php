<?php
include_once("./headers.php");

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
require "./model/Eventos.php";
require "./model/Validator.php";

$quey = new EventIns();
$eventos = $quey->getAllEvents();

echo json_encode($eventos);


