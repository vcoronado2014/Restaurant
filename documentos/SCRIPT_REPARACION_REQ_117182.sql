/*

SCRIPT QUE SOLUCIONA REQUERIMIENTO 117182, CREADO POR VICTOR CORONADO
23-06-2016, EL CUAL HABILITA LA POSIBILIDAD DE SACAR A UN PACIENTE
DEL BOX DE URGENCIA CUANDO APARECE EL MENSAJE "Atención Cerrada por Otro Funcionario"

*/
use RAYEN
--primero actualizamos el estado de la Atención a 1
update ATEN_ATENCION set ESTADO = 1 where IURG_ID = 4658010
--ahora eliminamos el registro en la atencion urgencia compacta
delete from auc_atencion_urgencia_compacta where aten_id = 164544876
