# inicio do arquivo.

use master
go 

alter database DBPROD set emergency
go

dbcc checkdb('DBPROD')
go

alter database	DBPROD set single_user with rollback
immediate
go

dbcc checkdb('DBPROD',repair_allow_data_loss)
with no_infomsgs, all_errormsgs
go

alter database DBPROD set multi_user
go

exec sp_resetstatus 'DBPROD'

EXEC sp_resetstatus DBPROD
