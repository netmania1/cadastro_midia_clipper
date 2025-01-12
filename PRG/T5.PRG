set cursor off

select 1
use nome new shared
select 2
use devolve new shared

do while .not. eof()

select 1

temp2 = midia
temp1 = nome
temp  = registro

cls

@ 02,01 say 'Nome:' + temp1
@ 03,01 say 'Codigo:' + str(temp)
@ 04,01 say 'Midia:' + temp2

select 2
goto top
count to temp3 for codigo = temp
goto top

select 1
rlock()
replace total_em with temp3
flock()

temp3 = ""
temp2 = ""
temp1 = ""
temp  = ""

skip +1

enddo
