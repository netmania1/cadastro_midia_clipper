select 1
use cadastro new
select 2
use devolve new

do while .not. eof()

select 1

temp = registro

cls

@ 02,01 say 'Codigo:' + str(temp)

select 2

locate for codigo = temp
if found()
select 1
replace devolve with .t.
endif

select 1

skip +1

enddo
