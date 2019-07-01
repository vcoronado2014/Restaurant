<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>Topicos de Especialidad</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
function consultar(){
	$('#resultado1').val("CARGANDO : Espere un momento, PorFavor");
	$.post( "soap.php", { celular: $('#celular').val() })
	  .done(function( data ) {
			console.log(data);
			var json = $.parseJSON(data);
			$('#resultado1').html(json['estado']);
			$('#resultado2').html(json['compania']);
	  });
}
</script>
</head>

<body>
<input name="" id="celular" type="text"><input name="Consultar" type="button" onClick="consultar()"><br>
<p id="resultado1"></p><br>
<p id="resultado2"></p>
</body>
</html>
