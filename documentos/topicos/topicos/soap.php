<?php
$servicio = "http://www.rodriguezr.cl/tecweb/subtel/subtel.ws.php?wsdl";

function call_ws($wsdlurl)
{
	$login    = "";
	$password = "";
	
 	$client = new SoapClient($wsdlurl,
				array('login'      => $login,
					  'password'   => $password,
					  'trace'	   => true,
					  'exceptions' => true));
	
	return $client;
}

function consulta($servicio)
{
	$resultado = "";
	try
	{		
		$client = call_ws($servicio);
		$parametro=$_POST['celular'];
		$registros = $client->validaCelular($parametro);
		
		$resultado = $registros;		
	}
	catch(Exception $ex)
	{	echo "-**-".$ex;
	}	
	
	return($resultado);
}

?>

<?php	echo json_encode(consulta($servicio)); ?>
