
use Savina_db_eng
/*
update que coorresponde a la versión 2 de la revisión
con Inti Paredes.

*/

update checkupModes set name = 'online-simultaneus' where slug = 'on-line-deferred'
update checkupModes set name = 'online-not simultaneus' where slug = 'on-line-simultaneous'
update checkupModes set name = 'rutine agenda' where slug = 'on-site'

update static_checkups set name = 'online-simultaneus' where slug = 'on-line-deferred'
update static_checkups set name = 'online-not simultaneus' where slug = 'on-line-simultaneous'
update static_checkups set name = 'rutine agenda' where slug = 'on-site'

update motives set name = 'I have doubts with the diagnosis' where slug = 'diagnosis-doubts'
update motives set name = 'Ihave doubts with the exam results' where slug = 'exam-results-doubts'
update motives set name = 'The patient is not evolving as expected' where slug = 'patient-not-evolving-as-expected'

update static_motives set name = 'I have doubts with the diagnosis' where slug = 'diagnosis-doubts'
update static_motives set name = 'Ihave doubts with the exam results' where slug = 'exam-results-doubts'
update static_motives set name = 'The patient is not evolving as expected' where slug = 'patient-not-evolving-as-expected'
