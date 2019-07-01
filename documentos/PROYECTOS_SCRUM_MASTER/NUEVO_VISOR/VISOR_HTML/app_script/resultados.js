$(document).ready(function () {
    function ViewModel(data) {
        var self = this;
        self.frmNombreUsuario =  ko.observable("Usuario de Prueba");
        self.frmFecha = ko.observable(moment(new Date()).format("DD-MM-YYYY"));
        self.frmUrlVisor = data;

    }
    /*
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:met="http://metodos.visor_cl.saydex.custom.com/">
   <soapenv:Header/>
   <soapenv:Body>
      <met:ObtenerURLVisorHCC>
         <parametro>
            <TipoIdentificacionPaciente>1</TipoIdentificacionPaciente>
            <NumeroIdentificacionPaciente>49467060</NumeroIdentificacionPaciente>
            <IdentificadorUnicoPaciente>10287370</IdentificadorUnicoPaciente>
            <IdentificadorProfesional>0</IdentificadorProfesional>
            <SistemaSolicitaConsulta>1</SistemaSolicitaConsulta>
         </parametro>
      </met:ObtenerURLVisorHCC>
   </soapenv:Body>
</soapenv:Envelope>

    var soapRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:met="http://metodos.visor_cl.saydex.custom.com/">' +
                 '<soapenv:Header/><soapenv:Body><met:ObtenerURLVisorHCC><parametro><TipoIdentificacionPaciente>1</TipoIdentificacionPaciente>' +
                 '<NumeroIdentificacionPaciente>49467060</NumeroIdentificacionPaciente><IdentificadorUnicoPaciente>10287370</IdentificadorUnicoPaciente>' +
                 '<IdentificadorProfesional>0</IdentificadorProfesional><SistemaSolicitaConsulta>1</SistemaSolicitaConsulta>' +
                 '</parametro></met:ObtenerURLVisorHCC></soapenv:Body></soapenv:Envelope>'; 
    */
    //var entidad = { UspId: '123123', IdRyf: '5714322', Run: '14696270k'};
    var runQuery = getParameterByName("RUN");
    var idQuery = getParameterByName("ID_RYF");
    var entidad = { UspId: '22222', IdRyf: idQuery, Run: runQuery};

    var obtenerUrlMirth = jQuery.ajax({
        url : ObtenerUrl('Visor'),
        type: 'POST',
        dataType : "json",
        contentType: "application/json",
        data: ko.toJSON(entidad)
    });
    
    $.when(obtenerUrlMirth).then(
        function(data){
            elem = document.getElementById('principal');
            ko.applyBindings(new ViewModel(data), elem);

        },
        function (){
            //alguna ha fallado
            alert("Error de Servidor");
        },
        function(){
            //acá podemos quitar el elemento cargando
            //alert('quitar cargando');
        }
    )


                 

        
        window.onload = function() {
            //soap();
            //fncAddTwoIntegers();
            //CallService();

        }
        function InitializeService(){
            service.useService("http://172.16.0.122:8111/services/Visor_CL?wsdl",  "ObtenerURLVisorHCC");
        }
        function ShowResult(){
            alert(event.result.value);
        }

        function soap() {
            var soapRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:met="http://metodos.visor_cl.saydex.custom.com/">' +
            '<soapenv:Header/><soapenv:Body><met:ObtenerURLVisorHCC><parametro><TipoIdentificacionPaciente>1</TipoIdentificacionPaciente>' +
            '<NumeroIdentificacionPaciente>49467060</NumeroIdentificacionPaciente><IdentificadorUnicoPaciente>10287370</IdentificadorUnicoPaciente>' +
            '<IdentificadorProfesional>0</IdentificadorProfesional><SistemaSolicitaConsulta>1</SistemaSolicitaConsulta>' +
            '</parametro></met:ObtenerURLVisorHCC></soapenv:Body></soapenv:Envelope>'; 

            var xmlhttp = new XMLHttpRequest();
            var url = ObtenerUrl();
            //replace second argument with the path to your Secret Server webservices
            xmlhttp.open('POST', url, true);
           
            //create the SOAP request
            //replace username, password (and org + domain, if necessary) with the appropriate info
            var strRequest = soapRequest;

            //specify request headers
            xmlhttp.setRequestHeader('Content-Type', 'text/xml; charset=utf-8');
            xmlhttp.setRequestHeader('SOAPAction', '');

            //FOR TESTING: display results in an alert box once the response is received
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {
                    alert(xmlhttp.responseText);
                }
            };

            //send the SOAP request
            xmlhttp.send(strRequest);
        }
        function fncAddTwoIntegers(){
            
            var soapRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:met="http://metodos.visor_cl.saydex.custom.com/">' +
            '<soapenv:Header/><soapenv:Body><met:ObtenerURLVisorHCC><parametro><TipoIdentificacionPaciente>1</TipoIdentificacionPaciente>' +
            '<NumeroIdentificacionPaciente>49467060</NumeroIdentificacionPaciente><IdentificadorUnicoPaciente>10287370</IdentificadorUnicoPaciente>' +
            '<IdentificadorProfesional>0</IdentificadorProfesional><SistemaSolicitaConsulta>1</SistemaSolicitaConsulta>' +
            '</parametro></met:ObtenerURLVisorHCC></soapenv:Body></soapenv:Envelope>'; 
            var oXmlHttp = new XMLHttpRequest();
            oXmlHttp.open("POST",ObtenerUrl(), false);
            oXmlHttp.setRequestHeader("Content-Type", "text/xml; charset=utf-8");
            oXmlHttp.setRequestHeader("SOAPAction", "http://tempuri.org/ObtenerURLVisorHCC");
            oXmlHttp.send(soapRequest);
            //return oXmlHttp.responseXML.selectSingleNode("//AddTwoIntegersResult").text;
            return oXmlHttp.responseXML;
        }
        function CallService() {
            var soapRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:met="http://metodos.visor_cl.saydex.custom.com/">' +
            '<soapenv:Header/><soapenv:Body><met:ObtenerURLVisorHCC><parametro><TipoIdentificacionPaciente>1</TipoIdentificacionPaciente>' +
            '<NumeroIdentificacionPaciente>49467060</NumeroIdentificacionPaciente><IdentificadorUnicoPaciente>10287370</IdentificadorUnicoPaciente>' +
            '<IdentificadorProfesional>0</IdentificadorProfesional><SistemaSolicitaConsulta>1</SistemaSolicitaConsulta>' +
            '</parametro></met:ObtenerURLVisorHCC></soapenv:Body></soapenv:Envelope>'; 

            var xmlDoc = $.parseXML(soapRequest);
            //alert(xmlDoc.document);

            /*
            $.ajax({
                url: ObtenerUrl(), 
                type: "POST",
                dataType: "xml", 
                data: soapRequest, 
                processData: false,
                contentType: "text/xml; charset=\"utf-8\"",
                success: OnSuccess, 
                error: OnError
            });
            */
            var header = new Headers({ 'Content-Type': 'application/xml; charset=utf-8' });
            /*
            {
                headers: new Headers({'Content-Type': 'application/json'})
              }
              */

            $.post(ObtenerUrl(), soapRequest, header)
                .done(function( data ) {
                alert( "Data Loaded: " + data );
              });
    
            return false;
        }
    
        function OnSuccess(data, status)   {
            alert(data.d);
        }
    
        function OnError(request, status, error) {
            alert('error');
        }


    });





