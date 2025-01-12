select 1
use cadastro new shared
select 2
use musica new shared

do while .not. eof()

select 1

temp = registro
temp1 = conjunto

cls

@ 02,01 say 'Codigo:' + str(temp)

select 2

goto top

do while .not. eof()
if cd = temp
rlock()
replace conjunto with temp1
flock()
endif

skip +1
enddo

select 1

skip +1

enddo
