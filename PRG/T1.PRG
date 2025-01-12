select 1
use cadastro new shared
select 2
use empresto new shared
select 3
use devolve new shared

do while .not. eof()

select 1

temp = titulo
temp1 = registro
temp2 = midia

cls

@ 01,01 say 'Titulo:' + temp
@ 02,01 say 'Codigo:' + str(temp1)
@ 03,01 say 'Midia:' + midia

select 2

goto top

do while .not. eof()
temp3:=codigo
@ 04,01 say 'Codigo:' + str(temp3)
if titulo = temp
if midia = TEMP2
rlock()
replace codigo with temp1
flock()
endif
endif

skip +1

enddo

select 3

goto top

do while .not. eof()
temp4:=codigo
@ 05,01 say 'Codigo:' + str(temp4)
if titulo = temp
if midia = TEMP2
rlock()
replace codigo with temp1
flock()
endif
endif

skip +1
enddo

select 1

skip +1

enddo
