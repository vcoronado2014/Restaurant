$(document).ready(function () {
    function ViewModel(data) {
        var self = this;
        self.frmNombreUsuario =  ko.observable("Usuario de Prueba");
        self.frmFecha = ko.observable(moment(new Date()).format("DD-MM-YYYY"));
        self.frmRun = ko.observable();

    }

    buscar = function () {
        var run = $("#txtRun").val();
        var idRyf = '';
        if (run != ''){
            if (run == '70479591'){
                idRyf = '8910768';
                window.location.href = 'resultados.html?ID_RYF=' + idRyf + '&RUN='+ run;
            }
            else if(run == '213279572'){
                idRyf = '8359725';
                window.location.href = 'resultados.html?ID_RYF=' + idRyf + '&RUN='+ run;
            }
            else if (run == '73612519'){
                idRyf = '6363449';
                window.location.href = 'resultados.html?ID_RYF=' + idRyf + '&RUN='+ run;
            }
            else{
                alert('Rut no coincide');
            }
            
        }
        else{
            alert('rut no debe ir vacio');
        }

        //hay que parear el run con el idryf
        //enviar a resultados
        


    }
    elem = document.getElementById('principal');
    ko.applyBindings(new ViewModel([]), elem);

});